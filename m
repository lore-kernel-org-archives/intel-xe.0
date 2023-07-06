Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18588EB64DC
	for <intel-xe@archiver.kernel.org>; Thu,  6 Jul 2023 03:44:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD77110E3D8;
	Thu,  6 Jul 2023 03:44:23 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A04110E3D8
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Jul 2023 03:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688615062; x=1720151062;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=fMecejyha/ONk2lQUomuv5efkZEAWJnCjMDT39ghbqM=;
 b=jn8aFshFCmqW6MbYFhWqaApZpdr30HUePvQI94CVOUpUxKYbZWvj1P4r
 ObEwAgHoje+yCvE+nGzvmno1jlohSSqruHoVCx9sVUoVfD1ktX/fC5uLQ
 +xslP+VTXIYghbTyviOInglhGHHMEYlz/31ZbswinCQriyJLNTN+C9yyI
 4HlrXs2z3YOJPcTmQpPHym1vQeLd1xMWzNkLxgYSIxvvbTxyoBBp/7k2H
 xAgxeiaW0z5GfLRSawA1gVN0e9DrlHINMpcoyoiYJGcov/V9FDA+PaBrw
 I9EyrkIgHKweIRzLk+GeUWpxMSBVet6DLNAVf41exG1MUswigPYkoLWsa Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="366072214"
X-IronPort-AV: E=Sophos;i="6.01,184,1684825200"; d="scan'208";a="366072214"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2023 20:44:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="713405049"
X-IronPort-AV: E=Sophos;i="6.01,184,1684825200"; d="scan'208";a="713405049"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga007.jf.intel.com with ESMTP; 05 Jul 2023 20:44:21 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 5 Jul 2023 20:44:20 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 5 Jul 2023 20:44:20 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 5 Jul 2023 20:44:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kfs6zYm+RNl7tpHC8CHpkEQV8zAkcUwT43Ubo5apBMQebsT7vR3pkz9EBN3lJnHPpvv02utAYFLpYafUmViP8HpaHsHTECvNmSC4fdCp9FhlWFUI4vZIFTdaP2kvAwBBdtc5c22q3uUBCu4WcFcWVs3P8/TXmKCFcD2Ni5Yp7c+aUg1R4icbrF64M6f+3Havbj14Hvb4UZ+hYH74B7Fw22ShQNWJ0YRhlbJaPXqX8+AajGJuKPKMsLI9WEBS/jixv5cseO6GMrHIyHx4gR2nPg5/G+WnLJj+pL9R0MZHgqfl/6qKdGGikInnJM4ITCRkh4Du4Rw9/zUjmLRiQFB5Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aBKXXT+lTytYpiQFZc1ySBWWMCqKR8Qej826dcNM2LI=;
 b=UYyCnNZGmavost2XCZ+qSQYtPiqoo67K7KKBvpKInHYfLqqOfpXB5o00BMllFyVbMLiCtVI67Om/VBw3S5fRenAO8hdBCxBNPWg+0guTFWev5A3nxj8t8dpgGru4ehriOoKeMrHj3r7W/4NJOJf6mQzf5E3aP2NGo38Tfa9Cp2uFkXGxiALVVnV05s4vJT+q+9JuwCnLtxfOSVgMJGxwZoeqdl1KgWpGOGD74m3wS6ZpEPb8MUPrpp3yeo1gbflIe2DYlpAZ6R1DdgyzavVHpink3NngDuICMUZ0Xu1BwwL+JxbjoPwOU3FK5PNXbeKH0ESP5AJglXZmS1p6/EQJ4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB5072.namprd11.prod.outlook.com (2603:10b6:a03:2db::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Thu, 6 Jul
 2023 03:44:19 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::c65d:c846:f197:3ca5]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::c65d:c846:f197:3ca5%4]) with mapi id 15.20.6544.024; Thu, 6 Jul 2023
 03:44:18 +0000
Date: Thu, 6 Jul 2023 03:43:39 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Message-ID: <ZKY4a0N1ocB0geeg@DUT025-TGLU.fm.intel.com>
References: <20230705160602.237213-9-matthew.auld@intel.com>
 <20230705160602.237213-11-matthew.auld@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230705160602.237213-11-matthew.auld@intel.com>
