Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA398C71133
	for <intel-xe@archiver.kernel.org>; Fri, 25 Aug 2023 11:58:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8037810E663;
	Fri, 25 Aug 2023 11:58:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00A5C10E65C;
 Fri, 25 Aug 2023 11:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692964680; x=1724500680;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JZf/OOa21y1nQzKaG3iYeLutQOMYVsmT7VW2sgOZHqM=;
 b=kVQ1di4dF+347mv1XMk6uDIUsRUIAl1ovdp52uMlSqlUpVowJsrAdXBf
 mC5b/W1lj0bcSbrHtdxa6MHVtJza1gNyE3FxWo8dPdlbjYXvADzN2cdjY
 3yDA0RyyVcIQz+bUyTgXxCOoByUlXCctZTwVz+SZkitAQzWm25WSNSw+B
 xycl5HSUGyUvJJmUAguy40UbpLOxQgVTt4AXc9fPn36LIOkoomQOlP9Gv
 aNU3cpZL/G05hEKaCLqWQgbeIxBjEMFveS2mMrvnsjQ/OSpFMNDDI2xQ2
 T45oS/8tlzTpNQK11g+X2RzZIRMyOs7Rww2GeMKm0Flz3yTxe+8HBO7fX w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="441044817"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; d="scan'208";a="441044817"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2023 04:57:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="851937496"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; d="scan'208";a="851937496"
Received: from aravind-dev.iind.intel.com ([10.145.162.80])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2023 04:57:58 -0700
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 25 Aug 2023 17:32:05 +0530
Message-Id: <20230825120205.802246-2-aravind.iddamsetty@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230825120205.802246-1-aravind.iddamsetty@linux.intel.com>
References: <20230825120205.802246-1-aravind.iddamsetty@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC i-g-t v2 1/1] tools/RAS: A tool to read error
 counters
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
Cc: igt-dev@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This tool demonstrates the use of netlink sockets to query and read the
error counters on a hardware. It provides following commands LIST_ERRORS,
READ_ONE, READ_ALL to read counters and WAIT_ON_EVENT to wait for
occurrence on a particular event, presently hardcoded to wait on
occurrence of correctable error event and read a error counter.

v2: update uapi header.

Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
---
 include/drm-uapi/drm_netlink.h |  66 ++++++
 meson.build                    |   4 +
 tools/drm_ras.c                | 403 +++++++++++++++++++++++++++++++++
 tools/meson.build              |   5 +
 4 files changed, 478 insertions(+)
 create mode 100644 include/drm-uapi/drm_netlink.h
 create mode 100644 tools/drm_ras.c

diff --git a/include/drm-uapi/drm_netlink.h b/include/drm-uapi/drm_netlink.h
new file mode 100644
index 000000000..b37f95295
--- /dev/null
+++ b/include/drm-uapi/drm_netlink.h
@@ -0,0 +1,66 @@
+/*
+ * Copyright 2023 Intel Corporation
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * VA LINUX SYSTEMS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ */
+
+#ifndef _DRM_NETLINK_H_
+#define _DRM_NETLINK_H_
+
+#define DRM_GENL_VERSION 1
+#define DRM_GENL_MCAST_GROUP_NAME_CORR_ERR	"drm_corr_err"
+#define DRM_GENL_MCAST_GROUP_NAME_UNCORR_ERR	"drm_uncorr_err"
+
+#if defined(__cplusplus)
+extern "C" {
+#endif
+
+enum error_cmds {
+	DRM_CMD_UNSPEC,
+	/* command to list all errors names with config-id */
+	DRM_RAS_CMD_QUERY,
+	/* command to get a counter for a specific error */
+	DRM_RAS_CMD_READ_ONE,
+	/* command to get counters of all errors */
+	DRM_RAS_CMD_READ_ALL,
+	DRM_RAS_CMD_ERROR_EVENT,
+
+	__DRM_CMD_MAX,
+	DRM_CMD_MAX = __DRM_CMD_MAX - 1,
+};
+
+enum error_attr {
+	DRM_ATTR_UNSPEC,
+	DRM_ATTR_PAD = DRM_ATTR_UNSPEC,
+	DRM_RAS_ATTR_REQUEST, /* NLA_U8 */
+	DRM_RAS_ATTR_QUERY_REPLY, /* NLA_NESTED */
+	DRM_RAS_ATTR_ERROR_NAME, /* NLA_NUL_STRING */
+	DRM_RAS_ATTR_ERROR_ID, /* NLA_U64 */
+	DRM_RAS_ATTR_ERROR_VALUE, /* NLA_U64 */
+
+	__DRM_ATTR_MAX,
+	DRM_ATTR_MAX = __DRM_ATTR_MAX - 1,
+};
+
+#if defined(__cplusplus)
+}
+#endif
+
+#endif
diff --git a/meson.build b/meson.build
index 7360634fe..269a9310f 100644
--- a/meson.build
+++ b/meson.build
@@ -141,6 +141,10 @@ cairo = dependency('cairo', version : '>1.12.0', required : true)
 libudev = dependency('libudev', required : true)
 glib = dependency('glib-2.0', required : true)
 
