Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8D69C77B7F
	for <intel-xe@archiver.kernel.org>; Fri,  5 May 2023 14:55:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9045310E624;
	Fri,  5 May 2023 14:55:37 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD39C10E624
 for <intel-xe@lists.freedesktop.org>; Fri,  5 May 2023 14:55:35 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0EADE60C32;
 Fri,  5 May 2023 14:55:35 +0000 (UTC)
Received: from rdvivi-mobl4 (unknown [192.55.54.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp.kernel.org (Postfix) with ESMTPSA id 3FB1EC433EF;
 Fri,  5 May 2023 14:55:32 +0000 (UTC)
Date: Fri, 5 May 2023 10:55:29 -0400
From: Rodrigo Vivi <rodrigo.vivi@kernel.org>
To: Stuart Summers <stuart.summers@intel.com>
Message-ID: <ZFUY4V2J1J+ZwYXt@rdvivi-mobl4>
References: <20230419175501.155319-1-stuart.summers@intel.com>
 <20230419175501.155319-4-stuart.summers@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230419175501.155319-4-stuart.summers@intel.com>
Subject: Re: [Intel-xe] [PATCH 3/4] drm/xe: Add new device configuration
 debugfs infrastructure
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Cc: lucas.demarchi@intel.com, matthew.d.roper@intel.com,
 intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Apr 19, 2023 at 05:55:00PM +0000, Stuart Summers wrote:
> The i915 driver defined an infrastructure for module parameters
> which would push these into debugfs for configurability at runtime
> with an eventual goal of removing those module parameters completely.

I wonder if we have here something that could become a more generic
infra in drm or even the core kernel...

> 
> There is a goal in the xe driver to avoid using module parameters
> altogether. However, we do need some way to configure the driver
> for debug purposes on a per-device level either before initializing
> the GPU or even during runtime in some cases.
> 
> Bring in the debugfs infrastructure being used in i915, but drop
> the references to module parameters.
> 
> This patch adds a dummy debugfs entry just to illustrate the new
> infrastructure here. It is intended that this will be replaced with
> actual driver-usable parameters in a future patch.
> 
> Signed-off-by: Stuart Summers <stuart.summers@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile            |   1 +
>  drivers/gpu/drm/xe/xe_debugfs_params.c | 235 +++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_debugfs_params.h |  14 ++
>  drivers/gpu/drm/xe/xe_device_types.h   |   4 +
>  drivers/gpu/drm/xe/xe_params.c         | 118 +++++++++++++
>  drivers/gpu/drm/xe/xe_params.h         |  40 +++++
>  drivers/gpu/drm/xe/xe_pci.c            |   6 +
>  7 files changed, 418 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_debugfs_params.c
>  create mode 100644 drivers/gpu/drm/xe/xe_debugfs_params.h
>  create mode 100644 drivers/gpu/drm/xe/xe_params.c
>  create mode 100644 drivers/gpu/drm/xe/xe_params.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 5799589d2634..6a8794578f21 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -67,6 +67,7 @@ xe-y += xe_bb.o \
>  	xe_mmio.o \
>  	xe_mocs.o \
>  	xe_module.o \
> +	xe_params.o \
>  	xe_pci.o \
>  	xe_pcode.o \
>  	xe_pm.o \
> diff --git a/drivers/gpu/drm/xe/xe_debugfs_params.c b/drivers/gpu/drm/xe/xe_debugfs_params.c
> new file mode 100644
> index 000000000000..9e7272ce153d
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_debugfs_params.c
> @@ -0,0 +1,235 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#include <linux/kernel.h>
> +
> +#include "xe_debugfs_params.h"
> +#include "xe_params.h"
> +
> +/* int param */
> +static int xe_param_int_show(struct seq_file *m, void *data)
> +{
> +	int *value = m->private;
> +
> +	seq_printf(m, "%d\n", *value);
> +
> +	return 0;
> +}
> +
> +static int xe_param_int_open(struct inode *inode, struct file *file)
> +{
> +	return single_open(file, xe_param_int_show, inode->i_private);
> +}
> +
> +static ssize_t xe_param_int_write(struct file *file,
> +				    const char __user *ubuf, size_t len,
> +				    loff_t *offp)
> +{
> +	struct seq_file *m = file->private_data;
> +	int *value = m->private;
> +	int ret;
> +
> +	ret = kstrtoint_from_user(ubuf, len, 0, value);
> +	if (ret) {
> +		/* support boolean values too */
> +		bool b;
> +
> +		ret = kstrtobool_from_user(ubuf, len, &b);
> +		if (!ret)
> +			*value = b;
> +	}
> +
> +	return ret ?: len;
> +}
> +
> +static const struct file_operations xe_param_int_fops = {
> +	.owner = THIS_MODULE,
> +	.open = xe_param_int_open,
> +	.read = seq_read,
> +	.write = xe_param_int_write,
> +	.llseek = default_llseek,
> +	.release = single_release,
> +};
> +
> +static const struct file_operations xe_param_int_fops_ro = {
> +	.owner = THIS_MODULE,
> +	.open = xe_param_int_open,
> +	.read = seq_read,
> +	.llseek = default_llseek,
> +	.release = single_release,
> +};
> +
> +/* unsigned int param */
> +static int xe_param_uint_show(struct seq_file *m, void *data)
> +{
> +	unsigned int *value = m->private;
> +
> +	seq_printf(m, "%u\n", *value);
> +
> +	return 0;
> +}
> +
> +static int xe_param_uint_open(struct inode *inode, struct file *file)
> +{
> +	return single_open(file, xe_param_uint_show, inode->i_private);
> +}
> +
> +static ssize_t xe_param_uint_write(struct file *file,
> +				     const char __user *ubuf, size_t len,
> +				     loff_t *offp)
> +{
> +	struct drm_xe_private *xe;
> +	struct seq_file *m = file->private_data;
> +	unsigned int *value = m->private;
> +	unsigned int old = *value;
> +	int ret;
> +
> +	ret = kstrtouint_from_user(ubuf, len, 0, value);
> +	if (ret) {
> +		/* support boolean values too */
> +		bool b;
> +
> +		ret = kstrtobool_from_user(ubuf, len, &b);
> +		if (!ret)
> +			*value = b;
> +	}
> +
> +	return ret ?: len;
> +}
> +
> +static const struct file_operations xe_param_uint_fops = {
> +	.owner = THIS_MODULE,
> +	.open = xe_param_uint_open,
> +	.read = seq_read,
> +	.write = xe_param_uint_write,
> +	.llseek = default_llseek,
> +	.release = single_release,
> +};
> +
> +static const struct file_operations xe_param_uint_fops_ro = {
> +	.owner = THIS_MODULE,
> +	.open = xe_param_uint_open,
> +	.read = seq_read,
> +	.llseek = default_llseek,
> +	.release = single_release,
> +};
> +
> +/* char * param */
> +static int xe_param_charp_show(struct seq_file *m, void *data)
> +{
> +	const char **s = m->private;
> +
> +	seq_printf(m, "%s\n", *s);
> +
> +	return 0;
> +}
> +
> +static int xe_param_charp_open(struct inode *inode, struct file *file)
> +{
> +	return single_open(file, xe_param_charp_show, inode->i_private);
> +}
> +
> +static ssize_t xe_param_charp_write(struct file *file,
> +				      const char __user *ubuf, size_t len,
> +				      loff_t *offp)
> +{
> +	struct seq_file *m = file->private_data;
> +	char **s = m->private;
> +	char *new, *old;
> +
> +	old = *s;
> +	new = strndup_user(ubuf, PAGE_SIZE);
> +	if (IS_ERR(new)) {
> +		len = PTR_ERR(new);
> +		goto out;
> +	}
> +
> +	*s = new;
> +
> +	kfree(old);
> +out:
> +	return len;
> +}
> +
> +static const struct file_operations xe_param_charp_fops = {
> +	.owner = THIS_MODULE,
> +	.open = xe_param_charp_open,
> +	.read = seq_read,
> +	.write = xe_param_charp_write,
> +	.llseek = default_llseek,
> +	.release = single_release,
> +};
> +
> +static const struct file_operations xe_param_charp_fops_ro = {
> +	.owner = THIS_MODULE,
> +	.open = xe_param_charp_open,
> +	.read = seq_read,
> +	.llseek = default_llseek,
> +	.release = single_release,
> +};
> +
> +#define RO(mode) (((mode) & 0222) == 0)
> +
> +static struct dentry *
> +xe_debugfs_create_int(const char *name, umode_t mode,
> +			struct dentry *parent, int *value)
> +{
> +	return debugfs_create_file_unsafe(name, mode, parent, value,
> +					  RO(mode) ? &xe_param_int_fops_ro :
> +					  &xe_param_int_fops);
> +}
> +
> +static struct dentry *
> +xe_debugfs_create_uint(const char *name, umode_t mode,
> +			 struct dentry *parent, unsigned int *value)
> +{
> +	return debugfs_create_file_unsafe(name, mode, parent, value,
> +					  RO(mode) ? &xe_param_uint_fops_ro :
> +					  &xe_param_uint_fops);
> +}
> +
> +static struct dentry *
> +xe_debugfs_create_charp(const char *name, umode_t mode,
> +			  struct dentry *parent, char **value)
> +{
> +	return debugfs_create_file(name, mode, parent, value,
> +				   RO(mode) ? &xe_param_charp_fops_ro :
> +				   &xe_param_charp_fops);
> +}
> +
> +#define _xe_param_create_file(parent, name, mode, valp)		\
> +	do {								\
> +		if (mode)						\
> +			_Generic(valp,					\
> +				 bool *: debugfs_create_bool,		\
> +				 int *: xe_debugfs_create_int,	\
> +				 unsigned int *: xe_debugfs_create_uint, \
> +				 unsigned long *: debugfs_create_ulong,	\
> +				 char **: xe_debugfs_create_charp)(name, mode, parent, valp); \
> +	} while(0)
> +
> +/* add a subdirectory with files for each xe param */
> +struct dentry *xe_debugfs_params(struct drm_xe_private *xe)
> +{
> +	struct drm_minor *minor = xe->drm.primary;
> +	struct xe_params *params = &xe->info.params;
> +	struct dentry *dir;
> +
> +	dir = debugfs_create_dir("xe_params", minor->debugfs_root);
> +	if (IS_ERR(dir))
> +		return dir;
> +
> +	/*
> +	 * Note: We could create files for params needing special handling
> +	 * here. Set mode in params to 0 to skip the generic create file, or
> +	 * just let the generic create file fail silently with -EEXIST.
> +	 */
> +
> +#define REGISTER(T, x, unused, mode, ...) _xe_param_create_file(dir, #x, mode, &params->x);
> +	XE_PARAMS_FOR_EACH(REGISTER);
> +#undef REGISTER
> +
> +	return dir;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_debugfs_params.h b/drivers/gpu/drm/xe/xe_debugfs_params.h
> new file mode 100644
> index 000000000000..d4f9b394a443
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_debugfs_params.h
> @@ -0,0 +1,14 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#ifndef __XE_DEBUGFS_PARAMS__
> +#define __XE_DEBUGFS_PARAMS__
> +
> +struct dentry;
> +struct drm_xe_private;
> +
> +struct dentry *xe_debugfs_params(struct drm_xe_private *xe);
> +
> +#endif /* __XE_DEBUGFS_PARAMS__ */
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index a02c4eb6bd0d..6847fb2d035c 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -15,6 +15,7 @@
>  #include "xe_gt_types.h"
>  #include "xe_platform_types.h"
>  #include "xe_step_types.h"
> +#include "xe_params.h"
>  
>  #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
>  #include "ext/intel_device_info.h"
> @@ -152,6 +153,9 @@ struct xe_device {
>  			u32 rawclk_freq;
>  		} display;
>  #endif
> +
> +		/* device_info params configurable through debugfs */
> +		struct xe_params params;
>  	} info;
>  
>  	/** @irq: device interrupt state */
> diff --git a/drivers/gpu/drm/xe/xe_params.c b/drivers/gpu/drm/xe/xe_params.c
> new file mode 100644
> index 000000000000..7c8f4e07b49c
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_params.c
> @@ -0,0 +1,118 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#include <linux/string_helpers.h>
> +
> +#include <drm/drm_print.h>
> +
> +#include "xe_params.h"
> +
> +struct xe_params xe_modparams __read_mostly = {
> +#define MEMBER(T, member, value, ...) .member = (value),
> +	XE_PARAMS_FOR_EACH(MEMBER)
> +#undef MEMBER
> +};
> +
> +/*
> + * Note: As a rule, keep module parameter sysfs permissions read-only
> + * 0400. Runtime changes are only supported through xe debugfs.
> + *
> + * For any exceptions requiring write access and runtime changes through module
> + * parameter sysfs, prevent debugfs file creation by setting the parameter's
> + * debugfs mode to 0.
> + */
> +
> +static void _param_print_bool(struct drm_printer *p, const char *name,
> +			      bool val)
> +{
> +	drm_printf(p, "xe.%s=%s\n", name, str_yes_no(val));
> +}
> +
> +static void _param_print_int(struct drm_printer *p, const char *name,
> +			     int val)
> +{
> +	drm_printf(p, "xe.%s=%d\n", name, val);
> +}
> +
> +static void _param_print_uint(struct drm_printer *p, const char *name,
> +			      unsigned int val)
> +{
> +	drm_printf(p, "xe.%s=%u\n", name, val);
> +}
> +
> +static void _param_print_ulong(struct drm_printer *p, const char *name,
> +			       unsigned long val)
> +{
> +	drm_printf(p, "xe.%s=%lu\n", name, val);
> +}
> +
> +static void _param_print_charp(struct drm_printer *p, const char *name,
> +			       const char *val)
> +{
> +	drm_printf(p, "xe.%s=%s\n", name, val);
> +}
> +
> +#define _param_print(p, name, val)				\
> +	_Generic(val,						\
> +		 bool: _param_print_bool,			\
> +		 int: _param_print_int,				\
> +		 unsigned int: _param_print_uint,		\
> +		 unsigned long: _param_print_ulong,		\
> +		 char *: _param_print_charp)(p, name, val)
> +
> +/**
> + * xe_params_dump - dump xe modparams
> + * @params: xe modparams
> + * @p: the &drm_printer
> + *
> + * Pretty printer for xe modparams.
> + */
> +void xe_params_dump(const struct xe_params *params, struct drm_printer *p)
> +{
> +#define PRINT(T, x, ...) _param_print(p, #x, params->x);
> +	XE_PARAMS_FOR_EACH(PRINT);
> +#undef PRINT
> +}
> +
> +static void _param_dup_charp(char **valp)
> +{
> +	*valp = kstrdup(*valp, GFP_ATOMIC);
> +}
> +
> +static void _param_nop(void *valp)
> +{
> +}
> +
> +#define _param_dup(valp)				\
> +	_Generic(valp,					\
> +		 char **: _param_dup_charp,		\
> +		 default: _param_nop)(valp)
> +
> +void xe_params_copy(struct xe_params *dest, const struct xe_params *src)
> +{
> +	*dest = *src;
> +#define DUP(T, x, ...) _param_dup(&dest->x);
> +	XE_PARAMS_FOR_EACH(DUP);
> +#undef DUP
> +}
> +
> +static void _param_free_charp(char **valp)
> +{
> +	kfree(*valp);
> +	*valp = NULL;
> +}
> +
> +#define _param_free(valp)				\
> +	_Generic(valp,					\
> +		 char **: _param_free_charp,		\
> +		 default: _param_nop)(valp)
> +
> +/* free the allocated members, *not* the passed in params itself */
> +void xe_params_free(struct xe_params *params)
> +{
> +#define FREE(T, x, ...) _param_free(&params->x);
> +	XE_PARAMS_FOR_EACH(FREE);
> +#undef FREE
> +}
> diff --git a/drivers/gpu/drm/xe/xe_params.h b/drivers/gpu/drm/xe/xe_params.h
> new file mode 100644
> index 000000000000..26fb592e9cd6
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_params.h
> @@ -0,0 +1,40 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#ifndef _XE_PARAMS_H_
> +#define _XE_PARAMS_H_
> +
> +#include <linux/bitops.h>
> +#include <linux/cache.h> /* for __read_mostly */
> +
> +struct drm_printer;
> +
> +/*
> + * Invoke param, a function-like macro, for each xe param, with arguments:
> + *
> + * param(type, name, value, mode)
> + *
> + * type: parameter type, one of {bool, int, unsigned int, unsigned long, char *}
> + * name: name of the parameter
> + * value: initial/default value of the parameter
> + * mode: debugfs file permissions, one of {0400, 0600, 0}, use 0 to not create
> + *       debugfs file
> + */
> +#define XE_PARAMS_FOR_EACH(param) \
> +	param(bool, dummy, true, 0444)
> +
> +#define MEMBER(T, member, ...) T member;
> +struct xe_params {
> +	XE_PARAMS_FOR_EACH(MEMBER);
> +};
> +#undef MEMBER
> +
> +extern struct xe_params xe_modparams __read_mostly;
> +
> +void xe_params_dump(const struct xe_params *params, struct drm_printer *p);
> +void xe_params_copy(struct xe_params *dest, const struct xe_params *src);
> +void xe_params_free(struct xe_params *params);
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index f8ca179254fa..11da5abe587f 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -22,6 +22,8 @@
>  #include "xe_module.h"
>  #include "xe_pm.h"
>  #include "xe_step.h"
> +#include "xe_params.h"
> +#include "xe_debugfs.h"
>  
>  #define DEV_INFO_FOR_EACH_FLAG(func) \
>  	func(require_force_probe); \
> @@ -370,6 +372,8 @@ static void xe_pci_remove(struct pci_dev *pdev)
>  	if (!xe) /* driver load aborted, nothing to cleanup */
>  		return;
>  
> +	xe_params_free(&xe->info.params);
> +
>  	xe_device_remove(xe);
>  	xe_pm_runtime_fini(xe);
>  	pci_set_drvdata(pdev, NULL);
> @@ -406,6 +410,8 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>  	if (IS_ERR(xe))
>  		return PTR_ERR(xe);
>  
> +	xe_params_copy(&xe->info.params, &xe_modparams);
> +
>  	xe->info.graphics_verx100 = desc->graphics_ver * 100 +
>  				    desc->graphics_rel;
>  	xe->info.media_verx100 = desc->media_ver * 100 +
> -- 
> 2.38.1.143.g1fc3c0ad40
> 
