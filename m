Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D878C43458
	for <intel-xe@archiver.kernel.org>; Tue, 30 Jun 2026 03:40:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F8DF10E141;
	Tue, 30 Jun 2026 03:40:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="kqVl3tKz";
	dkim-atps=neutral
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010019.outbound.protection.outlook.com
 [40.93.198.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D70EA10E141
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Jun 2026 03:40:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UB4XcDYy1nw6jCMPLeB4gFvkZA2rBicf9Wovn2CUXdi9rgLP/qzOR6f3ad8b3F28kTwUTVUD2OF47UrAwgfqpATHV9ASAbe0NNcPVLNOJxV7bcktYeneNE9DkDOm2JybmVoZ3OpD1q/mRtXxS1Ycu8yr5hR/4JjdZ6U2cH9o/W6I46yRKOKToOpPF0aQ4HGiidqU7/a/eapQaMHJg/a35IqlASe1OTq5woCezbZrHbKN1pxPVioVbXheTU3pbNecXuvpzHfbIdt2nqAtw8gyF2NOrHBj/3vhsZwHqW8VFYEUam05Z5xkCE2u6LoEVDP1piPjwlg57HzOWEJaDHyd3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7ifAVg5mUS25eQ17E7SRmmTSOLF94Ihh9zNqxO3tFz4=;
 b=Gv9wfhXkMhXJDt3Lu7tlP2Gg9gsSpOFdIrw/PbYyp5mg3AZXcmxvKlAD7i6YfFkW9qCyreHHR6BOjnfmcFsqtNeygnfxXIh86vfqBUSqsQ/N5NdAKDKfJaV642uoKcoS0wirSgI1Qgb7ECsssO8kT3z+xpSeuBWJDJbQm1R9v8YwboFJKRZor+O2EK57FtCAR5WmMBHO7+jqtgXu725G6Oo/VajbXRnGkTsimJFvR9qS69ZlF1pNZS4AjSYecS1iMe5tbldmr147iB5ENpP7Nt0NcWZK1sXu+Uv3dlbADOvGBDndSfa6P9ni+yhaJhuSKK7mIaWlpPUZg5O9IdzPuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7ifAVg5mUS25eQ17E7SRmmTSOLF94Ihh9zNqxO3tFz4=;
 b=kqVl3tKzXnjlsvyVTgD7IdOQQnfxv4VXzZZnDOFfRm1bvks0iNi3HwWT8ysIBJs0YM4WVD6ARwmDM7zPw9VwMHXolpkz0pGHXtIXjS5HJfW9ttn6Sxtrwq/waQrETbrSrZ1W0NmnlDf9zO8TSWv4G/X83PX1nW66PiswR3/W5S0=
Received: from SJ0PR03CA0154.namprd03.prod.outlook.com (2603:10b6:a03:338::9)
 by LV0PR12MB999067.namprd12.prod.outlook.com (2603:10b6:408:32d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.18; Tue, 30 Jun
 2026 03:40:35 +0000
Received: from CO1PEPF000075F2.namprd03.prod.outlook.com
 (2603:10b6:a03:338:cafe::8d) by SJ0PR03CA0154.outlook.office365.com
 (2603:10b6:a03:338::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.19 via Frontend Transport; Tue,
 30 Jun 2026 03:40:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CO1PEPF000075F2.mail.protection.outlook.com (10.167.249.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Tue, 30 Jun 2026 03:40:34 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 29 Jun
 2026 22:40:34 -0500
Received: from honglei-remote.amd.com (10.180.168.240) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 29 Jun
 2026 20:40:33 -0700
From: Honglei Huang <honghuan@amd.com>
To: <intel-xe@lists.freedesktop.org>
CC: <honghuan@amd.com>
Subject: [PATCH v2 0/3] drm/gpusvm: fix IOVA/DMA unmap leaks in
 __drm_gpusvm_unmap_pages()
Date: Tue, 30 Jun 2026 11:40:18 +0800
Message-ID: <20260630034021.362571-1-honghuan@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb09.amd.com
 (10.181.42.218)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F2:EE_|LV0PR12MB999067:EE_
X-MS-Office365-Filtering-Correlation-Id: 4533a2e8-25f2-4f3c-c22b-08ded6595804
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700016|1800799024|23010399003|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: Iy8ugnaE+VlTPldWkocZt1ZkLh6MyNXYoms6rhE1z1o5GgaejbWuDdJyvnkLRCEkn5W6POySy1RTqBS5uBzbocb+uD3EfvLY+i1tkzNFA7g2VoNRpEF9CRXWaitIT6X4rdxQX54vIW1A6UI2S60Q+woU1S+c9kX4F3v4BNKhlzIBw+FIatrvQ1QgRXvax0XZzxmxQBguuHf1OKk5pLMVJRC5R3/hY7OtQt7MK+KTIuGj5ZfB8DPJ0fKQX1HXnurPh0wCyxUr/dnMUWijMtx7JtJoaTSN1m0Oi5NaxIhX1vlwk53P+3ZFZ+WHfiCWg4yU7a/YpQ+doyIvsJInnA4hAxcPfgIlqYF07AsuGMLNECkumldntIs+3wMtwe0DsEaoeScvk1cDoyYp6lr2uYIbh71TFFGEc9K+x1ufNb5LkPx5Jopfbh0FdyipBCTzzHIvXnPem8Y454hqiIhbRb9kX8d/mz6SH9U66SCV/9+DoMzd2kDxpnPe0H0bv5llSlaQifVANfGDXCkKmeodsjQ1D+74FossXl3bFCJvYYfCy1Xws/03HwCQtpH7GdMlWrIxr1+7TPWJUy4TBGuehr9yZr2y34EFYkUXu0D/WXoDSQf5JqI876P4KUDS3eRzFI2+uhaPA4PcojZnoXAM9DVoMiBMpcntYHnDMTUxZS95UiUSmYoMLVtl/nQleeGltMVfFudQn3L3/q5cX4HFOY5FgA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700016)(1800799024)(23010399003)(11063799006)(56012099006)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: aQvkGIpLt/m2dWPcttbVgI+uUd2Zyvqqq8ATsGdjo4I+NFNd31Rc10eqK33k2VHUDKs/gGT87t/KWcmSs/Wn0d0RuDhcN44LJSR6RUYJ6n3fM/g8+7w99p1pVM/uzA7ZtG3Q2Bi4peMRPrqodG9+Vq9fdtSjGbeCQG073YtgMOZkLQrElHsjC7+Lqwd7QdGX/04N1+cVRkxWpx+VF74003fu8QlJLDnvq/5CHXVDpMnnmQu8aLL2ckeBf+ZEJTJyRhP5Dod24wnVsiEykQA6kvJXdblWQWl1m0gUXaF2cNTFc+TYsQGnwL5eEsinrNGfFlK6CHIUva/Sihw6d/Jt6+JTGVUl8+CpsZG+kmc3uAUIQiqjOSUmGrS3ZcW1gw/J6TwEcsZZOAWdGgdNdmASMnnbw1Oqg8RdHAwsgD09cpLcge9+1std9blVwA0kbhGx
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 03:40:34.9536 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4533a2e8-25f2-4f3c-c22b-08ded6595804
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000075F2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR12MB999067
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

Three small fixes for the IOVA/DMA unmap path in
__drm_gpusvm_unmap_pages() and the get_pages() error path, all spotted by
AI review:

  - Free the whole IOVA reservation on unmap. In a mixed range only the
    system pages are linked, so freeing just the linked part leaks the
    IOVA reserved for the device pages. Unlink the linked portion and
    free the whole reservation. On the get_pages() error path
    state_offset is 0, so skip the unlink, also avoiding the
    uninitialised dma_addr[0].dir read, allocate dma_addr with the
    zeroing kvzalloc_objs().
  - Do not route system pages to device_unmap() on the IOVA path. Branch
    off addr->proto so only real device pages reach device_unmap().
  - Publish dpagemap early to avoid leaking device mappings on the
    get_pages() error path. It was only stored on success, so a mid-way
    failure left svm_pages->dpagemap NULL and skipped device_unmap().
    Assign it when the first device page is mapped.

All three issues are preexisting and independent of the gpusvm MM/device
state split series; they were surfaced by the AI review of that series,
so this series addresses them separately.

V2:
  - patch 1: extend the uninitialized dma_addr[0].dir fix into freeing
    the whole IOVA reservation, fixing the IOVA leak for mixed ranges
    (the earlier version only guarded the direction argument).
  - add patch 3: publish dpagemap early to fix the device-mapping leak on
    the get_pages() error path.

Honglei Huang (3):
  drm/gpusvm: free the whole IOVA reservation on unmap
  drm/gpusvm: do not route system pages to device_unmap() on IOVA unmap
  drm/gpusvm: publish dpagemap early to avoid device mapping leak on
    error

 drivers/gpu/drm/drm_gpusvm.c | 53 +++++++++++++++++++++++++-----------
 1 file changed, 37 insertions(+), 16 deletions(-)

-- 
2.34.1

