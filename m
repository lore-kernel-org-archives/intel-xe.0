Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3F85D6AB1B
	for <intel-xe@archiver.kernel.org>; Fri,  3 Apr 2026 00:25:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1633210F294;
	Fri,  3 Apr 2026 00:25:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OX0s6gB5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA20F10F294
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Apr 2026 00:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775175930; x=1806711930;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=4qIGAvKZj8wbSVuCC6/kOTDDYK/0YvEO11SbmM8mLUE=;
 b=OX0s6gB5XHmwdbqagMsQC7Q1e3WafWVeEUQvY9BQU+eY1yToajBlvyel
 BpAQt1LuDnzGfONeydlzYmftokYUd0YdZKBRspFHNIaX6l9aaxWkousaJ
 zrCU+dgCXxPF9Cxf4JG9R0e83Jge0AAOP+TY3eSpSc564Nao7dn4Mf4Ym
 uNze9K6CyT4iXfZrNlBb/CRn4p0vdaZzu+kClfZR869c7XpkCrSXVYZGq
 nkWZ2a/Xtm4gwpdSziewgfqZyL5f3zvuaFJQFjOBNxeU0Ar8fFmCfhdo0
 k6/Z36CuBkfVyc1MEuVLigh3Dizd/7nVVG/EXDGzFmm0InJUJR7ybOlR2 Q==;
X-CSE-ConnectionGUID: voyzsLBvSnmyLpIESvVm5A==
X-CSE-MsgGUID: W4Yma9NZTnuCuY+YakFvFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="87635926"
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; d="scan'208";a="87635926"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 17:25:29 -0700
X-CSE-ConnectionGUID: 79K+qI7hRAqzQQo9I56nww==
X-CSE-MsgGUID: QZsj9Ej3REyipCxA8CxTVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; d="scan'208";a="257591108"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 17:25:29 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 2 Apr 2026 17:25:28 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 2 Apr 2026 17:25:28 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.17) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 2 Apr 2026 17:25:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iL5zlu+e6WGJvWDtzVojFgRcR1TJqSzrJ+TFBodU6AzsN7DeN5yrYiVnRDVqM7cWdccyM9rh2X11hc6j+AcfK7gwMbw7F2n1sdorpUIykdEH6liXg9u6keiTQZ71DliNSzEuqMc4lPVuEBzL85DbgUVRCpD4SeU8U2EMmfCxxi3I/3NWBr2O1tSZBJ/nlRjK29/FeKatYE9x8FjvhSBuqo/Oc7DGIDw5fAZ7+8nfdtMBuqSVXTVWplG26R07JfDgE6j+5DoKe7FYdpX7cHTbhWf0zTabciBTvbOinFIxg0YCRK4ak3qo+3WJIBDbCfWHnWFpy6Ox8lkDIEtlFVKThA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SJmNEojo7YOPfndVgR4JuWdbazbAvzAbR3u9dpDQy88=;
 b=gmr/rEQzChzn6WvcjS3RUcFNDlhAw/uzJogLgKguyE5gLmGL+hdFQFj11MqPrxNQlul+E3lxzM5iTQ9XTXEJXCgvZE0nF2PCfXKgfeQJeX0C/BRW6MqOp/Lc8EfEulnNLsvI/FPBlZZw2SuBbwf/K1AeqP8x9fPjRN5czFnd+bKdiPjMDvXbHeTvl35M51S3Ly8wGhrcimEY9y/qvEZJOhres7hv/bYk3/J45RKghuKcRMrWk4awTyrVE0XHFd0Y2EpOxh+JVB341kiU90wCPTxiRygmJUnDLJ1AOvNijBhCS3nP11Tj0LSH1Eo+SgcGs3uW9IhFZsdroYF1nUK4/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by DS4PPFE70B31BEF.namprd11.prod.outlook.com (2603:10b6:f:fc02::5a)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Fri, 3 Apr
 2026 00:25:22 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5%7]) with mapi id 15.20.9769.016; Fri, 3 Apr 2026
 00:25:22 +0000
Date: Thu, 2 Apr 2026 17:25:19 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>,
 <stuart.summers@intel.com>, <arvind.yadav@intel.com>,
 <tejas.upadhyay@intel.com>
