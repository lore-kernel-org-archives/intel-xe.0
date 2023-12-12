Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6388DC4332F
	for <intel-xe@archiver.kernel.org>; Tue, 12 Dec 2023 21:48:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21A2010E695;
	Tue, 12 Dec 2023 21:48:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90EB610E694
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Dec 2023 21:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702417717; x=1733953717;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=bTR51FJstsZ1M8BzKDKGtGsqa74HOK0TNiO+uFrVl1E=;
 b=FbAPMPU0FTNX8k73rNP+kFsCW9PpwBffs870bEDaDCUhSxEac81ZE2aX
 3zZRKuusyW0HTYcDDPBjlVvTY6KsTAyy9ir7ADj1VieENZwRAIvnZn9xv
 Z57tgGoEsA/YV2xaY3kDhA92qyRCq5XJg2gF8ky63TJnMUaUAKcEGgksr
 XuC0a8iPkY21ab/KD3jyEniiQ4bnBQmq4YkyMCAlIS6p7Co/VqvqRHkG/
 WZJuIB0awwy7utviNZkjZT2J7N/OzZlDiha9r4e70ObJWkr3KaG8mD7z/
 xLp5OO612UsFeuIFnYcgmsDBckhGho2Wqm7Ny2zqCBABcA/woybQ18Cv2 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="481074951"
X-IronPort-AV: E=Sophos;i="6.04,271,1695711600"; d="scan'208";a="481074951"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2023 13:48:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="839595460"
X-IronPort-AV: E=Sophos;i="6.04,271,1695711600"; d="scan'208";a="839595460"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Dec 2023 13:48:36 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 12 Dec 2023 13:48:36 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 12 Dec 2023 13:48:36 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 12 Dec 2023 13:48:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dzdbo3ZvqqMftz1fjPXhDktXsdT419CSqGgPXgp3AIOK7QbZk0c1IzVEDyOZ7HKu/KlOkh0yWIqnweKPLlPYPKQzgCDU7EDrLiJ70AzuLzf9FHIsHK6nIoL950rSFCn5CJGWNjYil2M3YzSPMce1PRALApGoRESSATI3OUGcgBBDiCB+KRhqP+6hZwmUsONnfHWCy3e2H0iYC29x6s/CAJf0fbO5+ODQnn2l6XxKMxvIYSpWTRa7Eq7MwGUr12475azhW4685QA0Xio5Ny+uo02T6oSmUtvhZjO8puSa/5foS4fYywZJOWTbqqWNWDceb1zdiM7cR5c1DKLF9F/NNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fj+ZVd1vWy4dS+ZnkXGRQjTU7mz1F5UdJJn1Hc/ripE=;
 b=MF/BruSB71AzdDuzk3a1+gh3eaHyhPQiLIe6An12haZlEUNvVV5kMB9rmJRAKe0W/oIdyDrkDC5R+fYgofXMow60NNmV0Ig9Q5g29oKsg2e3WELdzwf45fsjTNvgYnNdQBcnw1YNEXxmCeOBDfX3JoXhLKhBhUsaFgUWKG71uBV+PJ9ys7l4vwi9FoTRD7sRoiWkjiHpnPlF7ABkJmZTwfu2go190VlZmrhRtBFOrWAi1tN2IzHe76t/iFIQCCaXpISUe5ZPom1abZIWimXV7lXrh/Kb1oHY3z8lCnmtTnTjk4iXiBGsZaQ92iDnsRuvB6dGVSqkUs+s9mRn6EKs+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SJ2PR11MB7618.namprd11.prod.outlook.com (2603:10b6:a03:4cc::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.32; Tue, 12 Dec
 2023 21:48:33 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0%7]) with mapi id 15.20.7068.033; Tue, 12 Dec 2023
 21:48:33 +0000
Date: Tue, 12 Dec 2023 13:48:31 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH 02/10] drm/xe: Add command MI_LOAD_REGISTER_MEM
Message-ID: <20231212214831.GI1327160@mdroper-desk1.amr.corp.intel.com>
References: <20231212210054.1747-1-michal.wajdeczko@intel.com>
 <20231212210054.1747-3-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231212210054.1747-3-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR05CA0203.namprd05.prod.outlook.com
 (2603:10b6:a03:330::28) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SJ2PR11MB7618:EE_
