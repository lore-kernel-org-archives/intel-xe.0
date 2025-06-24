Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADF06C77B7F
	for <intel-xe@archiver.kernel.org>; Tue, 24 Jun 2025 13:41:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C4EF10E5AF;
	Tue, 24 Jun 2025 13:41:24 +0000 (UTC)
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com
 [209.85.210.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5213E10E5B0
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Jun 2025 13:41:18 +0000 (UTC)
Received: by mail-ot1-f48.google.com with SMTP id
 46e09a7af769-72c16e658f4so3041718a34.1
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Jun 2025 06:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1750772477; x=1751377277; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
 :to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=9hpwa0JDrScKcOzTuCWX6BzMr27AQ60ja08V3b6kazw=;
 b=YmHKpsvMduD5RARsD5Mfa//pFkKUnntLM0MID+6LZVPaOWaUr6PUJwwVOR3Shqo9SA
 lSwdF3iWhGGDW39eAVeFwHN4nm/pkxX8iRcrXjzMxv4+uZ8CqgL7YC44ylNRU8DaGqsx
 Aj3bC65zXyD5MozCTTkSzNxi86PV6K+DXg4EWRPiYL8p2I1ghVFrmg/9ZEtQs88cYmS/
 C/OLLUEOjvhyGHfUpHQ/YW7ZhfyX/3yL3hsAfXGuP86vm0tA+5l2jDWj7BulPOusbMpD
 olyhHlsbrGOjWCFq0ZnWw7MYw8BjzfpMI/DNbYE5PszmwYUOAVT8+q2An2yW8EPVPMDo
 hMQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750772477; x=1751377277;
 h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
 :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9hpwa0JDrScKcOzTuCWX6BzMr27AQ60ja08V3b6kazw=;
 b=bgMTyM22S1s5lydn69Lqd4+B3skB0E/6P3ynmMJC0T8suVPYIqeBMRLUngbaUnLEKQ
 dLHdC3+/ZLfLHMJtvjumHI1seX5gg1d3QtnQyNlq0H9QJvAsuDeEK0LQLHdDAkeKnlSv
 t0Gb95WSy01HAUybNj24tLwWUx3PlB/DvFqNeh6timTjfB4qTN3uFlVRUkmf3f1fHHWZ
 gSsd4b66lwBbNTsvttFLwAaxkFXXBq11+nxgdYE/kqEKKUAWoemJ3JQ90oH8zs27dHNw
 q2pN28TJP6AnPO/CaT5T0/u5rHuH1QV01l6Nt/0bOrccEvHKWkPuNgN6v7nhDCaTLVfr
 jGRw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU1e5xjDlqsawA9Furp3JX+SO4O7qjCiNESOI0+xjqInWn3aaQogyo0FmRuRfkyAKQAlAlzeUHXng==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyI6CvvlaH7cRkeuTWHmskBD7CPV2EW0BJqbbDxy+Mve9SqejE1
 VHhpd6m4VLRKvV4rZbgP/JcItpe6j0lxwMFSazKwvNCZALHbFWBUY4mYjwBAlHyArko=
X-Gm-Gg: ASbGncuxQg5krt9YYpr9K39Jw5qwqW+blJsEzRzjYu/f5vJGZM7NdLXCgzQr4QDq5L9
 9UWo/czxcY3WNGU/FdJOpoLGVUJ/vi/ehADq4lr2q35Pgx1v/g51I90GveD3mAyNdH3kmedKDQX
 eoQcUoiQIsgaIEMNYme5RkJO2gQAQgmia8rfj3s8A7N1+qKraEHjTPdl+cmnxTzV2LlU5nhn8EO
 zv2SAERAFkI2md7/yXXSmAS14DI5AKixwoaxRe7rnAznFxuLgw7N+bXp9jp5t2huY8Z6kiH/0Iu
 lcVEd4RRiMGpS2hsY0PPiOrdYHeCj6TGVyBJdWlcbpMievWN7cn1pptqOl17MAyIMMkJRV4+Xnm
 jv3EU
X-Google-Smtp-Source: AGHT+IEiuhdW8/sSiJzR1DxhRU/+og+q0UhK5YrSTANwnnO94EH7OfmpA0IaX4cQg+vq2e5zOFcNyQ==
X-Received: by 2002:a05:6870:179c:b0:2e9:8ed9:16fc with SMTP id
 586e51a60fabf-2eedba8115cmr10962084fac.11.1750772477122; 
 Tue, 24 Jun 2025 06:41:17 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:8c3f:8b5f:5c74:76a9])
 by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2eead8e17c1sm2067862fac.44.2025.06.24.06.41.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jun 2025 06:41:15 -0700 (PDT)