Subject: Re: [RFC 10/15] drm/xe/svm: Handle svm ranges on access ctr trigger
Message-ID: <ac8I76G9/3qo9+wW@gsse-cloud1.jf.intel.com>
References: <20260318074456.2839499-1-himal.prasad.ghimiray@intel.com>
 <20260318074456.2839499-11-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260318074456.2839499-11-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: SJ0PR03CA0004.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::9) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|DS4PPFE70B31BEF:EE_
X-MS-Office365-Filtering-Correlation-Id: 93ede2a8-e125-4d9d-ccac-08de91177e2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|22082099003|56012099003|18002099003; 
X-Microsoft-Antispam-Message-Info: Pxk3eAPYJ1xongCYoHLaHqSwDwURLrXw2pglY/NoQA4cKYwDDp/OIObCrPoAOiyVQDA+UqpPmnqSMXEfPpT0ZO3661BFRQ+OD+PgmAVQ75s5qxFzTGh5clYfhTEBS2l0dRGzAlxds83bRuqQNM4sMsHEX2mhztV171bB8BkN2S1yZFZAPHOP4IWsPqq1BUw2bFSN5/X2ejWhlAedBeZbJZsuxHoaPkAsizoCpKMp3VsSe1AQt8XlBUF3XDM6Htu/uLXhGuTWbJuWhV1vv5YC/+aJ9oq3fKsscRpyi5IXRJmeYLDZawoSGwZQKjr7nu1Wmkwhvz/E4Japp5r6uPnepbTTOnUeP1rnuUV/AXV/OjBKgQcQjWnaOv+wn8ddvXhhzoLKmz5uMyiYaZBAhE9wlOeRa/Li2+QWl5cDSSatPCOVrOtTEAwbnWWzX8k6Bgap6TIuMJl1Uy4Grz8wyWmVVRQrliZMqm0UioDoM1XdoHb5UhbJn8B2BXi6bPnHwtx0ZZZ3j09x/1mz5qH85Swb6w7TUhuVMo6bjvAgQof+LnzZsx2rE5TDWZ8I68JHvbh/SP86sY1WUnqFs4QyJfQjdHpruNhNl2gZl6v/odzPFQ4Yh0hrSyritz3Ln0jFIyk/EjuOIQqgi31BrHDgZe7MjgHPzIEKT5rs9nrDDMuLUJ6nKOmGAsdJ6b55bdDh5Ijn
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eGNIWHhDUzUzZ2M3YUQ2enB4YVFyVG1kbzlUZE8vbWI1Z3JYcEpZOU1jejV2?=
 =?utf-8?B?aFFWcklnL1hHOFhtZEFoZVFWa2FPVzJadzV4RFpHaFRjY1ZMZzI2WkthYUk0?=
 =?utf-8?B?S1EvaXFzT3VRc1hEN01ENlFia3RnQzBEb05sSzdrUDVaUXIxY3U4dklIS1B2?=
 =?utf-8?B?WnBTM0t5ZUNpU3o4NmRKd1QySUc3RHgwbFlLQkllN2Y4Sk9jVlZMRUtUeDYx?=
 =?utf-8?B?U0lKekxydHdCSzlHN2NBa0crQy96RE1vTHdqdjgzQXhtZzRVc1JkZmpRWXRW?=
 =?utf-8?B?MW9wSU5lT1NwWmVISFJRMXRFbGlvM0hsMTZuSitGOEIwSUlqVjZsMEJpaitp?=
 =?utf-8?B?dXpwVnluWVFRUXRWcEFQbm44MTZYMFowVjdwbW0ydjBuajlrYTNDT3FacTBO?=
 =?utf-8?B?c3JQZWpnWjNtSGE5dnpQOEdkSU5ZdlRxUG52RktsQmljeEZrZnl4N2tMN0ox?=
 =?utf-8?B?b2U0MFlDK0U1MmN5Y1d5MlhFaElGbHRXbGxqWFpiaEdHQVliQXBXalZlWDJO?=
 =?utf-8?B?aVR6VnltWUt2czRET0ozc3R2SHhXY21VMkt6VTYxUDFwc01abE9xTDFYNEZk?=
 =?utf-8?B?TGdGZXBxNFY3QUZRMWMvSXNLMnl2VWtuYUYwTGRlcCtjMERDaEphdEJHek5D?=
 =?utf-8?B?Q3BUY3ZqYjdHaUl2cXBoRGszZGtEcmNCNm5EYURPdjRSMm1hQzZKUHRMUnNh?=
 =?utf-8?B?ditZUmJxUG9VQWNCMnIxWWp0NjdLK0E4V0dhaGN0dmdjT2owdzNINVpvUVpq?=
 =?utf-8?B?eXJmMlNhRUxmcGxXa0w4SVE2SVp5QzdJOGIrUmpqeEIvL3hVdVBjbDFETmsy?=
 =?utf-8?B?cEZlOFluaUp4eHd6SEdzM3cwYkp2b0dyREZteG5heS9jNE9mQWxsRyt2Q2tC?=
 =?utf-8?B?UUVFWVhvb1k4cmY4V2ErWGl2WGJUSW1JcWwzWUlKb1N6SDh3R0pNRnNIR1Bu?=
 =?utf-8?B?aS8rODJQMzUrSVRDSVhGdXB6RFBjNjdBVkNzc3M3c3JwOGdMRWNtQU9sL0Fo?=
 =?utf-8?B?NDZ2WWEyNWpEQjBwa0h6TmV0WFYvUmlQdmRxczhaVzk1RnlxejVTbHNyZ21v?=
 =?utf-8?B?aUpQQU5JNEh5ZUNlck5QR1hjcllyTTBqclhIekxzRFl6Zm9BcVQ4WVBMSXpN?=
 =?utf-8?B?VS8zcFBvTDRIQzJqSHNXYjVVTTFPQ29IMXlTZERNWW84ejExTjEzc2NFNThX?=
 =?utf-8?B?V2g5VjY3T29KVTJvWEcxRFJyRWFFSHF0V1JvRG5USmZZTEJTMlZiVXlBU2ZB?=
 =?utf-8?B?RUJJUWFIUFRnQlRmdW54ZEpiZ3ExeDAwZmp1T3RNaWVkVE1aYVZYWXFaNnFI?=
 =?utf-8?B?anI3bXREdnh6a0h3dEVGbEtaUXdGWm85ZGxTQ01WemtUUkhjdHprWENyc0RS?=
 =?utf-8?B?bVY0R2plV3VVY0wyMkdLZ05jTzk0OE11bEZSbXFZNlFmS09qVmtTbkI2Kzlj?=
 =?utf-8?B?SjBJNkh3ZGFyVDE2bFpRRFlaQlk5ZndzMCtGZDZTU0FxMTBVaTduZGtTNXBU?=
 =?utf-8?B?YklDNzg1cXBUcXNWVkNoSGRoTUVCM3Q2dExYWUlhOHM5ME04T1k0bkJQZ1Ro?=
 =?utf-8?B?VnpvZWRiMmFmanJhZVh3Q3puUTRObzc3cXJ4eGJHR0F4a2tpczIxeWtDakZJ?=
 =?utf-8?B?cFpvektUVG9IeFkvcG9xUUVBU091b1BPRGY0eGhBdGxIbjR6RFJQYy96eU5p?=
 =?utf-8?B?TXBOV1hsbDJjNU1LUTV0Qm5YRldTbTdWOHlVb2JJVXNXcEZPOFVkenNQRkZP?=
 =?utf-8?B?a3ArZG82bXI5QVNadjJrWWhjeHZ3MTc3TndtTERnYUZVWVU3bDBtRmZRNUdo?=
 =?utf-8?B?MTFZeUIwbHZ1SkkxWVVWWHNLL0JFM0l1anR5S0JObzQ1V0hOUkxEanI1c29v?=
 =?utf-8?B?WEplVjg5eVZIM3NTL3Rsa2dtbFVKR1lieUQ2TjdiUHNnbUluOU9jT0NyWjI0?=
 =?utf-8?B?dnhVdWx3eldoeXArekhYRzhzZVRseDVMa0hlbHVVb09saVV4dlMwSUlMYVRK?=
 =?utf-8?B?blg0dkhkZkcyWlZZS3pZMW8vUkRKbHFYeWxxelBLdlRPS2IyWHY4dkcvWDFy?=
 =?utf-8?B?MVltcC9GQUphMG0vUDBoVnFOSENVenJETm9kMzJuWUhSbGhnM0lZdm8rWFBo?=
 =?utf-8?B?OVFjL3NDMjVhZHE5WitMOFF3RVRCN2hvVVE5OStpWFF4amQ5cU1vVW1SM0Jj?=
 =?utf-8?B?T2d5OE5oWUFTSzY4RitXWjlyUFhVdGx3Y2xlaDZvaVNDSFV5RXFWNFRObXhK?=
 =?utf-8?B?VXFYQkRJdWJsQmxob2ZEcURQR1NxVWxjY1U4OTNqeWxuTUtXc1JuemdGR0lJ?=
 =?utf-8?B?b1FxUWR0RFMzb2ZHUzd5MTBIZUUzZnM2UkJycWNicEpxR1RhajlTeVhPZDNQ?=
 =?utf-8?Q?IG+LVefKpM0wijTE=3D?=
