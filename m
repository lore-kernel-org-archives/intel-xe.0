Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED45AC4167B
	for <intel-xe@archiver.kernel.org>; Wed, 29 Nov 2023 22:36:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2B2C10E69F;
	Wed, 29 Nov 2023 22:36:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22DD910E699
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Nov 2023 22:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701297384; x=1732833384;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=N4WMLcFFOVjjrZKllsiNqci/JHE/iXU9aMenQFLpJfU=;
 b=R+20MmO9d6J/KjKestM4K0KtJcCfkNpNFjNOv2BonY4VhrXzn1zqigjN
 8+7TqOnLEXL0p/j96CUbsVRQ8Isna+K6dAeIvymNawvUF2JKCYvUrpARN
 8uhbQsYvMs6mLOMGjRqbd/lCRsolsZ0j2paZ+vPekuuouyfnwJyn/Aloc
 LE/Vnk+ai2YfcsgJqE4sMoc3BGH2RTvRyKSFSDRx4T7kcDBcUJkgG4TWM
 isDll9+aTXgpLYEiQJspaPBV2pMaDyXDsGcXxWyrQXGTgfaQzF22mdOwk
 OzG36nDHP+rO6Hkb4Ch9qEhZ0i0Dhzu29esotd/JxK953yV9N3zO9aYjU A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="219776"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="219776"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 14:36:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="745418239"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="745418239"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Nov 2023 14:36:22 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 14:36:22 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 29 Nov 2023 14:36:22 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 29 Nov 2023 14:36:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ir00DJuDL4q9zwk6IU0CMtTvOR1qTyLX336H37jKWEQGPKF394H6kitxwTtdhC7Rsj/ezph61WZ0PMdBfyR05VHz8K9lnv0sXkfrCJUY8oBSi63xH5FBy7KIeWTY32z5FTWrIunw57CuRDENo1FLDLqV/69wz5MeK1N2vPOGcCvyHI0wHXjDNEhfkKKHnNlxLjRnVC4ZoS0mfU4kVZFNT0hwLPW0rijVyon+CI1al1WdxzawivCiM4RH0raASGkBvisCMb1emYmU+OmJNnxQ/N7pMqiXQe3AzkKPPs8dOoQwJdg/CyxJmTvj/Ofjswz6r70fIsMKVTcxqS5IM6nQIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3HDQ9VmKw6axDhgBsPCZCDPXS6sgvgQg1wTuGuaa820=;
 b=AC0a9ixNHBA3one675PsVBZ/BkPJhPms9GVg/5HVrkJ3T8dBhKDzr7+ncn0A76xZghM73ZwygPPQkj1waw7uuKFHOHiN3xz/gCHpHPvmTVz7SLE/yUeyWk0xM8fr0+jGC61yUGmQjti4kDhKa1HfVdU/7tAGJ8GPPOZfoSf+sjaaKARSdEv1F4tsDedUh7a4Aos7sE0SNfbJQxFGwxhJ04NSQT9MgQnekKHticjRlH9EzgcxzyObOKJmAiFAb9AaEFhYypM3/1ILxB3K8/5abQV5NQ9DRXowRDMHr7Vv7DLKgUEmlq887AyOvUe3ZEC6WfspNfkcRdou7DJ2iIvfNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 SA1PR11MB6848.namprd11.prod.outlook.com (2603:10b6:806:29c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.22; Wed, 29 Nov
 2023 22:36:20 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821%4]) with mapi id 15.20.7046.015; Wed, 29 Nov 2023
 22:36:19 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 29 Nov 2023 23:35:01 +0100