Date: Tue, 24 Jun 2025 16:41:13 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Badal Nilawar <badal.nilawar@intel.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, alexander.usyskin@intel.com,
 gregkh@linuxfoundation.org, daniele.ceraolospurio@intel.com, jgg@nvidia.com
Subject: Re: [PATCH v3 09/10] drm/xe/xe_late_bind_fw: Extract and print
 version info
Message-ID: <aa407944-588c-4514-9523-6f13a989f4ae@suswa.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250618190007.2932322-10-badal.nilawar@intel.com>
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi Badal,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Badal-Nilawar/mei-bus-add-mei_cldev_mtu-interface/20250619-025825
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20250618190007.2932322-10-badal.nilawar%40intel.com
patch subject: [PATCH v3 09/10] drm/xe/xe_late_bind_fw: Extract and print version info
config: i386-randconfig-141-20250623 (https://download.01.org/0day-ci/archive/20250624/202506241449.WdiucfJp-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202506241449.WdiucfJp-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/xe/xe_late_bind_fw.c:90 parse_cpd_header() error: uninitialized symbol 'offset'.
drivers/gpu/drm/xe/xe_late_bind_fw.c:155 parse_lb_layout() error: uninitialized symbol 'offset'.

Old smatch warnings:
drivers/gpu/drm/xe/xe_late_bind_fw.c:195 xe_late_bind_wait_for_worker_completion() warn: inconsistent indenting

vim +/offset +90 drivers/gpu/drm/xe/xe_late_bind_fw.c

f9ea24fb9528adc Badal Nilawar 2025-06-19   49  static int parse_cpd_header(struct xe_late_bind *late_bind, u32 fw_id,
f9ea24fb9528adc Badal Nilawar 2025-06-19   50  			    const void *data, size_t size, const char *manifest_entry)
f9ea24fb9528adc Badal Nilawar 2025-06-19   51  {
f9ea24fb9528adc Badal Nilawar 2025-06-19   52  	struct xe_device *xe = late_bind_to_xe(late_bind);
f9ea24fb9528adc Badal Nilawar 2025-06-19   53  	const struct gsc_cpd_header_v2 *header = data;
f9ea24fb9528adc Badal Nilawar 2025-06-19   54  	const struct gsc_manifest_header *manifest;
f9ea24fb9528adc Badal Nilawar 2025-06-19   55  	const struct gsc_cpd_entry *entry;
f9ea24fb9528adc Badal Nilawar 2025-06-19   56  	size_t min_size = sizeof(*header);
f9ea24fb9528adc Badal Nilawar 2025-06-19   57  	struct xe_late_bind_fw *lb_fw;
f9ea24fb9528adc Badal Nilawar 2025-06-19   58  	u32 offset;
                                                ^^^^^^^^^^^

f9ea24fb9528adc Badal Nilawar 2025-06-19   59  	int i;
f9ea24fb9528adc Badal Nilawar 2025-06-19   60  
f9ea24fb9528adc Badal Nilawar 2025-06-19   61  	if (fw_id >= MAX_FW_ID)
f9ea24fb9528adc Badal Nilawar 2025-06-19   62  		return -EINVAL;
f9ea24fb9528adc Badal Nilawar 2025-06-19   63  	lb_fw = &late_bind->late_bind_fw[fw_id];
f9ea24fb9528adc Badal Nilawar 2025-06-19   64  
f9ea24fb9528adc Badal Nilawar 2025-06-19   65  	/* manifest_entry is mandatory */
f9ea24fb9528adc Badal Nilawar 2025-06-19   66  	xe_assert(xe, manifest_entry);
f9ea24fb9528adc Badal Nilawar 2025-06-19   67  
f9ea24fb9528adc Badal Nilawar 2025-06-19   68  	if (size < min_size || header->header_marker != GSC_CPD_HEADER_MARKER)
f9ea24fb9528adc Badal Nilawar 2025-06-19   69  		return -ENOENT;
f9ea24fb9528adc Badal Nilawar 2025-06-19   70  
f9ea24fb9528adc Badal Nilawar 2025-06-19   71  	if (header->header_length < sizeof(struct gsc_cpd_header_v2)) {
f9ea24fb9528adc Badal Nilawar 2025-06-19   72  		drm_err(&xe->drm, "%s late binding fw: Invalid CPD header length %u!\n",
f9ea24fb9528adc Badal Nilawar 2025-06-19   73  			fw_id_to_name[lb_fw->id], header->header_length);
f9ea24fb9528adc Badal Nilawar 2025-06-19   74  		return -EINVAL;
f9ea24fb9528adc Badal Nilawar 2025-06-19   75  	}
f9ea24fb9528adc Badal Nilawar 2025-06-19   76  
f9ea24fb9528adc Badal Nilawar 2025-06-19   77  	min_size = header->header_length + sizeof(struct gsc_cpd_entry) * header->num_of_entries;
f9ea24fb9528adc Badal Nilawar 2025-06-19   78  	if (size < min_size) {
f9ea24fb9528adc Badal Nilawar 2025-06-19   79  		drm_err(&xe->drm, "%s late binding fw: too small! %zu < %zu\n",
f9ea24fb9528adc Badal Nilawar 2025-06-19   80  			fw_id_to_name[lb_fw->id], size, min_size);
f9ea24fb9528adc Badal Nilawar 2025-06-19   81  		return -ENODATA;
f9ea24fb9528adc Badal Nilawar 2025-06-19   82  	}
f9ea24fb9528adc Badal Nilawar 2025-06-19   83  
f9ea24fb9528adc Badal Nilawar 2025-06-19   84  	/* Look for the manifest first */
f9ea24fb9528adc Badal Nilawar 2025-06-19   85  	entry = (void *)header + header->header_length;
f9ea24fb9528adc Badal Nilawar 2025-06-19   86  	for (i = 0; i < header->num_of_entries; i++, entry++)
f9ea24fb9528adc Badal Nilawar 2025-06-19   87  		if (strcmp(entry->name, manifest_entry) == 0)
f9ea24fb9528adc Badal Nilawar 2025-06-19   88  			offset = entry->offset & GSC_CPD_ENTRY_OFFSET_MASK;
                                                                ^^^^^^^^
Only initialized if found.

f9ea24fb9528adc Badal Nilawar 2025-06-19   89  
f9ea24fb9528adc Badal Nilawar 2025-06-19  @90  	if (!offset) {
                                                     ^^^^^^
Uninitialized.

It's a good idea for developers to set CONFIG_INIT_STACK_ALL_PATTERN=y
in their testing.

f9ea24fb9528adc Badal Nilawar 2025-06-19   91  		drm_err(&xe->drm, "%s late binding fw: Failed to find manifest_entry\n",
f9ea24fb9528adc Badal Nilawar 2025-06-19   92  			fw_id_to_name[lb_fw->id]);
f9ea24fb9528adc Badal Nilawar 2025-06-19   93  		return -ENODATA;
f9ea24fb9528adc Badal Nilawar 2025-06-19   94  	}
f9ea24fb9528adc Badal Nilawar 2025-06-19   95  
f9ea24fb9528adc Badal Nilawar 2025-06-19   96  	min_size = offset + sizeof(struct gsc_manifest_header);
f9ea24fb9528adc Badal Nilawar 2025-06-19   97  	if (size < min_size) {
f9ea24fb9528adc Badal Nilawar 2025-06-19   98  		drm_err(&xe->drm, "%s late binding fw: too small! %zu < %zu\n",
f9ea24fb9528adc Badal Nilawar 2025-06-19   99  			fw_id_to_name[lb_fw->id], size, min_size);
f9ea24fb9528adc Badal Nilawar 2025-06-19  100  		return -ENODATA;
f9ea24fb9528adc Badal Nilawar 2025-06-19  101  	}
f9ea24fb9528adc Badal Nilawar 2025-06-19  102  
f9ea24fb9528adc Badal Nilawar 2025-06-19  103  	manifest = data + offset;
f9ea24fb9528adc Badal Nilawar 2025-06-19  104  
f9ea24fb9528adc Badal Nilawar 2025-06-19  105  	lb_fw->version.major = manifest->fw_version.major;
f9ea24fb9528adc Badal Nilawar 2025-06-19  106  	lb_fw->version.minor = manifest->fw_version.minor;
f9ea24fb9528adc Badal Nilawar 2025-06-19  107  	lb_fw->version.hotfix = manifest->fw_version.hotfix;
f9ea24fb9528adc Badal Nilawar 2025-06-19  108  	lb_fw->version.build = manifest->fw_version.build;
f9ea24fb9528adc Badal Nilawar 2025-06-19  109  
f9ea24fb9528adc Badal Nilawar 2025-06-19  110  	return 0;
f9ea24fb9528adc Badal Nilawar 2025-06-19  111  }
f9ea24fb9528adc Badal Nilawar 2025-06-19  112  
f9ea24fb9528adc Badal Nilawar 2025-06-19  113  /* Refer to the "Late Bind based Firmware Layout" documentation entry for details */
f9ea24fb9528adc Badal Nilawar 2025-06-19  114  static int parse_lb_layout(struct xe_late_bind *late_bind, u32 fw_id,
f9ea24fb9528adc Badal Nilawar 2025-06-19  115  			   const void *data, size_t size, const char *fpt_entry)
f9ea24fb9528adc Badal Nilawar 2025-06-19  116  {
f9ea24fb9528adc Badal Nilawar 2025-06-19  117  	struct xe_device *xe = late_bind_to_xe(late_bind);
f9ea24fb9528adc Badal Nilawar 2025-06-19  118  	const struct csc_fpt_header *header = data;
f9ea24fb9528adc Badal Nilawar 2025-06-19  119  	const struct csc_fpt_entry *entry;
f9ea24fb9528adc Badal Nilawar 2025-06-19  120  	size_t min_size = sizeof(*header);
f9ea24fb9528adc Badal Nilawar 2025-06-19  121  	struct xe_late_bind_fw *lb_fw;
f9ea24fb9528adc Badal Nilawar 2025-06-19  122  	u32 offset;
f9ea24fb9528adc Badal Nilawar 2025-06-19  123  	int i;
f9ea24fb9528adc Badal Nilawar 2025-06-19  124  
f9ea24fb9528adc Badal Nilawar 2025-06-19  125  	if (fw_id >= MAX_FW_ID)
f9ea24fb9528adc Badal Nilawar 2025-06-19  126  		return -EINVAL;
f9ea24fb9528adc Badal Nilawar 2025-06-19  127  
f9ea24fb9528adc Badal Nilawar 2025-06-19  128  	lb_fw = &late_bind->late_bind_fw[fw_id];
f9ea24fb9528adc Badal Nilawar 2025-06-19  129  
f9ea24fb9528adc Badal Nilawar 2025-06-19  130  	/* fpt_entry is mandatory */
f9ea24fb9528adc Badal Nilawar 2025-06-19  131  	xe_assert(xe, fpt_entry);
f9ea24fb9528adc Badal Nilawar 2025-06-19  132  
f9ea24fb9528adc Badal Nilawar 2025-06-19  133  	if (size < min_size || header->header_marker != CSC_FPT_HEADER_MARKER)
f9ea24fb9528adc Badal Nilawar 2025-06-19  134  		return -ENOENT;
f9ea24fb9528adc Badal Nilawar 2025-06-19  135  
f9ea24fb9528adc Badal Nilawar 2025-06-19  136  	if (header->header_length < sizeof(struct csc_fpt_header)) {
f9ea24fb9528adc Badal Nilawar 2025-06-19  137  		drm_err(&xe->drm, "%s late binding fw: Invalid FPT header length %u!\n",
f9ea24fb9528adc Badal Nilawar 2025-06-19  138  			fw_id_to_name[lb_fw->id], header->header_length);
f9ea24fb9528adc Badal Nilawar 2025-06-19  139  		return -EINVAL;
f9ea24fb9528adc Badal Nilawar 2025-06-19  140  	}
f9ea24fb9528adc Badal Nilawar 2025-06-19  141  
f9ea24fb9528adc Badal Nilawar 2025-06-19  142  	min_size = header->header_length + sizeof(struct csc_fpt_entry) * header->num_of_entries;
f9ea24fb9528adc Badal Nilawar 2025-06-19  143  	if (size < min_size) {
f9ea24fb9528adc Badal Nilawar 2025-06-19  144  		drm_err(&xe->drm, "%s late binding fw: too small! %zu < %zu\n",
f9ea24fb9528adc Badal Nilawar 2025-06-19  145  			fw_id_to_name[lb_fw->id], size, min_size);
f9ea24fb9528adc Badal Nilawar 2025-06-19  146  		return -ENODATA;
f9ea24fb9528adc Badal Nilawar 2025-06-19  147  	}
f9ea24fb9528adc Badal Nilawar 2025-06-19  148  
f9ea24fb9528adc Badal Nilawar 2025-06-19  149  	/* Look for the manifest first */
f9ea24fb9528adc Badal Nilawar 2025-06-19  150  	entry = (void *)header + header->header_length;
f9ea24fb9528adc Badal Nilawar 2025-06-19  151  	for (i = 0; i < header->num_of_entries; i++, entry++)
f9ea24fb9528adc Badal Nilawar 2025-06-19  152  		if (strcmp(entry->name, fpt_entry) == 0)
f9ea24fb9528adc Badal Nilawar 2025-06-19  153  			offset = entry->offset;
f9ea24fb9528adc Badal Nilawar 2025-06-19  154  
f9ea24fb9528adc Badal Nilawar 2025-06-19 @155  	if (!offset) {

Same.

f9ea24fb9528adc Badal Nilawar 2025-06-19  156  		drm_err(&xe->drm, "%s late binding fw: Failed to find fpt_entry\n",
f9ea24fb9528adc Badal Nilawar 2025-06-19  157  			fw_id_to_name[lb_fw->id]);
f9ea24fb9528adc Badal Nilawar 2025-06-19  158  		return -ENODATA;
f9ea24fb9528adc Badal Nilawar 2025-06-19  159  	}
f9ea24fb9528adc Badal Nilawar 2025-06-19  160  
f9ea24fb9528adc Badal Nilawar 2025-06-19  161  	min_size = offset + sizeof(struct gsc_cpd_header_v2);
f9ea24fb9528adc Badal Nilawar 2025-06-19  162  	if (size < min_size) {
f9ea24fb9528adc Badal Nilawar 2025-06-19  163  		drm_err(&xe->drm, "%s late binding fw: too small! %zu < %zu\n",
f9ea24fb9528adc Badal Nilawar 2025-06-19  164  			fw_id_to_name[lb_fw->id], size, min_size);
f9ea24fb9528adc Badal Nilawar 2025-06-19  165  		return -ENODATA;
f9ea24fb9528adc Badal Nilawar 2025-06-19  166  	}
f9ea24fb9528adc Badal Nilawar 2025-06-19  167  
f9ea24fb9528adc Badal Nilawar 2025-06-19  168  	return parse_cpd_header(late_bind, fw_id, data + offset, size - offset, "LTES.man");
f9ea24fb9528adc Badal Nilawar 2025-06-19  169  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

