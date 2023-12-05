Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35E9EC10DC1
	for <intel-xe@archiver.kernel.org>; Tue,  5 Dec 2023 01:33:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F293310E462;
	Tue,  5 Dec 2023 01:33:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBFBB10E45E
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Dec 2023 01:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701740034; x=1733276034;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=N4WMLcFFOVjjrZKllsiNqci/JHE/iXU9aMenQFLpJfU=;
 b=HfXF1OU1ZqxsvrR3mMACEGbSgc5nGz59ycbE0r2dGIJoRYIDfHoABSGJ
 b5fuLOiyVNYwSFYR1ZvdJpHAM+wa3Ry5sbaH+FW1h5HQShzZLhKBavxxb
 B+ORvY9IAKY43Jc5dW6U8K50zTvjhDC3o04MdzAelK2bYi+6vfZKvaH11
 ikCoe0Wz8hBYtNXNEXiHwhFjYlqhhSsaNMZUUccPajiaU4wWwSXqoCrZn
 fiE9o7v5hki/P1EDKEI9kjPJKbdqjK6Y+3wT/Am3h/qFfr7HfzGjK18yS
 lTjFK+bZc12B7DMVUX9atAUaT+S8q2T7Dw4RcgFVACxcpggk/JEGpzjiO w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="373268855"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; d="scan'208";a="373268855"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2023 17:33:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="1102277712"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; d="scan'208";a="1102277712"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Dec 2023 17:33:54 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 4 Dec 2023 17:33:54 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 4 Dec 2023 17:33:54 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 4 Dec 2023 17:33:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hWbIhh3bhzPNJ+jkEUUp8h9ZGEdejkSXZK97nQVcbbqPfsjJEMW68JJl20hHVsMVJYdBBhmrIDrUA2lbzhTXFMyB80nO3ffqLjBcmN2l8MfJV58nVzgT+0WyE8rkY4j5dSJXJxmAyyHcFz54+zPyIk7A0bT7xtuCBC/0iercg5NyDnit8XHIXBO/uyl9Uan3RQ2H7/oAqgelAFyxjYi4CkBfhqtbNfWptdXh4SHkj1jtLiGUvpWcgeAUMp6rz/oa9kB+u1A6PQyfwpKy+wnX9ApTUOOUpZwTNiP1H5UQ2V+7GykNQIsiCCp9Vl/9tNrfJ5E6A06p8e00n+seR5yaxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3HDQ9VmKw6axDhgBsPCZCDPXS6sgvgQg1wTuGuaa820=;
 b=OHy//47FFydJWc/mnJMEuLl6ylQH0BZ+HJmlAJSheLr+SPPRwN2810aogjXeuQph27n6nC+Zz3TKBu2wuMYBA5AuE6lvArWLtvWKqOSeDJzFhel9a24EDbnNY7ANrdGHij9QAxS/ndzDhW9Vz+xsdc33+x1qjqAgFWkWTY8xSswjAqYu3drtsCyL3t5+4Ckp3rO3dRsTALLuGo/QPirHlYQWpylp1Hzjbb64gE9nhaV0Ptv8grH6w36H1KYEhIYsAn0lvU2ZeQdFyIpQtDZfmP97VseXL/KR4gdhbBlJv/VySz9TNzyglkwFV8EcTLWiK4arQThmvAIhg7OXc9ZO7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 PH7PR11MB7051.namprd11.prod.outlook.com (2603:10b6:510:20e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.22; Tue, 5 Dec
 2023 01:33:51 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821%4]) with mapi id 15.20.7046.033; Tue, 5 Dec 2023
 01:33:51 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue, 5 Dec 2023 02:33:06 +0100
