Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8FC7C83F1A
	for <intel-xe@archiver.kernel.org>; Mon, 14 Jul 2025 14:52:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 802F710E14D;
	Mon, 14 Jul 2025 14:52:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hv9MZaLn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85CA610E14D
 for <intel-xe@lists.freedesktop.org>; Mon, 14 Jul 2025 14:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752504738; x=1784040738;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=9VrJTHIdVsdiX04BhlQFF7GBhmZBTrsa75iFQofXFNo=;
 b=hv9MZaLnLiN6hYeIFlBZTX+Pg3JLaDIMTFkrb/sJ6rZOQSW+Z5H1Py7w
 Urhq9HleLKp23W21Noxpisv0C8Nhamp/ThJsNrzoYeR3RRtjI3ZC/ZSEq
 4Vh3dNqjDNV5qvn8xiKL1fC00xtufEIblRsw9/ivH8ldK/2+7y8YaBQ31
 u6L0MHIFdKl5tfYfpG+v641UrqiC3ppiMp9w5+v4dj7JC+yXnXubNvd9b
 BuBJRy5nWU2NRlhUrxKhHaoqJsCAo7ZNjClOaKAHHhVXVB5Tvskucd3qe
 SOS4cY/sjOMn5iXZFcR0hTCi2nJX25WJFm5Y9mPXnXkqg+zjP1FG3WsJA g==;
X-CSE-ConnectionGUID: DC8tO0ewTy+kb95IqJnJpQ==
X-CSE-MsgGUID: X101lbqiRG+9hkw0owup2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="80136712"
X-IronPort-AV: E=Sophos;i="6.16,311,1744095600"; d="scan'208";a="80136712"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 07:52:10 -0700
X-CSE-ConnectionGUID: NgxF6G25TX+e8vec1v1XCg==
X-CSE-MsgGUID: 9y7Z5Q1VQaGoNn6pPUDHUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,311,1744095600"; d="scan'208";a="161254897"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 07:52:10 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 14 Jul 2025 07:52:04 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 14 Jul 2025 07:52:04 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (40.107.101.57)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 14 Jul 2025 07:52:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kvumdOi0nSs/6Hh3eapL9ih/3DdDiU81gfdgZYy9qmbbu8tqrCnz6jjImcth/Unn2+rXqKhB+g/FP9wiEV3KSnAYxG1e5DIN8/aXh9V3ywK7eRrIc5FCVLkDJvrPmDTXW0jJTr2xosGlYo8452xlb73PL1dHgWrL+00uu4CHAh7qWNaluJOtHqgpDALrlXW8Bw9mItbloWngVmlOgIQ1uLgAZmUZ/3P/vaXaVihJsLDlCEjEyV3SQ1SsI8NYOmYhQMJmYpldL0q9xkv+8LjeA+rnaKpZtMM0Hs8gzjnVY8K0o8PXse72FSLcPhZzDXgqXjz91ko/cDwBMkhgZ3i10A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zi4I5BMqQK+J5uKOk1WyLXYHmmwegV84B2U0V2/JK74=;
 b=gqbf03d7URNqIQdX3JUq320wRGo2cfTJLxLv5b9qP19x5etgW5m4DogM3skhaLREiiPrJ2/0zMlhxrr/xC2HMZNDPGFFgFiKB8O9AnBWgF1tP9U0AXCLLImw1HSO1u/sCWCWveWEatEHUWockUNfTznpGoIZ1eezAOwIzeHQax95B9pKVqFsExWE2nxMD8fj/+uZUHiEeTzgtsTNdzBU2fc41Y1oYWntZRm2QEldtdyL/lYdFfx23SlgnvtLzNvq0kCJBM5QiFiLLN2GyfZLjsELv9yZ9bbP+Nrmf7XVibjP+uqZixnT6BJu+QXf5BFWW0ks1d8PwQpgepA8iH5Oug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM3PPF6A4412A55.namprd11.prod.outlook.com (2603:10b6:f:fc00::f2a)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.35; Mon, 14 Jul
 2025 14:51:59 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8922.028; Mon, 14 Jul 2025
 14:51:59 +0000
