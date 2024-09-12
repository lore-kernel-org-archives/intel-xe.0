Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF860EEE26B
	for <intel-xe@archiver.kernel.org>; Thu, 12 Sep 2024 21:45:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E5EA10E99A;
	Thu, 12 Sep 2024 21:45:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Kg/yTl8M";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B174F10E99A
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Sep 2024 21:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726177515; x=1757713515;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=WH3Bn/V2x3i5HrDIWD1w0lMLpfT+Ok4tV9V6SYNHOU4=;
 b=Kg/yTl8MKpB0tHUp0ZAucIGmVRAdYF79tQyx+4lfTMoXJIQneKHNtwFA
 FcwK43KDqry8VJF17Pg21vNPLtG8BRCPry3GZc8o2ciq+rjHmFTSCeI61
 mzm9DpDYNlxWXj2mulfgirr3d3x10XY24CA82PzsUb6QfamWpAcjfnl2U
 8kmdwcSXq4jvlPWk9XDXhcknVBGdlOM/DNvq72hvPKzgIUA2S+enF6Sg1
 Ct8v5OUcYGIIySjfPRO+FZTZGVU9R8mB3Tb1ybWGraUKxyjIlmILigehq
 fPCYRgcNnby2UEueX57H+jFHwWuwyFiZ3tZkR1BD52aKcFzIbnzPFy0Lq A==;