Message-ID: <20231205013309.1497006-11-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231205013309.1497006-1-michal.winiarski@intel.com>
References: <20231205013309.1497006-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0171.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::16) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|PH7PR11MB7051:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ffc6e7a-f656-40e2-cf37-08dbf5323c4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PbXSiouNfsq8bcxFMEGncNCHvndImLEdvD6fnDROV74Fql2totDNeBYO6ZFnyMjNX6261H4wXKHroFfY3CcWHu+PMyx1/93ijUILvnOLXd1ARUjPgCsiVUVbFejBx3d6PW5RfcatYAzInBgkHO4hOkjeVKGeNvI1AxA1KPoDzsqasfBhkv1snDfPU7QsggigR+N26UuR9DxfIw5KJdfW3SIPjIJeCc/4ZKEHndhcem/MYmwF4Rg1C/gavnhOwHlNUWCVkejzlf8zGSeSfFz6LvWRVRsSAT6YNCGu6nCqp4oZeO8+BxA+1UImuUpC3H2DjFZn1yvbqqwI0rPXxiQqQwxRaqXgsQyEkk6LjhRaFFBe+yELU6Vz0hFtDrey+7FrpjoaCgzOsBXkIwNa4kDzcJLUrV52RpC4VbgGkuI34H8OsQXerz4lZ2MijQVSBcHVwQT39NEs39P6G6I9qeEqEG2VnibUVsDkNKg4HAVi/YwNNJGmItvFGxtHNY8fMyEIJ84059fmHEzCZdqapaFLBZFI0oHC/kNY7g9TNHc+LBQZ99SSZ4B8M3TId5gdMCjH
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(366004)(39860400002)(396003)(136003)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(1076003)(2616005)(107886003)(6512007)(26005)(478600001)(6666004)(6916009)(66476007)(83380400001)(6486002)(41300700001)(2906002)(5660300002)(8936002)(66946007)(54906003)(66556008)(4326008)(8676002)(316002)(6506007)(82960400001)(36756003)(86362001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZWdSbDRPcEQzZVlPL0VqWHpTdDBvM2N0bFRQNWpGVVlzelE0dUU4Ky93Z0E3?=
 =?utf-8?B?ZzJ4b1ZKaHpiTnpVR051RW16T0VhbjRsMGpGN3d6R0ovUUlDWElpd2FQZm10?=
 =?utf-8?B?R1ZSRkVTMHo4RUVKMFVEUkx6Y0drd0M0REZXaXU2L1pZWnJoMTVRNGlZZThY?=
 =?utf-8?B?U2pFT214RUQvWURUb1VQSHhTUWhUci9pc3VweERXcUN1OUE4bWxJTWZmQm5v?=
 =?utf-8?B?aVNBQ2VtNUNWdk9MdmxNUlBqM05DUnVXY1JEMGZza09VNnFwbjZadWMxN1U1?=
 =?utf-8?B?S1ZxMXdSUElzVVV6VTJYVWZjTjd2N3lkMmYxeFdWTCt2K0FpQVc4K0dKWVZ2?=
 =?utf-8?B?T05nVktCRDhNS1JBYnBFam5pb2FiRVZBZS9pVDNNeGZDWHlQblZ6OEYzTnRV?=
 =?utf-8?B?Zmp0eGE5T3VlZ0lJVTQxZ01UQzFpT29Eb0V0ZDIwK2NuNXJQNHI3OXVKSEdO?=
 =?utf-8?B?UXYxY3pXa3BjVyt5QmJkTVpCcWVmQkhiZ0RoMlRFcGY0bU1uWGNtN1dQbkxX?=
 =?utf-8?B?c1pkRVU3MGNGYmZHQTQ5OG1LUmpCcGFFVmo4UjRGWmg1Q0ZwdCtBdHdqV2g2?=
 =?utf-8?B?WkFZQ3pwSjRkRmYwRTdpbmRoNzVuMUxFMmlIVXZkNDBtRkRqS0N2SEFqUHJx?=
 =?utf-8?B?cUpoeFJyZXZ4RDZEdEJIazEzTlE0Tk9iTC96cDZrQWtZOFhsQTE2NFdtUFBJ?=
 =?utf-8?B?WGI3dkwxNVh2eFpXWmJWTEN5OEc4ejM3c2NRamMxanNwMTdrcStpWkxJVEo3?=
 =?utf-8?B?V1o4a3puUU5FUVdqaldQYTRWU00xQzZVUU5CdEtSOUpiTlJETjdaMFJhMnhQ?=
 =?utf-8?B?M1dGVVBzUldqeWRvblhKNE9vNHBLN1BlNkhnMG9aNGs3a0hkWjdtT0FwNkk2?=
 =?utf-8?B?b2NHMWFSTmV0RWhyZVNvbUxpWGRVV0FYOUNHMUxDanRPaUFvcU5CY1orVTJL?=
 =?utf-8?B?dEZuUXdPMldONys2R3AvQkNNSUMrVDVVTVRqcEtLMmJLUURuQXFQYUZMbHV5?=
 =?utf-8?B?bkZiNlAwUkd2OXdGREc0TzNySTNGcjNIeGtwZ3pDd1RMM01Fd05CbURzSlFj?=
 =?utf-8?B?RThZTkdBK290ZWIvLzVTSzIvYzJsRGVVS2Q2cG1oVjIvZkN0MnpYTWV0dE1i?=
 =?utf-8?B?VEJPb0o2UTZ6MHBkK1JJYzBIbGJnK1NJSU1nM296Q1ZKOWVyczIrN291bWdv?=
 =?utf-8?B?TEFEaDJza3ZQYytmWW0xUFpvWGZmNTEydHh3M2t3NU9GUzFMVnNXVWhHb2d6?=
 =?utf-8?B?b2R6bWNMamVRdlg0aWU3SXRkckl0cmw4VzJ6Y0UrZmR2dk1Xd3ZDY2VQUGJV?=
 =?utf-8?B?cDdpbmpHVTRKM01KQm5KdGtPekxIV1d6RkJjTFZpWXNZZ0hreGpGdHRaMHJk?=
 =?utf-8?B?bnVhTzAzSkp4Y2tvMERCck0raVJweFdFRk1ESTBsd2ZIRW16Z1R3VjJBR2FD?=
 =?utf-8?B?SFdDZU11czNtNUJzM0pVRUphYVE1cE9Pem44TkU5Y08wMHU2Tkw0WlQwVGVn?=
 =?utf-8?B?eWtNQ1ExYzlzRWRHSm5Hamp0ejlVd0t6TmRHQXZBd3UvRjFKUUMrT3BOQzNP?=
 =?utf-8?B?QU91dUd5MWtaRlJVRWhWRDk3Vk5GYUxIZ3BnR0dYVnlub2NLL3F4N05YdDZz?=
 =?utf-8?B?ZzBvdU41MWZUY0tXaktvYmlscURibS9JT3V4SFdNQjY2U1NRSkRCUExhZFNS?=
 =?utf-8?B?dThhdkxJemhZVU1GSEdnbFR0c0xLaFhHeVBqZGpmRGg0azVOK2xrMFV5Z2tP?=
 =?utf-8?B?SG4xOHdPTTVERGJkTWVNcU9zR2dzdXlpNnNrNUtSZWViTjdFTVd4VU9DVCtj?=
 =?utf-8?B?YnNDVGtHV1RpcU9nOVkvMnpZUjU3TWZsZFJEbjhVTW8waHc2M294eEYzemV5?=
 =?utf-8?B?TmRVem9PcmVUSEpmUzU1RDFDYjFrYmNiOXQ2emE3dlFZekh0ckZSMSthaWRW?=
 =?utf-8?B?STluSksrcnozdXVVdTQwdjdSRzZ2c1VQNXpnT0FzaXpIU0NOV1JDUDhjRTFW?=
 =?utf-8?B?VHd3UXJjZlEzb0xWN3AvMjE4WGhMSFRVc2ZGU2lpeTNTUnhydll6OXJhWFFD?=
 =?utf-8?B?dVRoaEpWdllFUXI3eGpNUXlDMU5pMU8wajlvbUVzSDZTSHpxbDJ1TktoeHkw?=
 =?utf-8?B?YmM3cUhpb0diQlNKd2tEWThNL2s5L2NkTFBsb0RpQlhmL25LZjYwQUZtRHBN?=
 =?utf-8?B?MWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ffc6e7a-f656-40e2-cf37-08dbf5323c4b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2023 01:33:51.2914 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bkkweHEzZe/bbhlwxGydf+xuO7LeTWtepHlk9MXixJaulyIBinIhGyMVQ0Ezh6+auV9NRc9jrC08Vyl+CRpV0A3gy7PbOMsi/glNmLJnwBE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7051
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [CI 11/13] drm/xe/uc: Store firmware binary in
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
Cc: Matt Roper <matthew.d.roper@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
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