Date: Mon, 14 Jul 2025 09:51:56 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: <rodrigo.vivi@intel.com>, <intel-xe@lists.freedesktop.org>,
 <matthew.brost@intel.com>, <stuart.summers@intel.com>,
 <daniele.ceraolospurio@intel.com>, <vinay.belgaumkar@intel.com>
Subject: Re: [PATCH v1] drm/xe: Don't fail probe on unsupported mailbox command
Message-ID: <kagvnjj54wpey74ubbiiexplhv2mcyry2jpqwhvqmjr2pieedd@7ven5nphajex>
References: <20250713020701.2747237-1-raag.jadav@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250713020701.2747237-1-raag.jadav@intel.com>
X-ClientProxiedBy: BY5PR17CA0058.namprd17.prod.outlook.com
 (2603:10b6:a03:167::35) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM3PPF6A4412A55:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a34e18a-4ca1-401d-b40e-08ddc2e5fc10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qMRPcRyBY0En95MzvSBmyHtvsm32ggY3RmxHdGI1dr170+9bt10EPUMm2DU1?=
 =?us-ascii?Q?2zOmoS18ruYsN0tZpYmcUXFSufNshGlzVGN1yXI2QkD7Zp47jaOQHWw6hRqP?=
 =?us-ascii?Q?mwbq0Y0R+3oMyQY9s0RziaG9btF1dfENfDYRSTyP3KXyraXPsRXxB9P/Q/cc?=
 =?us-ascii?Q?jGPJskTRhIeCB+A/ePBIYwoPSzzcthLeHjrpq0ysdNvfuX1OkJt9XPuy9yIY?=
 =?us-ascii?Q?8ooPeSXRhUc4HITVYtQ8Dqm24O7Z0XD/9ofMRwhac50FzsK/0/WiIXVKNE9j?=
 =?us-ascii?Q?7F+6Cdtxa93ZlSDYKANx/MhnJla869FuCz1Q1aXFhrUQ09ApDSGijxv9tXyb?=
 =?us-ascii?Q?TXA7DJ/aoSmNdbmMpCiSClRVEGjzwxjScioM/aTiChHyTXXHWQ+DcOeVTvHU?=
 =?us-ascii?Q?ykIJ7U9e2muyegCt+E469rOgNlZCoe/tYsWA5rrkbtjh/UVxDb2ltCKJRE6+?=
 =?us-ascii?Q?ZNzJ5aeB5bLRuMx/SmaiqmKzLo/B9MLE834KdreEbO2C6oI21lDq1tUYf4B3?=
 =?us-ascii?Q?0SyaNVByfS9X7bgOTkZTv0Uh4qefYdtioX3j44tlbq9SNu9BiiIIC5CyKIX+?=
 =?us-ascii?Q?FEa57ZS+YaNoadgOTRveDjlvF90MerHrYkHe3dOLkx76u/FUuKMqTnegP8Vc?=
 =?us-ascii?Q?YrI8MoDbBkOotNQRVUsh1ZsvoY42Q4vWZxTQfc/+7ZhSX66h3qIVNdTJhv3D?=
 =?us-ascii?Q?U4dfKh5vN69fdobKSvybsJC/ecdYwYo/OalnT++G3KxNonLIHWSZsupV2pfn?=
 =?us-ascii?Q?zMsTCKokIK9opqA4hLSJk7Z9AHouqmZ8rXI3Byes9pC50Oo9y4Z8cxjeyYpS?=
 =?us-ascii?Q?Mf3vA55RG0V7r//YxNuHj4JfTVArZ9HUoHDjan/XofrnOwcXBGgLdWEoJRcx?=
 =?us-ascii?Q?GpZpATlMjyQvP9YrN4dZgj+4zvvzB3d/KSDpjnt2hI0iEcYjUVqzMh6KNQfW?=
 =?us-ascii?Q?G/ib/mk/dHfSRnQ/O+j+Cgja9fPcaJWTOy0jxLxqyw9JIG4ZYrKXZJw+hSD6?=
 =?us-ascii?Q?fIGovY4SMS0NBB3n4muhZEmcDLnaPSa+ovpG8netHPz2GqOlZzt/jeMocNbm?=
 =?us-ascii?Q?UXBu1ijeeXIoDeKRUjnYGusiHQPPausF1jWo9qZeXdm4g3rKuiucF27t6d+D?=
 =?us-ascii?Q?/34tExxXnviEoahGscZYN+Q237XZGvC5VZEjZWWk9IX8woX3Ypjn3EMS5fMM?=
 =?us-ascii?Q?8z7gqilnYoi98QAShdQ3ULDmqhbmwN6PTSIKvYPk3VLtr6Q4AcK9Y7qi2UsL?=
 =?us-ascii?Q?OVg0O+kZCcOErH9HTqZSqMr3a6a6Qa1ljiMsefZHjWTTeRrQWv+TBw+tcOu7?=
 =?us-ascii?Q?xHy9Fy7DV8tqomH9U8otKPwvGGnZquKtx3xtv3shonpzbC/Nyk5BXq/0WFMu?=
 =?us-ascii?Q?oEsJg0xcw+bYmW6BvFpHBvp+UKbGBoDelO/EH++E4tOQVmwLLQRRKAv+doY+?=
 =?us-ascii?Q?L1vdbCSV7EA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?H7/89iCwa26dA+Z3In8dfjCa2YS4EtX1NFhS13Ue3NQu73Fngbp5oVXkjETE?=
 =?us-ascii?Q?fb9Lz/USI1c9coGTgyNWMiwo/toJu0UHGwBn76nj//tHVVrjWfT9hkqdacRI?=
 =?us-ascii?Q?tNm6IbVm5aIDBG2XEUlKzLNk/lq+5dgWdM4j/RnoOjLqeX2Z0pATUHtyew6x?=
 =?us-ascii?Q?R8pxsmIHpSUXR1JCJuVF6Nmv3tAev+R5RRQFFvV9AnGwGUjZL00IPjjMrhhC?=
 =?us-ascii?Q?aFZ+5wrJWkUrlp6zzCocxB/ynF2bU5B7ne8ogCUJFHK4mxmY9RdOY0Ujz29l?=
 =?us-ascii?Q?Bh9MBaAxZitavvA0XzFvHqkp4tn7PteD1FUxbQ5d9677RxTRSZ77Avsuez0D?=
 =?us-ascii?Q?wZbxd4irercjIX/xAexRjC6W5DBaRncXCWmMiKSgeNPiH2M5ai2nkwU+Gf8Z?=
 =?us-ascii?Q?9tzr2dRuLIht6HCzt3g3CpKmacxz6au2gjEDYRn0DIZ2RCtbtkReTAxeddVm?=
 =?us-ascii?Q?OaxCJdTK2Nu2HSfxZP+n/vSWLX7IrAjPEUtgvwp5MiATmFgG6uZYD3kB1xH1?=
 =?us-ascii?Q?USI0yhKtI3+h1vZo4z39hjZMoVkBzjye9VIZM3STV9hyknlVs/A9H5ve00xa?=
 =?us-ascii?Q?6ln6H6FsOQLCrzbDHBQ+QdI7phhyTRUAoNBzVjmEgd2gZ4goY4kxrU712Z7j?=
 =?us-ascii?Q?079kkqV4bCzCD+e+WnnwP4dAFGAcb8Kj71diRNniUX43XGJHuLJ/zC2bJVR1?=
 =?us-ascii?Q?oLnjwOAui9YEK3AB7gR8PAU/2qKGt5kYGygyllApPw7Z5BNYNIkO3qdZwxpa?=
 =?us-ascii?Q?sYjcRAjxO7m8EEA1aormKcHo1wN1G1XzeDFjgFIywi29u7+fHVAyFf7ScwV4?=
 =?us-ascii?Q?kCjwfPfa2Z4hYwQdGi1PaCckVMkKKp/MdjmvzLFLYuwbehB/nvSfJuwxhSJO?=
 =?us-ascii?Q?kNlFTFutm21l5ylwI7zrvI80gRT5MUXqbLA2wA7uwD+cyfkBcwDV/rFVsriq?=
 =?us-ascii?Q?nCmsHpsuWg3dAEGFw4XbULZXdln/5zJkdboDceK6UWWM/v6A0tko36Q6R8A2?=
 =?us-ascii?Q?/G/dA4OC8SFGdGSBBqDI5zOZFULD74+6EEt45kwH3ab1JeXBdCsxx+2ebyZn?=
 =?us-ascii?Q?NX9WAwmRSsmnASWjSroMe1rndlsnma2VAAfd+C0qd+7ZKI3DHb0bK7WYiQXk?=
 =?us-ascii?Q?Yg0ENTt26IO/HGf+Y5h6Q+MuErI/WzF9hGSvw761FnePRzATZzJItxaE9VEv?=
 =?us-ascii?Q?CmFf8MreOZA4ZtZwdFIBqPg1fIYrOl5PcmDyg8Ut8ra08ZtzCZSIqUUMypSs?=
 =?us-ascii?Q?bRgs9vbuVAJ8znO7PKXz6w31kBNWBeomTj9zzkcT8qHonlBv3DRlLUMdu6hM?=
 =?us-ascii?Q?ydgJ8/h3C1YQg6Nn7i8LMkXXIIaK8ICvek0Wf6zU0P+PvFcAATtvBXcz34gC?=
 =?us-ascii?Q?gJt8nRr2D7W8XqeYD4vYTPV3dHav3YVZOQopamY9jb4Rl7Oy3uNGsJhcN/4o?=
 =?us-ascii?Q?NSNZxKxxj2eDe1l77+qsqBCWwyUFCRiUc3UwkiRu7+d+rDEHmIwmNHNVT8AN?=
 =?us-ascii?Q?fncYjhD2p2hVnq+5bMVxkLcM4OIuHzwEQ+UiRq4tQ4B67uinnlGyS4pLBsNB?=
 =?us-ascii?Q?fJeozsmgj7EdbrteD54cQasJbNLUmJ2pG3/GvpGEiTijPrA9ntfgPChKle5C?=
 =?us-ascii?Q?+g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a34e18a-4ca1-401d-b40e-08ddc2e5fc10
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2025 14:51:59.4139 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k/ew3VgPXW0ev6LxtOfZpzQ0lYwuqa6L3cvCAar07yKQuFp52E/TN/OSVhL0+AZZPUoSQYLHY/khWXpaHl9zwtQ1bnQ96FrUgKz8pO1Ty2I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF6A4412A55
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