X-CSE-ConnectionGUID: 7Vi1QKpGT+ObhW/V4iu1FQ==
X-CSE-MsgGUID: g1yKJhVMTPaoEpZbxhRYkw==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="24548853"
X-IronPort-AV: E=Sophos;i="6.10,224,1719903600"; d="scan'208";a="24548853"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2024 14:45:14 -0700
X-CSE-ConnectionGUID: QqcjAFVxTRea0m83pPv6pg==
X-CSE-MsgGUID: 8+D6LnaQRDuzSodL2Y39sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,224,1719903600"; d="scan'208";a="68363754"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Sep 2024 14:45:14 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 12 Sep 2024 14:45:13 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 12 Sep 2024 14:45:13 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 12 Sep 2024 14:45:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A5u3a0rUqfVHAKXkjcoKYr6on54whYXqvTDvieHtX/X93Hd83GtmQeUXgFXDs8ywE1wd1sMNtoestiTq0vGxtMvGiIt8/z0cNtsNgyeq1/fIUdMhuNb11EYDyKzZVdX7tkNWgU1WwJsYNjHSMU2uJlTA1wu7JBbJDbTuHd8cyO8IVTpC7CFj4+B0aAGr1Rd0ZM9MYNfB72xI5khDc5q1xd3ex+/sYfGBuUYFNw9kBkscLrq/1Ib6w2XhrdXRUQsPveDyw7x5RKX7aC4pfZGx4x+zeSwqSerhgSzxRnDfFVL1s6JOjR0fd2Gzb4Or7rtFK4RCLyHnI3ZG0welZjcHJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w3n4ye00Jz9WrQb5DP9GxIpS7CXkMp8Tpu8pDS7aiDE=;
 b=MQyUlmYmrkgpI9zx0k0gs4Kx/gsPn2TodQP8VO3weZMD/pUAnTTDlT4fGWkeIwJbKd1R6Sw8NG5JQfiq7PX4JxIkLK8ywFDZ94UoVzzmAsHXkVjS3ho7qUdQd2BUxGSwsY6E/DKp+22ezxXdBH/63NlwVMMBn5S19arO7aseKdizzv4NtrKrR8g4lIaijwqdfqSKftRqB1i2btY9XdRpcfnJm3+rUNYKsDWrodsUDjHjXCyOYtFnO7rzeZVLdahjZtnk/tJ1DI/ZzGQzYLdtIZ2RN1LLEKn/muwglVu1IXFAQ6G3zmwz3CLYAXh251uO20ZyfT/BRf3zgNjPW3vKYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by PH7PR11MB5984.namprd11.prod.outlook.com (2603:10b6:510:1e3::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.25; Thu, 12 Sep
 2024 21:45:11 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7918.024; Thu, 12 Sep 2024
 21:45:11 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: [PATCH] drm/xe: Restore pci state upon resume
Date: Thu, 12 Sep 2024 17:45:07 -0400
Message-ID: <20240912214507.456897-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.46.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4PR03CA0306.namprd03.prod.outlook.com
 (2603:10b6:303:dd::11) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|PH7PR11MB5984:EE_
X-MS-Office365-Filtering-Correlation-Id: fe88aa29-8612-4858-5088-08dcd3742d52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?RHe5HBCob1of5TP1xhAeXJ8WBFy/3p8UKsN2zd38vuiZfG4mlxNoKall2pox?=
 =?us-ascii?Q?I1Jfs4nSoP4q1sK+wyTEE5zItbPoWLK234+mFpYqP8iiriEibJnmWrP0ZjVL?=
 =?us-ascii?Q?TCIbopBgYhqhXoqIn3Jk0J6ftmtWvllUtn/J4yM7uDplsstfCarA6/CMi/2D?=
 =?us-ascii?Q?te0o42sNTZfTy80lFhA1kxrvN04dqPnsx6a/Zz2PW49c4x54grSe9bq93I6o?=
 =?us-ascii?Q?rI2Vq+NI3vanHGz7N7HRKyabjLLmkPyB/mzjuZ6optrGElM4YoLRqSOgZNte?=
 =?us-ascii?Q?y3tNqPgLUMJF5iWEjoxOC2//Mc8fgLxQgt8wJJgfhL21eByJJQnGwLMoKJtx?=
 =?us-ascii?Q?aTo317MXDtTEefrXknPCR+idty5RVCG/9nW/+X3PP20iKQmKDH6gap2rHniP?=
 =?us-ascii?Q?wa3lVBrYF2tSJcMdHaB+Opn9JO8vmMdOc6Z31UGn8LOyvKqSyv8zCf4qt8kH?=
 =?us-ascii?Q?eb6YbSvT17/EJzi5OH+o+sf1E9IAW3UgFOWLAcV0IGTCxiBcndi/QThEDser?=
 =?us-ascii?Q?7peplwjHzX8oOaYrQ0fkRgt4q+qZvcd3mpXd2m3BgVlgeU7iC9C0Se4KMYUP?=
 =?us-ascii?Q?L9Q0leXnsC6eBdbO+0S04rDOEvLIrzlmOsPI1OqIZuNH63yNkU1tNDYkKTLx?=
 =?us-ascii?Q?jNYb+ifg0XTNGMkBt6NuQvIwKgvX1KB2RDG+O85CHGJVK3zdFhIXmtDMlR6e?=
 =?us-ascii?Q?oygkmGYgvISwbamm9WRR5jklAbZb0pPTJxI1g/RGD23Z+zobLEUdmq6aCBry?=
 =?us-ascii?Q?VSGjfCN08Z3JOZ9C+bLKWr/1n6INHxbUpTrpwxu/ePqj/lSHOP+kGwNxDnRE?=
 =?us-ascii?Q?RiaEGJ17yHlhHZe0Xv62Y76Obd6xT/SzL1q3qpt6KKOLi1xhxsKYFG+0RYqq?=
 =?us-ascii?Q?+56BALi4+melpibnnXCY+fjUisDpmfJntY46D+9/o8edwIO7YObGFy0hQNGn?=
 =?us-ascii?Q?deQp7oUz3oBE9KqXuG7dN3+sCSXDnOunpQzwInyFYwdJAL5AX4OH9tuyCn65?=
 =?us-ascii?Q?ejhH3D0tkup7ogHwV0fJudhtuuZB62Mqnr10EHJVZ1efYr0PTjgZwjm0vkOu?=
 =?us-ascii?Q?/cjPvIpV4Oh+gX8qYH5Hdifg8yO/HkB1TYOzIZ6BRXxSnGciKdILW5Uq2qNS?=
 =?us-ascii?Q?LhQs367brbEDBX8zCUXPFYCYPnvJXK2EYFeONArJQ7PuzJbpXxX1KZCmfzRd?=
 =?us-ascii?Q?2yDZIYe1GWh6iMf+C3IJloq53Mhro7DmCqV1JRiGI32X0icoyP3v4cTWcMnW?=
 =?us-ascii?Q?wbA0DzL1jAk72IXaecQhTHm3g+VzYV3awl0fB4iLpWQ/AsNKPwjZJV58pNkn?=
 =?us-ascii?Q?AQ3LpDgbqHA1llhrIfTLIO54pBrZb8uPV7K05OC3jJuCFw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DVG9s+M5kFSdshR0wS1Ce0jB5NrsF2bUwr5L/6vTJUG94wfq9EdrgEfMOUB4?=
 =?us-ascii?Q?KznmHMSEGb+zI7Ky8eN5ek0BX/s+9838sXiiBJLuIfYsKBVfJE5MwZB05Ca8?=
 =?us-ascii?Q?dKUE/3EuI1QVM+Uc2wJ7xsKJZz9jKVOTIWEgYDtf10udiIAGlwJzidZC+8tf?=
 =?us-ascii?Q?wenydHko/SF7B+cyuzlXYB0G6h37Fe54BmKxexqViwwGZzWcXcpLLKce3AQv?=
 =?us-ascii?Q?az0mvjK6QE5QzWLU3NtfGD3bYRiB0EwgOSV7anFdPcI6mb7oar+cX5+tpBWq?=
 =?us-ascii?Q?IkIunUC6epROXRouyTozy2+a1dwfZUDTs7JJsq3lpkD2GGUWCTwHAbY/2WpY?=
 =?us-ascii?Q?Qm/EuNk+ayqO8V8bXa7PoVutu+kZtSj8GL6zt8HzFLVx9s/8nhh6Y141qz1r?=
 =?us-ascii?Q?hL339VAmlr2DpYWt1z4MYxYqL/5G2F7M26ZpoJS0tiXsNUnOXOoNESvKvLzR?=
 =?us-ascii?Q?L+JgYnTkLPSyPOtmWLQn5Mv2vYmgo1mwox86WKhVjmEv7yBpZUUaU4ZNrM/S?=
 =?us-ascii?Q?br/JgCmWcuJj2j5/7sWbFR4IQPvaq310oaNBXFQNVLhmmTvHdKmfgp9QyGc/?=
 =?us-ascii?Q?7XZYrUFB0wq06zSt8F7n+BMzA9yxGNutkpiMvSa+b3Vo4YskQvvxAtcaHvpd?=
 =?us-ascii?Q?w4eGYATghEA6SzoaR1aoIaj9x2dr4mZ2N0iIJg6NE78Ag6LPtBcyIpZZhssr?=
 =?us-ascii?Q?fmH2WOBm+pXTpMoD6ddlxn+AoY011Q3WGYM8NxR1vEcaHMbXrDqfxsI0PVh+?=
 =?us-ascii?Q?NYSWlQlRO6Dk+BGRAj8FXWDG62RDGgdnrQqwZVIBnV1lew19MlDepz85xJFb?=
 =?us-ascii?Q?4ZcJTLui9RCylHDuCLPrV+o0YOgtMcz9JMXbP37EQnmgCvzd4VEfyNDGoUqm?=
 =?us-ascii?Q?w7+4G+q1fbpsvv96RkWvylmNVPZoknfdvUxDRnutm5U0U9tCifE56r9inuaj?=
 =?us-ascii?Q?lxryJ1c14G/PZCObDqnlG7p9PWJdjcihEkv2imtrG3Ae4R8RP4swEpQgxwiO?=
 =?us-ascii?Q?2/zF1a8JiaCM8V6Q1tQPgvsoGEYJTYomBFcc2TPqDRDsavpebC25M0AS9gUn?=
 =?us-ascii?Q?akXf/+O0OkTvj7IkEvqdvwjSjJ62G3pfaxilrFChZ96zMOH0qWnxOT62Fscz?=
 =?us-ascii?Q?z6ZKrLvrpsG3hsj6oOYxT8YJUlyjMWBv2AbFaMNQ5GoLOHYB2TdsQEcq8W7u?=
 =?us-ascii?Q?C1svIxNUkabJd4zEdoZUp51uqbUXAQvFM7lM9sYUM3ii+NCFx30IAHZ4UHUz?=
 =?us-ascii?Q?fw4k4pQ6Nb9GcOdARTK122kq94fn2qhC/8Ff6EUm4JIwk4gIPGg6/gFQd0rM?=
 =?us-ascii?Q?ejnhPgFhqDydj3DxeDfYDxtvRG1S4qgs3TEuKeYNGE/TVQ8pqirxaycSouzY?=
 =?us-ascii?Q?BCgcACNrxLNaVOpA0x04r6hIITNmbeeK+SXD/may2MNmUZ/px3kC6QVzy3O+?=
 =?us-ascii?Q?e2WAUxD9whH5ZLID5aJePKi2h0JoRbHSBBhINel/C1BvZuT05DtwJi4kgUgp?=
 =?us-ascii?Q?bQTT/DcKpg6SbueObQTPxMsiF8idqWZ+JUMn3Xjgme8Iqgl1fUv+kds0wKHa?=
 =?us-ascii?Q?UY5RUbVcJz30G44wr+7a1x5/wqjiB74KG1IJmzx25O2Gg8+CYmXwdt5HFPK/?=
 =?us-ascii?Q?bQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fe88aa29-8612-4858-5088-08dcd3742d52
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2024 21:45:11.2973 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dT58XAerFom/iBDF5ckw00cjdXf6TR/RLYeIiO6QqKyIK4PpGgaQYlQub21qfiRHx9bGwtJbLL2BIPtKlGMOfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5984
X-OriginatorOrg: intel.com
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

The pci state was saved, but not restored. Restore
right after the power state transition request like
every other driver.

v2: Use right fixes tag, since this was there initialy, but
    accidentally removed.

Fixes: f6761c68c0ac ("drm/xe/display: Improve s2idle handling.")
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 5ba4ec229494..6d29ef4b396f 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -949,6 +949,8 @@ static int xe_pci_resume(struct device *dev)
 	if (err)
 		return err;
 
+	pci_restore_state(pdev);
+
 	err = pci_enable_device(pdev);
 	if (err)
 		return err;
-- 
2.46.0