X-MS-Office365-Filtering-Correlation-Id: 25107f39-1db7-4c5c-20f0-08dbfb5c164d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DydyvnBB9zP3Pqi6jsFvk++GCQ3tANgnmEIysGfsk/sQBzgNmCu1SYMVvFtVHdfVWeY3uPrw3I4v4oIYGdLDbr6T9Td4noG2v282KscTQWF974Gvxrg88z2jljaI9hP+WqMPxk/6JQ00SoAv0UM+INJ/oP1F1dysyG08qiTSaTOwrf5n+PgiJ6Mf2Ar7j4tajbghZ9CkUpGbPgqARZYKGjvozFUD6LhSLh7lQhDobj/N9n4Hj2oy2KFhUZ6T2Z0WzAWyNQ4J7wCPTlsXIc+PJSATdRUS929eVOfZhkb8C8Qn4bS5hd7+PhK1tCUKfhQfEGZ+rYWl0OOyGxgYZhGATQDdv4pW/0Wm9SREXvdJAfJpMW+KjnUrEVDRogESAwhZPxjTFabX+OZnrf+787OI/5Qr0pjxqvCUcclNE4lOxyU+TM0q60haMiGfcbAW8PxX5f8ORbOTIL7xRch+z41nyuL67ie6CbNQSQGi92lYCtZeJV13Ns64Nui5TyxX23xrLGuTXhjNim/YnB2xRkWEzkJmjf2ejMUhC6yZZk9yaf82cKMu0yNTCmJbYurjiXHA
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(366004)(346002)(396003)(376002)(136003)(230922051799003)(64100799003)(1800799012)(451199024)(186009)(6506007)(6512007)(1076003)(5660300002)(26005)(33656002)(6486002)(66946007)(66476007)(66556008)(6636002)(82960400001)(2906002)(86362001)(478600001)(41300700001)(4326008)(6862004)(8936002)(8676002)(316002)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BMhDwfRXy2pQ2FkPTq9/PbPKvrW4mGt4bzWAOKEaPXbok4gDyXwpuecuKEYt?=
 =?us-ascii?Q?N3lcVRCrg3C+IbFFTuJtM1wGTclr/X6D883T4MXVA2DNZiBYRUXEA7YifKOw?=
 =?us-ascii?Q?R7oekM+TpAMilT8pomcfYBLjswNIdCAVzraKeW6iwPzIvNNTDg4TJS7vU6NF?=
 =?us-ascii?Q?QwatrnyairAIEPde1QHvEMDtLmJxBiXmz7Nqfm//e5mWWGO89CjEdvs1n7Cd?=
 =?us-ascii?Q?5wAMqiGxy+Xtx0xlHmYeb1Bxa2z/p1NvLjOL85ui8hmgXOgeeI3xUToj57yc?=
 =?us-ascii?Q?bxfwwglcJ/0fTw57leuuHykyYrPAC2m1Wy+JKGNDSwSrgmk2nXz2vV7b/ucy?=
 =?us-ascii?Q?aDKK1G8iCRZBuanaoHkWYRKbn+IM62Oq2tR/Gp21PZ63kVaRGxvRKq4ACzB7?=
 =?us-ascii?Q?UrL4KCsxyoi6W/EAya/vyWgPbcMMUkgUlqtHBcgUEb+dcJ2NHyVjnlfV+G6C?=
 =?us-ascii?Q?Uyr1vPlr6WNjwptq4GxelX+46zr61U+2wfUZEqcBpOnO7Gl6wLP/xo5j9212?=
 =?us-ascii?Q?XGC6wAe2u1N66QQLJCnTPv0uq0ZY97YqzKGydEqa6poudNY9F3sQ06/n5JCO?=
 =?us-ascii?Q?zUkj+Y5rsKG9DJHUaWu0L0/t8+JdRLYKKmkC8KLZFp+KYGYxARBNmD1CC70F?=
 =?us-ascii?Q?Lj35h2nmOc8+E2tOsqFPPobGOrQm5uz50mP0D+O1/bzsye2r5v4QpgkxZP9d?=
 =?us-ascii?Q?D18GV8cazPES+eEaFBQwwM3ygVZGxspRdEHmSXOQTeaEuUmR07G3HfZ9ltcb?=
 =?us-ascii?Q?KdLwKMJeQ5izho6WU6kpNfgXzIKy5/mAlDU0hqXrG6nsV1pFKSbu9cp4YvP1?=
 =?us-ascii?Q?MD+JaDdK5AffyClNXKYC+mwSRW/kiH5T4NVqjTW+9PIBLgjiE3ko5KpVzKgg?=
 =?us-ascii?Q?Hq8sT8KJkf+ndQB9elX2i10KOlfgbumjUJwZvNXM94X9lV+a3rIS0HMWFOTR?=
 =?us-ascii?Q?ajvWLn2Axa+IEpWz6eKS2KBZe9aO9oowFgag9vE/YnNaZoUl7iXzu+KnzcdQ?=
 =?us-ascii?Q?sCzxci5lyu+haV1LuW7CAgg3YOn9ELLY72uTY1QhFJ2YjXBZrx/AZD90v/d6?=
 =?us-ascii?Q?bQ4JMuMCxg2YZq/ty6APTtiXBNoux96hfaxVotf35nzRuhAEfAouzIMNE9hE?=
 =?us-ascii?Q?6RlE3t1829p9tqu+5glzgW7PAfcVsbCO2awvHqjN3MQTAObFzxXuGa2rb8Cu?=
 =?us-ascii?Q?Nf7u1w13P8eSbedBzGY6Be5WYkwWVtX/94dRSBq0RR3q1czsdjYgeZltpRwL?=
 =?us-ascii?Q?w1XEPfNUdNu0gyJOFjITw4xY/c/0fm8J+wK+6xGYOFxe4EyRFxvJAid8WTPF?=
 =?us-ascii?Q?ShurEmLco7bCg+yIVVCwq1v7c00PMx+VHh51n9RA0blQG3Sjr06/g1G1p6iU?=
 =?us-ascii?Q?neaLkXCR4ECWAW9/CP158Tpq0J84tV6k7EENQj2RYHGs+MsfNIxHLjvAApsg?=
 =?us-ascii?Q?ws7o/mIZjhyMt0NCXm/4dubj/2LoHWoeSGmU/ypOGp3xEJxVvEr2yfESH9I3?=
 =?us-ascii?Q?Ji0vPcL+aMIliG/gWqLwV1BamPtEeq2kZa0uvh5sVkeOtiuEOm+bx77MtUWJ?=
 =?us-ascii?Q?69HkhluaI0BLZ8D4/N6vIxthWl3jt13qLkqof2Ucf9YvpLcffGJYCNqt2moH?=
 =?us-ascii?Q?gQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 25107f39-1db7-4c5c-20f0-08dbfb5c164d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2023 21:48:33.4151 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xy4FOsThESMhp4F6aBj6YWZqhmPEdMZE8ix//dbwLhTX6kAqdCAvHa43TCmc0bQyV8pZyMLoPo61H8Mo3yiDBCRsSQBu8BkPiTtMHuDVIhg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7618
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Dec 12, 2023 at 10:00:46PM +0100, Michal Wajdeczko wrote:
> We will need this shortly during context state preparation.

We should probably add decoding of this instruction to dump_mi_command()
in xe_lrc.c.  It looks like the Xe2 CSFE context includes a MI_LRM to
load the IRQ mask from context memory, so this command actually will
show up in our debugfs default_lrc entries.


Matt

> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/instructions/xe_mi_commands.h | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
> index 1cfa96167fde..c74ceb550dce 100644
> --- a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
> +++ b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
> @@ -56,6 +56,9 @@
>  #define   MI_FLUSH_IMM_QW		REG_FIELD_PREP(MI_FLUSH_DW_LEN_DW, 5 - 2)
>  #define   MI_FLUSH_DW_USE_GTT		REG_BIT(2)
>  
> +#define MI_LOAD_REGISTER_MEM		(__MI_INSTR(0x29) | XE_INSTR_NUM_DW(4))
> +#define   MI_LRM_USE_GGTT		REG_BIT(22)
> +
>  #define MI_BATCH_BUFFER_START		__MI_INSTR(0x31)
>  
>  #endif
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