On Sun, Jul 13, 2025 at 07:37:01AM +0530, Raag Jadav wrote:
>If the device is running older pcode firmware, it is possible that
>newer mailbox commands are not supported by it. The sysfs attributes
>aren't useful in that case but we shouldn't fail probe because it.
>
>Fixes: cdc36b66cd41 ("drm/xe: Expose fan control and voltage regulator version")
>Signed-off-by: Raag Jadav <raag.jadav@intel.com>
>---
> drivers/gpu/drm/xe/xe_device_sysfs.c | 7 ++++++-
> 1 file changed, 6 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c b/drivers/gpu/drm/xe/xe_device_sysfs.c
>index 8250aa4620ee..654a1ba92311 100644
>--- a/drivers/gpu/drm/xe/xe_device_sysfs.c
>+++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
>@@ -160,8 +160,13 @@ static int late_bind_create_files(struct device *dev)
>
> 	ret = xe_pcode_read(root, PCODE_MBOX(PCODE_LATE_BINDING, GET_CAPABILITY_STATUS, 0),
> 			    &cap, NULL);
>-	if (ret)
>+	if (ret) {
>+		/* Don't fail probe on older pcode firmware which might not support this command. */

instead of a comment here, maybe it should be a debug message?

if (ret) {
	if (ret == -ENXIO) {
		drm_dbg(&xe->drm, "Late binding not supported by firmware\n");
		ret = 0;
	}
	goto out;
}

Lucas De Marchi

>+		if (ret == -ENXIO)
>+			ret = 0;
>+
> 		goto out;
>+	}
>
> 	if (REG_FIELD_GET(V1_FAN_SUPPORTED, cap)) {
> 		ret = sysfs_create_file(&dev->kobj, &dev_attr_lb_fan_control_version.attr);
>-- 
>2.34.1
>