+libnl = dependency('libnl-3.0', required: false)
+libnl_genl = dependency('libnl-genl-3.0', required: false)
+libnl_cli = dependency('libnl-cli-3.0', required:false)
+
 xmlrpc = dependency('xmlrpc', required : false)
 xmlrpc_util = dependency('xmlrpc_util', required : false)
 xmlrpc_client = dependency('xmlrpc_client', required : false)
diff --git a/tools/drm_ras.c b/tools/drm_ras.c
new file mode 100644
index 000000000..739cf009e
--- /dev/null
+++ b/tools/drm_ras.c
@@ -0,0 +1,403 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2021 Intel Corporation
+ */
+
+#include <stdio.h>
+#include <sys/types.h>
+#include <unistd.h>
+#include <getopt.h>
+#include <linux/genetlink.h>
+#include <netlink/cli/utils.h>
+
+#include "drm_netlink.h"
+#include "igt_device_scan.h"
+
+#define ARRAY_SIZE(array) (sizeof(array) / sizeof((array)[0]))
+
+struct nl_sock *sock, *mcsock;
+int family_id;
+
+enum opt_val {
+	OPT_UNKNOWN = '?',
+	OPT_END = -1,
+	OPT_DEVICE,
+	OPT_CONFIG,
+	OPT_HELP,
+};
+
+enum cmd_ids {
+	INVALID_CMD = -1,
+	LIST_ERRORS = 0,
+	READ_ONE,
+	READ_ALL,
+	WAIT_ON_EVENT,
+
+	__MAX_CMDS,
+};
+
+static const char * const cmd_names[] = {
+	"LIST_ERRORS",
+	"READ_ONE",
+	"READ_ALL",
+	"WAIT_ON_EVENT",
+};
+
+static void help(char **argv)
+{
+	int i;
+
+	printf("Usage: %s command [<command options>]\n", argv[0]);
+	printf("commands:\n");
+
+	for (i = 0; i < __MAX_CMDS; i++) {
+		switch (i) {
+		case LIST_ERRORS:
+		case READ_ALL:
+		case WAIT_ON_EVENT:
+			printf("%s %s --device=<device filter>\n", argv[0], cmd_names[i]);
+			break;
+		case READ_ONE:
+			printf("%s %s --device=<device filter> --error_id=<id returned from query>\n", argv[0], cmd_names[i]);
+			break;
+		}
+	}
+
+	igt_device_print_filter_types();
+}
+
+static int list_errors(struct nl_cache_ops *ops, struct genl_cmd *cmd,
+		       struct genl_info *info, void *arg)
+{
+	const struct nlmsghdr *nlh = info->nlh;
+	struct nlattr *nla;
+	int len, remain;
+
+	len = GENL_HDRLEN;
+
+	nlmsg_for_each_attr(nla, nlh, len, remain) {
+		if ((nla_type(nla) == DRM_RAS_ATTR_QUERY_REPLY) && nla_is_nested(nla)) {
+			struct nlattr *cur;
+			int rem;
+
+			if (cmd->c_id == DRM_RAS_CMD_READ_ALL)
+				printf("%-50s\t%-18s\t%s\n", "name", "config-id", "counter");
+			else
+				printf("%-50s\t%-18s\n", "name", "config-id");
+
+			nla_for_each_nested(cur, nla, rem) {
+				switch (nla_type(cur)) {
+				case DRM_RAS_ATTR_ERROR_NAME:
+					printf("\n%-50s", nla_get_string(cur));
+					break;
+				case DRM_RAS_ATTR_ERROR_ID:
+					printf("\t0x%016lx", nla_get_u64(cur));
+					break;
+				case DRM_RAS_ATTR_ERROR_VALUE:
+					printf("\t%lu", nla_get_u64(cur));
+					break;
+				default:
+					break;
+				}
+			}
+			printf("\n");
+		}
+	}
+
+	return NL_OK;
+}
+
+static int read_single(struct nl_cache_ops *ops, struct genl_cmd *cmd,
+		       struct genl_info *info, void *arg)
+{
+	if (!info->attrs[DRM_RAS_ATTR_ERROR_VALUE])
+		nl_cli_fatal(NLE_FAILURE, "DRM_RAS_ATTR_ERROR_VALUE attribute is missing");
+
+	printf("counter value %lu\n", nla_get_u64(info->attrs[DRM_RAS_ATTR_ERROR_VALUE]));
+
+	return NL_OK;
+}
+
+static int mcast_event_handler(struct nl_cache_ops *ops, struct genl_cmd *cmd,
+			       struct genl_info *info, void *arg)
+{
+	struct nl_msg *msg;
+	uint64_t config = 0x0000000000000005; /* error-gt0-correctable-eu-grf */
+	void *msg_head;
+	int ret;
+
+	printf("error event received\n");
+
+	msg = nlmsg_alloc();
+	if (!msg)
+		nl_cli_fatal(NLE_INVAL, "nlmsg_alloc failed\n");
+
+	msg_head = genlmsg_put(msg, NL_AUTO_PORT, NL_AUTO_SEQ, family_id, 0, 0, DRM_RAS_CMD_READ_ONE, 1);
+	if (!msg_head)
+		nl_cli_fatal(ENOMEM, "genlmsg_put failed\n");
+
+	nla_put_u64(msg, DRM_RAS_ATTR_ERROR_ID, config);
+
+	ret = nl_send_auto(sock, msg);
+	if (ret < 0)
+		nl_cli_fatal(ret, "Unable to send message: %s", nl_geterror(ret));
+
+	ret = nl_recvmsgs_default(sock);
+	if (ret < 0)
+		nl_cli_fatal(ret, "Unable to receive message: %s", nl_geterror(ret));
+
+	nlmsg_free(msg);
+
+	return NL_OK;
+}
+
+static struct nla_policy drm_genl_policy[DRM_ATTR_MAX + 1] = {
+	[DRM_RAS_ATTR_REQUEST] = { .type = NLA_U8 },
+	[DRM_RAS_ATTR_QUERY_REPLY] = { .type = NLA_NESTED },
+	[DRM_RAS_ATTR_ERROR_NAME] = { .type = NLA_NUL_STRING },
+	[DRM_RAS_ATTR_ERROR_ID] = { .type = NLA_U64 },
+	[DRM_RAS_ATTR_ERROR_VALUE] = { .type = NLA_U64 },
+};
+
+static struct genl_cmd drm_genl_cmds[] = {
+	{
+		.c_id           = DRM_RAS_CMD_QUERY,
+		.c_name         = "QUERY",
+		.c_maxattr      = DRM_ATTR_MAX,
+		.c_attr_policy  = drm_genl_policy,
+		.c_msg_parser   = list_errors,
+	},
+	{
+		.c_id           = DRM_RAS_CMD_READ_ONE,
+		.c_name         = "READ_1",
+		.c_maxattr      = DRM_ATTR_MAX,
+		.c_attr_policy  = drm_genl_policy,
+		.c_msg_parser   = read_single,
+	},
+	{
+		.c_id           = DRM_RAS_CMD_READ_ALL,
+		.c_name         = "READ_ALL",
+		.c_maxattr      = DRM_ATTR_MAX,
+		.c_attr_policy  = drm_genl_policy,
+		.c_msg_parser   = list_errors,
+	},
+	{
+		.c_id           = DRM_RAS_CMD_ERROR_EVENT,
+		.c_name         = "ERROR_EVENT",
+		.c_maxattr      = DRM_ATTR_MAX,
+		.c_attr_policy  = drm_genl_policy,
+		.c_msg_parser   = mcast_event_handler,
+	},
+};
+
+static struct genl_ops drm_genl_ops = {
+	.o_hdrsize	= 0,
+	.o_cmds		= drm_genl_cmds,
+	.o_ncmds	= ARRAY_SIZE(drm_genl_cmds),
+};
+
+static void send_cmd(int cmd, uint64_t config)
+{
+	struct nl_msg *msg;
+	void *msg_head;
+	int ret;
+
+	msg = nlmsg_alloc();
+	if (!msg)
+		nl_cli_fatal(NLE_INVAL, "nlmsg_alloc failed\n");
+
+	msg_head = genlmsg_put(msg, NL_AUTO_PORT, NL_AUTO_SEQ, family_id, 0, 0, cmd, 1);
+	if (!msg_head)
+		nl_cli_fatal(ENOMEM, "genlmsg_put failed\n");
+	switch (cmd) {
+	case DRM_RAS_CMD_QUERY:
+		nla_put_u8(msg, DRM_RAS_ATTR_REQUEST, 1);
+		break;
+	case DRM_RAS_CMD_READ_ONE:
+		nla_put_u64(msg, DRM_RAS_ATTR_ERROR_ID, config);
+		break;
+	case DRM_RAS_CMD_READ_ALL:
+		nla_put_u8(msg, DRM_RAS_ATTR_REQUEST, 1);
+		break;
+	default:
+		break;
+	}
+
+	ret = nl_send_auto(sock, msg);
+	if (ret < 0)
+		nl_cli_fatal(ret, "Unable to send message: %s", nl_geterror(ret));
+
+	ret = nl_recvmsgs_default(sock);
+	if (ret < 0)
+		nl_cli_fatal(ret, "Unable to receive message: %s", nl_geterror(ret));
+
+	nlmsg_free(msg);
+}
+
+static int get_cmd(char *cmd_name)
+{
+	int i;
+
+	if (!cmd_name)
+		return -1;
+
+	for (i = 0; i < __MAX_CMDS; i++) {
+		if (strcasecmp(cmd_name, cmd_names[i]) == 0)
+			return i;
+	}
+
+	return -1;
+}
+
+int main(int argc, char **argv)
+{
+	char *endptr;
+	enum opt_val val;
+	enum cmd_ids cmd;
+	char *device = NULL;
+	uint64_t error_config_id;
+	int  ret, mcgrp, index;
+	struct igt_device_card card;
+	char *dev_name, *dup;
+
+	static struct option options[] = {
+		{"device",	required_argument,	NULL,	OPT_DEVICE},
+		{"error_id",	required_argument,	NULL,	OPT_CONFIG},
+		{"help",	no_argument,		NULL,	OPT_HELP},
+		{ 0 }
+	};
+
+	cmd = get_cmd(argv[1]);
+	if (cmd < 0) {
+		fprintf(stderr, "invalid command\n");
+		help(argv);
+		exit(EXIT_FAILURE);
+	}
+
+	for (val = 0; val != OPT_END; ) {
+		val = getopt_long(argc, argv, "", options, &index);
+
+		switch (val) {
+		case OPT_DEVICE:
+			device = strdup(optarg);
+			break;
+		case OPT_CONFIG:
+			error_config_id = strtoull(optarg, &endptr, 16);
+			if (*endptr) {
+				fprintf(stderr, "invalid config id %s\n", optarg);
+				exit(EXIT_FAILURE);
+			}
+			break;
+		case OPT_HELP:
+			help(argv);
+			exit(EXIT_FAILURE);
+		case OPT_END:
+			break;
+		case OPT_UNKNOWN:
+			exit(EXIT_FAILURE);
+		}
+	}
+
+	if (!device) {
+		fprintf(stderr, "missing device option\n");
+		help(argv);
+		exit(EXIT_FAILURE);
+	} else {
+		ret = igt_device_card_match_pci(device, &card);
+		if (!ret) {
+			fprintf(stderr, "device %s not found!\n", device);
+			exit(EXIT_FAILURE);
+		}
+		free(device);
+	}
+
+	/* get card name */
+	dup = strdup(card.card);
+
+	while (dup)
+		dev_name = strsep(&dup, "/");
+	free(dup);
+
+	drm_genl_ops.o_name = strdup(dev_name);
+
+	sock = nl_cli_alloc_socket();
+	if (!sock)
+		nl_cli_fatal(NLE_NOMEM, "Cannot allocate nl_sock");
+
+	ret = nl_cli_connect(sock, NETLINK_GENERIC);
+	if (ret < 0)
+		nl_cli_fatal(ret, "Cannot connect handle");
+
+	ret = genl_register_family(&drm_genl_ops);
+	if (ret < 0)
+		nl_cli_fatal(ret, "Cannot register xe family");
+
+	ret = genl_ops_resolve(sock, &drm_genl_ops);
+	if (ret < 0)
+		nl_cli_fatal(ret, "Unable to resolve family name");
+
+	family_id = genl_ctrl_resolve(sock, drm_genl_ops.o_name);
+	if (family_id < 0)
+		nl_cli_fatal(NLE_INVAL, "Resolving of \"%s\" failed", drm_genl_ops.o_name);
+
+	ret = nl_socket_modify_cb(sock, NL_CB_VALID, NL_CB_CUSTOM, genl_handle_msg, NULL);
+	if (ret < 0)
+		nl_cli_fatal(ret, "Unable to modify valid message callback");
+
+	switch (cmd) {
+	case LIST_ERRORS:
+		send_cmd(DRM_RAS_CMD_QUERY, 0);
+		break;
+	case READ_ONE:
+		send_cmd(DRM_RAS_CMD_READ_ONE, error_config_id);
+		break;
+	case READ_ALL:
+		send_cmd(DRM_RAS_CMD_READ_ALL, 0);
+		break;
+	case WAIT_ON_EVENT:
+		mcsock = nl_cli_alloc_socket();
+		if (!mcsock)
+			nl_cli_fatal(NLE_NOMEM, "Cannot allocate nl_sock");
+
+		ret = nl_cli_connect(mcsock, NETLINK_GENERIC);
+		if (ret < 0)
+			nl_cli_fatal(ret, "Cannot connect handle");
+
+		ret = genl_ops_resolve(mcsock, &drm_genl_ops);
+		if (ret < 0)
+			nl_cli_fatal(ret, "Unable to resolve family name");
+
+		nl_socket_disable_seq_check(mcsock);
+
+		mcgrp = genl_ctrl_resolve_grp(mcsock, drm_genl_ops.o_name,
+					      DRM_GENL_MCAST_GROUP_NAME_CORR_ERR);
+		if (mcgrp < 0)
+			nl_cli_fatal(mcgrp, "failed to resolve generic netlink multicast group");
+
+		/* Join the multicast group. */
+		ret = nl_socket_add_membership(mcsock, mcgrp);
+		if (ret < 0)
+			nl_cli_fatal(ret, "failed to join multicast group");
+
+		ret = nl_socket_modify_cb(mcsock, NL_CB_VALID, NL_CB_CUSTOM, genl_handle_msg, NULL);
+		if (ret < 0)
+			nl_cli_fatal(ret, "Unable to modify valid message callback");
+
+		printf("waiting for error event\n");
+		ret = nl_recvmsgs_default(mcsock);
+		if (ret < 0)
+			nl_cli_fatal(ret, "Unable to receive message: %s", nl_geterror(ret));
+
+		nl_close(mcsock);
+		nl_socket_free(mcsock);
+		break;
+	default:
+		break;
+	}
+
+	nl_close(sock);
+	nl_socket_free(sock);
+
+	return 0;
+}
+
diff --git a/tools/meson.build b/tools/meson.build
index 4c45f16b9..a53d3917f 100644
--- a/tools/meson.build
+++ b/tools/meson.build
@@ -107,5 +107,10 @@ if libudev.found()
 			install : true)
 endif
 
+executable('drm_ras', 'drm_ras.c',
+           dependencies : [tool_deps, libnl, libnl_cli, libnl_genl],
+           install_rpath : bindir_rpathdir,
+           install : true)
+
 subdir('i915-perf')
 subdir('null_state_gen')
-- 
2.25.1