Message-ID: <20231129223508.1189461-17-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231129223508.1189461-1-michal.winiarski@intel.com>
References: <20231129223508.1189461-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR5P281CA0034.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f3::13) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|SA1PR11MB6848:EE_
X-MS-Office365-Filtering-Correlation-Id: e21fb4a4-0569-4227-e73a-08dbf12b9b4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jN53OxseMgHw7Zt9OgmAXb7PBelIj1lilQ0F1lBLduv4/SP5yIrWt19kU51+i99TwN/pQ2SFzYQwzsbV824/s4RdR+TCOefvgMZtFXkXJeTrmcmR1TMEULhWBnFb+A9dMX/L96Y2DqDUEk/uo4NlX1VpnogjM0eaoBZ/WaPzAwg7IC7ecB3POmvCxBo2XqPz9y+tQEMwVuwIga6MgMC8RNNq3S9MXhOSQm6asHdVNjcJp+3p1A7NcN34g4RezbxlJqdAXxdqclK6YP8RHpSJVZS51xmMZ0mu128kwWca71+xB9OiWIw8h1WUziTVJJt9ePjoCzc/LnYk3yA4y13KIIGdc+TZrzVz8N0DzHNHnpDjfWXg+p6JORLP32BaETMGEq+qQ7zs/acr5iEAqsK2JDEo5sOMMkykKmzfZ7AwjH9Qf7q26O9qk6qWo045rDOhZP9ky7F8b3rSXiEDZ4vsN77s+OdqvGcdMX5uEnpMR9n2tDLo96JaAtduvzPnkVtDro4rAj6LtX1Zhax3v0Oelc85u2Bq5lQWVTdCo/INPevNnD+AN3J4aXnq/+x4e5Wsea3gZK+0tEH8SCJkTY7KzGO6meYZLh5K0RTbFLoVMdOH3f+vcFO2kx8I0o1Gf66u
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(136003)(39860400002)(376002)(346002)(366004)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(5660300002)(8676002)(41300700001)(8936002)(4326008)(2906002)(66946007)(316002)(66556008)(54906003)(66476007)(6916009)(202311291699003)(26005)(2616005)(1076003)(478600001)(6486002)(6506007)(6512007)(83380400001)(36756003)(6666004)(86362001)(82960400001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S0N3ekZHaWNjUExHZkF2U2RuVUgyVnpvd2p0d3FmZ2h2YzI4eUh2Z0JqZlZv?=
 =?utf-8?B?aXkvYmtQY2NMRVZIRlJuVGtQRVBZUHF1WjdKeUFaUXZPQUE3YU1yWVh5ZytZ?=
 =?utf-8?B?R20reDdBb2FSaU1CVk9Ra0lwMy9uVW42STArOFNNek4wdnJIcWd0dXIyUklW?=
 =?utf-8?B?bEJ4RWo3YjQxNjBPRHNRUEdMdGdsU0g0WGNxLzZ2MUFHeEFRM0ZMeDgwZlhY?=
 =?utf-8?B?UmVQSGUvTmVvUzhtMTNZMmNDLzRJOE1TZXcxTE8yUVFSaW96TUhqb2lXWDZR?=
 =?utf-8?B?eUEvZDBoV3hobjhwRXltNFBrNWZjdE9LMUxhUGxzTzhuY0lmNUhWa201WnBv?=
 =?utf-8?B?UUI0KzdEZGhpdGVtTkFpaW9ucjNYamFnM0U4MEE4M2pCVDQ4U2lPdldpUGVT?=
 =?utf-8?B?YkIzU2NmS1JCbXc1UmNzbCsyRFplWVh1N0JYUXJ6L3hZSlhJdkV5UXBnN3NR?=
 =?utf-8?B?ZWZGeHdiRDhDdExadkYxWVlvcDN1Yk9jc2ZaajVZRmtGYkdVRG1TdzhpSVZL?=
 =?utf-8?B?dlphMEppbVRJYkxJYU9xVzdGd3lYOURZeVViaFgyVlhaellIcVg0QzZHeEww?=
 =?utf-8?B?bWl3N3hrenB5UnNGSzhoaFVRRllZQlRYWDlqUW42SnNGOForTUxhRW1TaFBC?=
 =?utf-8?B?c2tyeXgvWlgxaXB6dnRLOWdid0dHVFdzQUJmNkY3TFM0cXRCZjAybUo0K2FJ?=
 =?utf-8?B?bFZlYk5OeUorcmNvWjUxeHZtbHJ2UVhGd0o3MHh5QzBRRzhQTHBUVnpyU3Jn?=
 =?utf-8?B?UFpva2t5Yjk5bEZMaXlta2NQbFJYRjhjTzJMK09sZ0xLcHJVb1RzSjlrdTIw?=
 =?utf-8?B?UUx2UXo5RnVLbFp4Sy9iTTljSk4zbC82SGpPTlMvenlUYkhFVEg2WTd2eEUy?=
 =?utf-8?B?bThDTTZ1VlFhcGU2THFpeUYwN1phWUV2dURsOWhJbUp3a3l6eXhsV3pHblpr?=
 =?utf-8?B?L0JxVCtoT0NjN2JKTDBYeXlENlFieDg3bHNPYmZuUVZaVTVETGUrTmhISk5j?=
 =?utf-8?B?cmtBUnpSS1p0UE1yMWpIQUxsZkdMZk9vUEswUVVMMVNaRDNMV2dZc1hLM2U3?=
 =?utf-8?B?OStqVndQekljYlNRc1g3NWVjQzhiNDRqeHVxUWJueHFOYVRNMEp1WXpUNExh?=
 =?utf-8?B?V3M3N0lpWDRjZW5yZXIvWXlnelk3K28wZlpjVzY2bXFUQmJzS29WZmdjMXJo?=
 =?utf-8?B?WVNkMkpMVDhaTjdpekwzTFpNQUsyK0Z6QksvdFUvRlhlNERXOVZKRUhweC93?=
 =?utf-8?B?Q2dLdlQrWUtHYk5zM1h1NCtPU1ZpQVFYUjV3T3pXUml5Tm43VHRyeFBOY0tw?=
 =?utf-8?B?WDNtQWgwdDFJK0x6YmswTGIzQXg3N2wxRHNOV2RHaEt6NERpNUNPTWU2ZGpR?=
 =?utf-8?B?QmIrVm4wbWMrTzE2TGtBakhuUG0wMURHTnc3K3djYjZQbU5vSS8zNDZzVXg2?=
 =?utf-8?B?OGVONnBHZklvTyt3RXBqYVZmbkIyN1crSWhMTDBVNzVvWm9BcXRzbE4rbkhy?=
 =?utf-8?B?TVZHaGwzdlFGSkc3eFI1UDhKb0FibkVWVnFXSGtSSXdBTVkyZFhKYWVjMkRy?=
 =?utf-8?B?SWlCZU5neEprcDNHYy9zUjVqb2RrZWE2WU5FYzdOZlZab3R4VWNDN2NMbFNP?=
 =?utf-8?B?WDh3c0ZmdW43YVFFSTl0ek12TGJFRVVDODU5Mmw4aWpEemRmYW1KVHN2bjg5?=
 =?utf-8?B?RG1KQ0Z3YWdtbERFSmphZytlemY4MzgwbjBvWXU1KzZoZkRUZzUxRlRFUWJz?=
 =?utf-8?B?dXB6eGxGeHFUMXZmaFZ1ekZNQ3pYNG5uM3FVNEFqOE1VSFY1RzFoQ3h3WEJP?=
 =?utf-8?B?MXo5Qk5vTDJsVXF6VGRKOG1rdXc4dGdScW5aOEZVaDF4MTQ2N3VzMFp6ZnF6?=
 =?utf-8?B?WmtqVUhmUzhleW80US9KeDBqUGE2SHdBUjI1RWhXT1RYb0l6SDAzOVp1Z0N1?=
 =?utf-8?B?RkRkcFJsSytvRE5GUVl2aVdFWmtBb2NqRDNHYWV6emFTWExoRXY1SFRvUkM1?=
 =?utf-8?B?ZjAyOTJOaWE0d0VlbTgzekNITWNQTFlGcnF6dWFFZjRManArdTAvTWJOWlJT?=
 =?utf-8?B?eE1Na3Y0OWE5YXp0MFhlbEFMY2FvM0lVeHY2dG9Vak1wMEtqcWRHdDZQcTdT?=
 =?utf-8?B?ZUNUa3FRSElZeDRMaFVCY2VLdzAxS25ib2ZzWXYzOTNGVzJQL2NCVjcxbmZM?=
 =?utf-8?B?NlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e21fb4a4-0569-4227-e73a-08dbf12b9b4b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 22:36:19.5414 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XZtTZ8ZQG3U+wYu05d1pDioVKRJ+AbId91aoB184cv6rBClNj1GsFvz+9nusVO/vwGfOVwDrxzMsjLij70lWWDVGO7wToGV2jiAjdFWPX0s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6848
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH v5 16/23] drm/xe/uc: Store firmware binary in
 system-memory backed BO
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
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The firmware loading for GuC is about to be moved, and will happen much
earlier in the probe process, when local-memory is not yet available.
While this has the potential to make the firmware loading process
slower, this is only happening during probe and full device reset.
Since both are not hot-paths - store all UC-like firmware in system
memory.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index f258eb44fe31c..9abae65c6b236 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -750,8 +750,6 @@ static int uc_fw_copy(struct xe_uc_fw *uc_fw, const void *data, size_t size, u32
 int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
 {
 	const struct firmware *fw = NULL;
-	struct xe_gt *gt = uc_fw_to_gt(uc_fw);
-	struct xe_tile *tile = gt_to_tile(gt);
 	int err;
 
 	err = uc_fw_request(uc_fw, &fw);
@@ -763,7 +761,7 @@ int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
 		return 0;
 
 	err = uc_fw_copy(uc_fw, fw->data, fw->size,
-			 XE_BO_CREATE_VRAM_IF_DGFX(tile) | XE_BO_CREATE_GGTT_BIT);
+			 XE_BO_CREATE_SYSTEM_BIT | XE_BO_CREATE_GGTT_BIT);
 
 	uc_fw_release(fw);
 
-- 
2.43.0