X-Exchange-RoutingPolicyChecked: Nuyq0c2cOAptywtoiT2Eevv8ZYXbNb/8SCuQqrColAXpgLnZl+gFREiu2xT9Nh9Lnd77Z43fk7w3mKZ9Qy5zrGvBQp+60WJwAx+lmdf0WV7CrX5jrGmjlFlJFrDBviqyie6M1h+nTKSOPN3mSf0mP7SXdweI943EXRHFxM7AXzLTFbcqQyQhAayJN7DZg8ypSFPom53b0Uf1g4WX6s5Vqb84S0P5gutRBhBnvT2CYobOfHXAZ82SpI1YhXPQ/VPQMGYrW/Ko0+hTWPEi/CTCI5JaRpXYBV2lajQwdd5aKnJwux1H/wmcbvonLofQtZWXYTfvqCzrsQ2mjvfXwZqJdw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 93ede2a8-e125-4d9d-ccac-08de91177e2a
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2026 00:25:22.2085 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wXo3OjYo92wFUKTkTkwriwkNU65nTOed7LbC8J/MWMVlO89G4KIj6rsV9h1iPCdzw2p9DTRoAlr+A/VRf7lLRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFE70B31BEF
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

On Wed, Mar 18, 2026 at 01:14:51PM +0530, Himal Prasad Ghimiray wrote:
> Migrate ranges to local vram and setup pte for gpu access.
> 
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_access_counter.c | 30 ++++++-------
>  drivers/gpu/drm/xe/xe_svm.c            | 59 +++++++++++++++++++-------
>  drivers/gpu/drm/xe/xe_svm.h            |  4 ++
>  3 files changed, 63 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_access_counter.c b/drivers/gpu/drm/xe/xe_access_counter.c
> index f93618faab02..ba15f21c6803 100644
> --- a/drivers/gpu/drm/xe/xe_access_counter.c
> +++ b/drivers/gpu/drm/xe/xe_access_counter.c
> @@ -13,6 +13,7 @@
>  #include "xe_device.h"
>  #include "xe_gt_printk.h"
>  #include "xe_hw_engine.h"
> +#include "xe_svm.h"
>  #include "xe_trace_bo.h"
>  #include "xe_usm_queue.h"
>  #include "xe_vm.h"
> @@ -42,20 +43,14 @@ static int xe_access_counter_sub_granularity_in_byte(int val)
>  	return xe_access_counter_granularity_in_byte(val) / 32;
>  }
>  
> -static struct xe_vma *xe_access_counter_get_vma(struct xe_vm *vm,
> -						struct xe_access_counter *ac)
> +static u64 xe_access_counter_get_va(struct xe_access_counter *ac)
>  {
> -	u64 page_va;
> -
> -	if (ac->consumer.granularity != XE_ACCESS_COUNTER_GRANULARITY_128K) {
> -		page_va = ac->consumer.va_range_base;
> -	} else {
> -		page_va = ac->consumer.va_range_base +
> -			  (ffs(ac->consumer.sub_granularity) - 1) *
> -			  xe_access_counter_sub_granularity_in_byte(ac->consumer.granularity);
> -	}
> +	if (ac->consumer.granularity != XE_ACCESS_COUNTER_GRANULARITY_128K)
> +		return ac->consumer.va_range_base;
>  
> -	return xe_vm_find_overlapping_vma(vm, page_va, SZ_4K);
> +	return ac->consumer.va_range_base +
> +	       (ffs(ac->consumer.sub_granularity) - 1) *
> +	       xe_access_counter_sub_granularity_in_byte(ac->consumer.granularity);
>  }
>  
>  static void xe_access_counter_print(struct xe_access_counter *ac)
> @@ -88,6 +83,7 @@ static int xe_access_counter_service(struct xe_access_counter *ac)
>  	struct dma_fence *fence;
>  	struct xe_vm *vm;
>  	struct xe_vma *vma;
> +	u64 page_va;
>  	int err = 0;
>  
>  	if (ac->consumer.counter_type > XE_ACCESS_COUNTER_TYPE_NOTIFY)
> @@ -104,7 +100,8 @@ static int xe_access_counter_service(struct xe_access_counter *ac)
>  		goto unlock_vm;
>  	}
>  	/* Lookup VMA */
> -	vma = xe_access_counter_get_vma(vm, ac);
> +	page_va  = xe_access_counter_get_va(ac);
> +	vma = xe_vm_find_vma_by_addr(vm, page_va);
>  	if (!vma) {
>  		err = -EINVAL;
>  		goto unlock_vm;
> @@ -112,9 +109,12 @@ static int xe_access_counter_service(struct xe_access_counter *ac)
>  
>  	trace_xe_vma_acc(vma, ac->consumer.counter_type);
>  
> -	/* TODO: Handle svm vma's  */
> -	if (xe_vma_has_no_bo(vma))
> +	if (xe_vma_has_no_bo(vma)) {
> +		if (xe_vma_is_cpu_addr_mirror(vma))
> +			err = xe_svm_range_setup(vm, vma, gt, page_va,
> +						 false, true);

Can we split out access-counter handling for SVM versus VMAs into
separate functions, similar to how page faults are handled?

For example:

211         if (xe_vma_is_cpu_addr_mirror(vma))
212                 err = xe_svm_handle_pagefault(vm, vma, gt,
213                                               pf->consumer.page_addr, atomic);
214         else
215                 err = xe_pagefault_handle_vma(gt, vma, atomic);


I think this would make the code slightly more maintainable and clearer.

Also, can we add a flags argument to xe_svm_range_setup instead of
passing two booleans?

Arvind just did something similar for vma_lock_and_validate [1], and I
think Xe should move in this direction—avoiding multiple boolean
arguments, as in Arvind’s changes. It much more clear at the caller what
via flags rather than bools.

Matt

[1] https://patchwork.freedesktop.org/patch/714449/?series=156651&rev=11

>  		goto unlock_vm;
> +	}
>  
>  	/* Lock VM and BOs dma-resv */
>  	xe_validation_ctx_init(&ctx, &vm->xe->val, &exec, (struct xe_val_flags) {});
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index a91c84487a67..fe0f86a2d0bf 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -1186,9 +1186,9 @@ DECL_SVM_RANGE_US_STATS(get_pages, GET_PAGES)
>  DECL_SVM_RANGE_US_STATS(bind, BIND)
>  DECL_SVM_RANGE_US_STATS(fault, PAGEFAULT)
>  
> -static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
> -				     struct xe_gt *gt, u64 fault_addr,
> -				     bool need_vram)
> +static int __xe_svm_range_setup(struct xe_vm *vm, struct xe_vma *vma,
> +				struct xe_gt *gt, u64 fault_addr,
> +				bool need_vram, bool acc_ctr_trigger)
>  {
>  	int devmem_possible = IS_DGFX(vm->xe) &&
>  		IS_ENABLED(CONFIG_DRM_XE_PAGEMAP);
> @@ -1196,7 +1196,7 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>  		.read_only = xe_vma_read_only(vma),
>  		.devmem_possible = devmem_possible,
>  		.check_pages_threshold = devmem_possible ? SZ_64K : 0,
> -		.devmem_only = need_vram && devmem_possible,
> +		.devmem_only = (need_vram || acc_ctr_trigger) && devmem_possible,
>  		.timeslice_ms = need_vram && devmem_possible ?
>  			vm->xe->atomic_svm_timeslice_ms : 0,
>  	};
> @@ -1213,7 +1213,8 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>  	lockdep_assert_held_write(&vm->lock);
>  	xe_assert(vm->xe, xe_vma_is_cpu_addr_mirror(vma));
>  
> -	xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_PAGEFAULT_COUNT, 1);
> +	if (!acc_ctr_trigger)
> +		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_PAGEFAULT_COUNT, 1);
>  
>  retry:
>  	/* Always process UNMAPs first so view SVM ranges is current */
> @@ -1229,7 +1230,8 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>  	if (IS_ERR(range))
>  		return PTR_ERR(range);
>  
> -	xe_svm_range_fault_count_stats_incr(gt, range);
> +	if (!acc_ctr_trigger)
> +		xe_svm_range_fault_count_stats_incr(gt, range);
>  
>  	if (ctx.devmem_only && !range->base.pages.flags.migrate_devmem) {
>  		err = -EACCES;
> @@ -1244,6 +1246,10 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>  
>  	range_debug(range, "PAGE FAULT");
>  
> +	if (acc_ctr_trigger && !range->base.pages.flags.migrate_devmem) {
> +		goto out;
> +	}
> +
>  	if (--migrate_try_count >= 0 &&
>  	    xe_svm_range_needs_migrate_to_vram(range, vma, dpagemap)) {
>  		ktime_t migrate_start = xe_gt_stats_ktime_get();
> @@ -1307,6 +1313,7 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>  	}
>  
>  	xe_svm_range_get_pages_us_stats_incr(gt, range, get_pages_start);
> +
>  	range_debug(range, "PAGE FAULT - BIND");
>  
>  	bind_start = xe_gt_stats_ktime_get();
> @@ -1347,21 +1354,22 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>  }
>  
>  /**
> - * xe_svm_handle_pagefault() - SVM handle page fault
> + * xe_svm_range_setup - Setup range for GPU access
>   * @vm: The VM.
>   * @vma: The CPU address mirror VMA.
> - * @gt: The gt upon the fault occurred.
> - * @fault_addr: The GPU fault address.
> + * @gt: The gt for which binding.
> + * @addr: Addr for which need to bind svm range.
>   * @atomic: The fault atomic access bit.
> + * @acc_ctr_trigger: If true, always migrate to local device memory.
>   *
>   * Create GPU bindings for a SVM page fault. Optionally migrate to device
>   * memory.
>   *
>   * Return: 0 on success, negative error code on error.
>   */
> -int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
> -			    struct xe_gt *gt, u64 fault_addr,
> -			    bool atomic)
> +int xe_svm_range_setup(struct xe_vm *vm, struct xe_vma *vma,
> +		       struct xe_gt *gt, u64 addr,
> +		       bool atomic, bool acc_ctr_trigger)
>  {
>  	int need_vram, ret;
>  retry:
> @@ -1369,14 +1377,15 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>  	if (need_vram < 0)
>  		return need_vram;
>  
> -	ret =  __xe_svm_handle_pagefault(vm, vma, gt, fault_addr,
> -					 need_vram ? true : false);
> +	ret =  __xe_svm_range_setup(vm, vma, gt, addr,
> +				    need_vram ? true : false,
> +				    acc_ctr_trigger);
>  	if (ret == -EAGAIN) {
>  		/*
>  		 * Retry once on -EAGAIN to re-lookup the VMA, as the original VMA
>  		 * may have been split by xe_svm_range_set_default_attr.
>  		 */
> -		vma = xe_vm_find_vma_by_addr(vm, fault_addr);
> +		vma = xe_vm_find_vma_by_addr(vm, addr);
>  		if (!vma)
>  			return -EINVAL;
>  
> @@ -1385,6 +1394,26 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>  	return ret;
>  }
>  
> +/**
> + * xe_svm_handle_pagefault() - SVM handle page fault
> + * @vm: The VM.
> + * @vma: The CPU address mirror VMA.
> + * @gt: The gt upon the fault occurred.
> + * @fault_addr: The GPU fault address.
> + * @atomic: The fault atomic access bit.
> + *
> + * Create GPU bindings for a SVM page fault. Optionally migrate to device
> + * memory.
> + *
> + * Return: 0 on success, negative error code on error.
> + */
> +int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
> +			    struct xe_gt *gt, u64 fault_addr,
> +			    bool atomic)
> +{
> +	return xe_svm_range_setup(vm, vma, gt, fault_addr, atomic, false);
> +}
> +
>  /**
>   * xe_svm_has_mapping() - SVM has mappings
>   * @vm: The VM.
> diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
> index b7b8eeacf196..50861d93b12f 100644
> --- a/drivers/gpu/drm/xe/xe_svm.h
> +++ b/drivers/gpu/drm/xe/xe_svm.h
> @@ -85,6 +85,10 @@ void xe_svm_fini(struct xe_vm *vm);
>  
>  void xe_svm_close(struct xe_vm *vm);
>  
> +int xe_svm_range_setup(struct xe_vm *vm, struct xe_vma *vma,
> +		       struct xe_gt *gt, u64 addr,
> +		       bool atomic, bool acc_ctr_trigger);
> +
>  int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>  			    struct xe_gt *gt, u64 fault_addr,
>  			    bool atomic);
> -- 
> 2.34.1
> 