X-ClientProxiedBy: SJ0PR03CA0284.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::19) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB5072:EE_
X-MS-Office365-Filtering-Correlation-Id: 07006f20-41f5-4b98-a5d1-08db7dd346b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: O5gUypFZjCaGs4/9id79bjfWsBMq40cg+Q6CeJLrfS5y+jIie6g9uQn4i55sEAQVSL3RtBYLldEg5yPREkVw/VQShYVMhOUUiDKLXmi5jjS5/rU/y3K8fPZMvNPNEjp2UR/45e6d3wMfVqnHDtMT1GZeZZ6xhBm2WqdvK7zkIjOF8oqD9gJq56yfsm1m331XqJ4mhGlEEsMT89sAz5U4KIYVYbtLtT4OdSeZIDS7cAm17vzK3Gs6poLDoWBByqzqRlRH5YvXONgbN+IT4LsPotBf7fP+NEs04ZxGkT4G3QgSPa730vep0bbXjW3cU2LEQhlAtIUr+ZPG+DGRmc90m9fToYw4kBo9fRhEZn1/b4r+x9hmpfnqf6UHbj8JGzYlem+q7Bwx5AmFtJmg+S7rtsofgNrWuG3hkwg6sQhCg8iKaJusrOkUOuFUMxPyj27Vgj7JQ/bwCS+hBisXicCOhklXmJsFg1Z3pnqL8Sv2JeIleZmmNSRdWsrn2RY5u3TyXh2hGZwdbzSrCo8AkU97/HVxGlakdr8UVqOhCOb50hxUnMmm6bJ4uFeyysCfd8XNpMsJzIpIwoCpdEdjXFeNogcmb+xKIjhHKFJisgSgK49M7rZ5j+KJ98C5kXbPkl+x
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(39860400002)(346002)(396003)(136003)(366004)(451199021)(26005)(41300700001)(6666004)(38100700002)(83380400001)(82960400001)(6486002)(107886003)(186003)(6506007)(6512007)(86362001)(2906002)(478600001)(66556008)(66946007)(66476007)(6636002)(4326008)(8936002)(8676002)(44832011)(6862004)(5660300002)(316002)(309714004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?x/eRscDEp7bGoKb9OyzSoXO9SvnY4R3qxo/jus9cN8QHaCKLikCUu2otGq?=
 =?iso-8859-1?Q?lzo9x4hj4qgNwa30Nuxo6lgUc7kYslxFpC5R0LylWzheEgvwMpuNlb52GN?=
 =?iso-8859-1?Q?s1/W9e/sLEsPcqAxjUkhQTPsNmEu6MJvdGEij53/Dm5KH6iUmPWiR14/u1?=
 =?iso-8859-1?Q?LdzOxQgthXWkXkzAmNNWCWD3qITSo16X64xOXVodFTR5weFB1f7xJyKH1c?=
 =?iso-8859-1?Q?ECTopY5YjZb+2NoNIe4NOBvvEfAV5qz3HSnI4sexL9yoSM+VIfeB0e4adM?=
 =?iso-8859-1?Q?wwhObXqKudrGppaOWcWp1SoLVKWKSqNu656FgoYRmNIYdn3n0PviqtreQh?=
 =?iso-8859-1?Q?8Kqyo1AZoO2/TYPUgdRZBed/ifGb7gl0tcfRufDV+29T5X9TDBhkbie1DJ?=
 =?iso-8859-1?Q?P5ME9cLDskxd/hq3bpqOCt9FvnjtXy3ChL2sHOAzuPj9IbaPMLOkyCbKyt?=
 =?iso-8859-1?Q?jef020u3m4moRytS1BjjNPLaPB8FiPvE9QrJOiE6pJzo18qZLjRIY7kRX4?=
 =?iso-8859-1?Q?JV5c7vS/Qe1AVQSGdLUkqJOQotNz9uMCtCEOCuFTsr9/2RLplrW873i6P1?=
 =?iso-8859-1?Q?U9+bnyhURyY2GFsMDN2vkgLKd5gbe2a9h3PuQ5YAv/nlcLFCPaw006fxpu?=
 =?iso-8859-1?Q?M3w7tSBKGpBD45BuY0Jnx9nRvR+IG1eXtmtTb2W9N1vepq8e3RD+ov0/67?=
 =?iso-8859-1?Q?gddx+Q2UREb8J+C1Lv6Kve8+cYalsfdcg2WZ4ZbHJq60kUO22e57UhQLrZ?=
 =?iso-8859-1?Q?lDeff3uCNGuFHIyI4BgTK86M0R02vxAG9JXrfIzqvUp52a6qQXxd1VGM9G?=
 =?iso-8859-1?Q?hEsA/hXFxQdUXLah3bgUL/fKrHlzkJ9VdrhnYgVnXIXvF1QLrGreqvHU69?=
 =?iso-8859-1?Q?XUBANZI78nCRs+JY3ElNTzyrRNAK9sNBpH0CaqMBWJKlvb42xs+c42nQQ5?=
 =?iso-8859-1?Q?eXdJ8Nl6opI1t8j2ZnMkFBNyuSBX1+mXaO3Ld12MRIFYn2JCNaIiJE7ntG?=
 =?iso-8859-1?Q?EPcDO9hKVRf/kqRXP6p9h6T16/GU9thA6v/7zBIWcRxXHwldNl3zs51nCP?=
 =?iso-8859-1?Q?2kKRWGIqqmv2t3janSK3vjGdrkfH3a8Z7Q7rXZ4Kfu5zvRRxrj8edhehiq?=
 =?iso-8859-1?Q?ofOKtu8oxtNtylDCoo8utsQuPeeey5vMZOImkJH9+T9ttXvdHNEXrLMyXS?=
 =?iso-8859-1?Q?t+Lh7sQ+7ZG4bnAT5mWANaRYoFRFbewN2pqhqbvrSsPx5i08ftTPvt07MU?=
 =?iso-8859-1?Q?HjK3vzQj3cIjHkXs7yJGldzat4yG6HsGcJNSBE1dGIOdXH6me1z6In/f39?=
 =?iso-8859-1?Q?Z+Rp6MSDnH+lXfUnvW+egFCzMqNYKE9rTHFFypoj5BXW+gizMSFtyCJ7ga?=
 =?iso-8859-1?Q?to38NjCNxY+hQJnuEVNrrfKZlVH+VPFtww0ZXSATv8lXT/MIolXgWHb6LU?=
 =?iso-8859-1?Q?qY6JbTQL7HasvMDj8+S8INbF82c3dR398/K3iay8bY1qRlk3vWjHPM4NPX?=
 =?iso-8859-1?Q?kI806frzOBhl40S5iMA4pnS/qYU455AEaHIPKNG7IAsPRnHG7ZES/y1ZiQ?=
 =?iso-8859-1?Q?yMY0W1SBiH5pcK07kuvfK3axa94C9eaTHOlWccusy8x9uMT9qn1H+UKw5D?=
 =?iso-8859-1?Q?kIZMPfuSSBU3grdbhENRrdBHAUo/qud5qLLLtZg+SUhrAOQSZJByLHoQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 07006f20-41f5-4b98-a5d1-08db7dd346b6
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2023 03:44:18.2523 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L6buNMQPLvZEYQeEdfl9TpTaZNizOlfrDUhJTX6H38BlP1aYwuHCv5tw5nJJQqFBd5YT1+tGzgPhkUSty6sWbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5072
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v4 2/7] drm/xe/ct: hold fast_lock when
 reserving space for g2h
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

