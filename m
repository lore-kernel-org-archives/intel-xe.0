Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E181C43458
	for <intel-xe@archiver.kernel.org>; Mon,  6 Jul 2026 02:47:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5E2C10E713;
	Mon,  6 Jul 2026 02:47:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="FhmbG0It";
	dkim-atps=neutral
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012018.outbound.protection.outlook.com [52.101.53.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 200C610E713
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Jul 2026 02:47:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r9Y4l8M9yHWzlnX0F2QWICmN9ZaD7RxMxzChc4E/1lEw+gWVouiSlDOB9AMWZP/ektPKO11btGYKvoouTVNeALn6FzySAgcc0BK2T7gSkkA8UB8EnNZe7H1g5kBRRlHN9JoeJMWNquKCkYVZzsMfHyUQOHH3me9OjiZw5aHXS1aUwGmcrXDl14JI2RrByJqsb6bwevaqxcONC9CksU+c/s7dCNDZinFOOMv7NYa3Cr1CuGqxjeS6ZC9AxTByLPV/4CJTHZfsGdnnUkjGOhnnuBsqEN3ZeNxsqgSC1s6MnNid1Gvp5dek0VLXdugT0BfQaPuTZx5GD3x+5EUf1F4oBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YimKKcZxXCK5Z2bOjLneMcn3XX+4Gf9m2i33BS4EUN4=;
 b=aHUsjlpPMdWGzN5wmqreaEYJAwNSsDyZfZXONK8TTeK8YFPn150rOLuL4DB0Ot3HYssC0U/IRmr/yNtjx5EmtSyDMGWqHF+aeBfHGpwlMxt97oVXSflOSIAEodkaQYb+jzLuuxBmMUf0mAnIe04TO0AivLdacJ6a7UNhqwnmTldIwC+cuKPGZ9Mj5v/QeOc610tkY90N3RCsEtR0DCLWxPiZjcKkVdYJloPoW+lifl8iEUdCs/W8BkZX0BOlpKuw0AxI8vzZJs+7gRk7rff5kc7t6cuUbzc9iQlGqds9oMNeBSiAKdWHN1260reZgacIxHlgS1HGa/EZkqeHUDLvqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YimKKcZxXCK5Z2bOjLneMcn3XX+4Gf9m2i33BS4EUN4=;
 b=FhmbG0Itb4x5DuvbXjnRaQZX/WxiMLn1678IGSHnmzWIeYX9JPogqOGdrwuFACfVEruUY7bN8X5jSYPCc/zU+XvjOvRZxKCB/laddJo/e2Q6V+9sRDM6MAUctEGW4ZAIdKLiiyx13+PS0SulLUd96kmA2ZaR7Iy6rSWcKKadKUE=
Received: from CH0PR03CA0332.namprd03.prod.outlook.com (2603:10b6:610:11a::9)
 by SJ1PR12MB6145.namprd12.prod.outlook.com (2603:10b6:a03:45c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Mon, 6 Jul
 2026 02:46:56 +0000
Received: from DS3PEPF0000C37A.namprd04.prod.outlook.com
 (2603:10b6:610:11a:cafe::55) by CH0PR03CA0332.outlook.office365.com
 (2603:10b6:610:11a::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.13 via Frontend Transport; Mon, 6
 Jul 2026 02:46:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS3PEPF0000C37A.mail.protection.outlook.com (10.167.23.4) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Mon, 6 Jul 2026 02:46:56 +0000
Received: from honglei-remote.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Sun, 5 Jul
 2026 21:46:55 -0500
From: Honglei Huang <honghuan@amd.com>
To: <intel-xe@lists.freedesktop.org>
CC: <honghuan@amd.com>
Subject: [PATCH v4 0/3] drm/gpusvm: fix IOVA/DMA unmap leaks in
 __drm_gpusvm_unmap_pages()
Date: Mon, 6 Jul 2026 10:46:39 +0800
Message-ID: <20260706024642.614238-1-honghuan@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37A:EE_|SJ1PR12MB6145:EE_
X-MS-Office365-Filtering-Correlation-Id: b06c1aa2-eeae-431f-1367-08dedb08d81f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|23010399003|36860700016|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: ST0HhftbjzVlIrvzwy8bbXrkCvd9awTjUN8N0LBFD7qscyxl/LeP7bzQ9nqCVpgjVe9CZc7o2N1Ctma2s1O9Ae/ASgHX2SINaLinQz0dT4EghAITQSJaUCnHyq/478YQgiAIZqpkXnlm7d5NY0eVBuQ1Cnkh0MY2M6zuy/DGiYrzDc/NMbsxcQy5wcrX7//KNG/As7xUocn2deHL+JNF8l5stCkOgZ+O78sNNcJ/CCE/CtoL7tlKeEYfEh2iGPdOMXVVMKZBDbX6dQUDD0RHt8HXvUp3VYvaV9y/91uEijyxPvYFW+yqRBTH3sMKfEo1OQP42rw/lZOdqUpMVDUaQtP9SndgjjBPPJfvBqK4YB9a0GbIX6EdhuBen7U+k6L0qqis3jTZ1L16uFLXNrBRa+WSgbvto/yc+1B+VTL1N/VykcQ+g1Ow5/caSRrJU2tAcCeC3AYgKjrcQCLPgQX67EJb9xtxpxPkD/bATdR6MNMffxpGBaU0Szsi2V5Ga2JXVQdIwtzaULG1dnkQ3xOh5G+r5ann/I0BrL54xbclZgqvkvuQF07BtWj+lMLIRn48s2hL2OwDxa1i04UOX+acrxq78o+L8j8jBJqg7PYUtcTSUAm44wRTxhlsd9rF0JyYvHMXlrDrD9OZINLQ+os1BlhXkRUfhvj80sRpn0hUTUU5F5trEDXBMvIHMfrpmQiQGD9ybZhI55m8T+mtvzuHhw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(23010399003)(36860700016)(18002099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 6+e6tU7TGBJeRuOfNI2BIXKXJUgmffItHTq/yFQ9tKYhMrZef2//P8Evg2IoZK/AdCjD0xqOsKfNeLhHYRw5ZeqBa5tFIjOOQGcJG8bnsByc+ogwpSVBqHb+pswTYMtSWnmllj+Ra/wthVMjvAdFwL5v89MSK3dQgzVlq8gXnndEMRxp2dMCJbEzIeE/FVh1Ztykkf250rZvFHf29GhOGRB7RpbjKZMkZmFM0hoaaadBA2yvJlWl2dbVktIAhYZOo9Wi0M8iHWE8Hb/FM47SvHeqL+hGRH7vtw7GGzXCBntWmoA0U7PhGCmmPbPA5VcpEwfB1b7XLSPqyyrfwOZGg3W3tP9xm3C9Dad3ISePbdMoBRdRdeHK+ze1+NlROfjm2Uzkpnxbj+4gyPBoFEtW1/rfBJ8VhOsc9nBFIgoithbXTCUxSt9IYF4ZtYrr4YHd
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 02:46:56.4592 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b06c1aa2-eeae-431f-1367-08dedb08d81f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF0000C37A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6145
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

V4:
  - Add reviewed-by for Matt's review.

V3:
  - Add fixes for all patches, add Cc stable.
  - Add reviewed by in patch 1.
  - Move AI review note into commit message instead of reported by.

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