On Wed, Jul 05, 2023 at 05:06:05PM +0100, Matthew Auld wrote:
> Reserving and checking for space on the g2h side relies on the
> fast_lock, and not the CT lock since we need to release space from the
> fast CT path. Make sure we hold it when checking for space and reserving
> it. The main concern is calling __g2h_release_space() as we are reserving
> something and since the info.space and info.g2h_outstanding operations
> are not atomic we can get some nonsense values back.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Cc: José Roberto de Souza <jose.souza@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_ct.c | 22 +++++++++++++++-------
>  1 file changed, 15 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index b7aecc480098..f8c1a2ca89f7 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -346,7 +346,10 @@ static bool h2g_has_room(struct xe_guc_ct *ct, u32 cmd_len)
>  
>  static bool g2h_has_room(struct xe_guc_ct *ct, u32 g2h_len)
>  {
> -	lockdep_assert_held(&ct->lock);
> +	if (!g2h_len)
> +		return true;
> +
> +	lockdep_assert_held(&ct->fast_lock);
>  
>  	return ct->ctbs.g2h.info.space > g2h_len;
>  }
> @@ -367,15 +370,15 @@ static void h2g_reserve_space(struct xe_guc_ct *ct, u32 cmd_len)
>  	ct->ctbs.h2g.info.space -= cmd_len;
>  }
>  
> -static void g2h_reserve_space(struct xe_guc_ct *ct, u32 g2h_len, u32 num_g2h)
> +static void __g2h_reserve_space(struct xe_guc_ct *ct, u32 g2h_len, u32 num_g2h)
>  {
>  	XE_BUG_ON(g2h_len > ct->ctbs.g2h.info.space);
>  
>  	if (g2h_len) {
> -		spin_lock_irq(&ct->fast_lock);
> +		lockdep_assert_held(&ct->fast_lock);
> +
>  		ct->ctbs.g2h.info.space -= g2h_len;
>  		ct->g2h_outstanding += num_g2h;
> -		spin_unlock_irq(&ct->fast_lock);
>  	}
>  }
>  
> @@ -499,21 +502,26 @@ static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
>  		}
>  	}
>  
> +	if (g2h_len)
> +		spin_lock_irq(&ct->fast_lock);
>  retry:
>  	ret = has_room(ct, len + GUC_CTB_HDR_LEN, g2h_len);
>  	if (unlikely(ret))
> -		goto out;
> +		goto out_unlock;
>  
>  	ret = h2g_write(ct, action, len, g2h_fence ? g2h_fence->seqno : 0,
>  			!!g2h_fence);
>  	if (unlikely(ret)) {
>  		if (ret == -EAGAIN)
>  			goto retry;
> -		goto out;
> +		goto out_unlock;
>  	}
>  
> -	g2h_reserve_space(ct, g2h_len, num_g2h);
> +	__g2h_reserve_space(ct, g2h_len, num_g2h);
>  	xe_guc_notify(ct_to_guc(ct));
> +out_unlock:
> +	if (g2h_len)
> +		spin_unlock_irq(&ct->fast_lock);
>  out:
>  	return ret;
>  }
> -- 
> 2.41.0
> 
