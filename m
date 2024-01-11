Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 767D3C47077
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jan 2024 20:03:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EB7410E9F7;
	Thu, 11 Jan 2024 20:03:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4198E10E9F8
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jan 2024 20:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705003428; x=1736539428;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=2lqd+Oug/QN5TTC9VuCH1TzqNcOhKMkg50jv91TT8qY=;
 b=VwZxYs/pVTspCfcMEi6u8VsVOWe3OxZj46HMt1gOK6XS0KqEBY/qHSbq
 4zq2H1E079jHt/8IKOCrlSCwadoSPOUzzfzDrZhNxo4T3OqyZAlOLYJzq
 Rwx07m3MBCGMtuPuTszqZCfi7Qy1LB/Zl38QSRyKOathCdlOUChDjFoew
 +tb2msNGrUCquWSt0i3Ab6B06Uuw/t5B6bOJGBFCyb2Vfj+1dI2i3OGHU
 +jfiNNVrZci8r88Sz+KtfGmWNvwfluTD5hCk3eqv8Tass0WH5XHhAWFWO
 ckDGxtQzEOFIACH8/PfFL1N0wYYTkcdYEffCrGlkG4HYVzCf9zCKluSzW Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="5705104"
X-IronPort-AV: E=Sophos;i="6.04,187,1695711600"; 
   d="scan'208";a="5705104"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2024 12:03:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="758895684"
X-IronPort-AV: E=Sophos;i="6.04,187,1695711600"; d="scan'208";a="758895684"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Jan 2024 12:03:46 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 11 Jan 2024 12:03:46 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 11 Jan 2024 12:03:46 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 11 Jan 2024 12:03:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GNOJd1QQfXjVwNd5Io4lPgj2qP9yrq7MNntF7UBSV4tEvROgPq1By9Noy3Nf5OpeW2QlFldTG1evAuxRtUnE62keKlEwlbjg4Pf4nbDyw5GMyxuYcKw3rimdtHSCy6PYM46PsgseyjS0h+VuNFHs5warmxCqc2T/mxTr6JCnIyI+GhwgTTCzW0rIM98h/L15V0ZM7xUCJxDf7rejqupq96hG9cBjSokgP6gekmDgdm0a4tWgRytsNH2DhVJvnGz+P1RyZEaBjJkRG8CDXuYoLC+pL/2I+lxgF5QZxqyeSk7KMeB886DBrYKYFSacy3O0D5ZXJmsfzlFDb3Ml3yNHQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N0xJ6K0Mrw6eMrvE9rsoYcsJzJsFIFBaTGJoArDILYU=;
 b=KKAfbGJncE2WF3PmG4vUtScGeVIb4k2Q5VozMA3SYEQKL1cy30/2YHi1NiP1byxkXQ8SmPNJYes3cD4i6vqmMOhLCcxXjvekUXufNzrVEVTG5vIeZidSZIEwjieqk02qefbWOnmaxP5D80a7BjblHGK9fImuG4wZ2LVXnw1CfXmW5qoXtu0kjrXBvN+479tVsiOjByZUIGORjtXR4Y8vtToMayxbYFSZttHG8KKG6f988NcYVSJAliQI3zBwRWhIbAXeOJgWcl15US/ZxzK/uOjDlnzL/XHX3dv49wLLJaKPABqQoqde2O5i6muUKoroxfhTxuntXQZ1QFb7cQCIdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB4973.namprd11.prod.outlook.com (2603:10b6:a03:2de::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.18; Thu, 11 Jan
 2024 20:03:37 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda%4]) with mapi id 15.20.7181.019; Thu, 11 Jan 2024
 20:03:37 +0000
Date: Thu, 11 Jan 2024 20:02:20 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH] drm/xe/guc: Return CTB response length
Message-ID: <ZaBJTEP9PTkwNipg@DUT025-TGLU.fm.intel.com>
References: <20240111152724.497-1-michal.wajdeczko@intel.com>
 <ZaAaDeAOPqbS7Tg6@DUT025-TGLU.fm.intel.com>
 <cd126beb-db4e-4995-8518-f04658fd6820@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <cd126beb-db4e-4995-8518-f04658fd6820@intel.com>
X-ClientProxiedBy: SJ0PR03CA0018.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::23) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB4973:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a9a9eb4-60d4-4d86-4c81-08dc12e06602
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ec0QLu6USjnCESxhtBFhvKXREfL/2+hNAa6weMIjjFjDvoktTMrpIuWX/LfkschRVRhVdOC5xseWjzpFFyyeuCKErCDJ3cmZTzjZyznYwn0xuwOa67s3+HFVxP22kAHBBp396B2mb0BxkpjdPVjMS6oHDc6jPZ8gwnUj/gOUrWRnGaHUe89eaeoiFY2hFB4lB8DMLntrzMsEBae1904DZMpzJWP+//100uJUGSYmokmystiXiI/tQ885hUFUNqtSFvsGnwtA+hcZ2OrVVx5CAoAJNGeiaLqOKFgOlWW8XwENVCG2gN8a6R+zd1eT5V7dwFW9lO59oPS/MpF3EtJ6INHekUYG4gImUjCiCYnRhMV2xXrqu4bh+k56y+QRCffMDHP7qk2bB+VnR2PbaZaSQPGyKBgYBxrjAwgQGOpEj2x6lL6YPA0VrszFRCKxBmv12NZPPj8+5UMmO83Fn2IjEJqf3yjIsJN6IEuCzQ/z1O2lQtYEcdGWtBVYrwvojKv8sOfeSLtZN/5yIMEMhm9+0/GZ+fvuAJv1MDwhw8p7ddY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(39860400002)(366004)(376002)(346002)(396003)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(83380400001)(82960400001)(38100700002)(478600001)(6486002)(66946007)(6636002)(66556008)(8936002)(66476007)(44832011)(4326008)(6862004)(53546011)(8676002)(6512007)(6506007)(316002)(6666004)(966005)(5660300002)(26005)(2906002)(41300700001)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?j0sALWl4oaeensydrEkMYJioza9gCAkPPgYz9q6AN9Nq6FdZIbuHZqeVbO7I?=
 =?us-ascii?Q?e257aeH+PkH/kq+dklLvXXlRPhsYVxITGMGKOb6dNZvbqWnQE9zCIdrVwB+7?=
 =?us-ascii?Q?RlKtWww98hlmGB4vsMThtriEGL3gy1HiMK8+gnizLmRlpkJOnn3xN0s82G81?=
 =?us-ascii?Q?JRTkzxby4Iky8rua003wlBDPk021O6jJ2+d5iGtMqQF0965qKcADpjYIIr/y?=
 =?us-ascii?Q?c1hc7pCzz0F9e1E8z+mP0/mrIBpnFqKsgujVUBZ903IP2MDBA1sRH4H3mEIS?=
 =?us-ascii?Q?GVw9Kjc6Jotw/RljqlxBey22Rd5otZqxsZ38jkjeYgJrW8JL349G9C+GeWkR?=
 =?us-ascii?Q?dipx+IYtX/oW2sG/xJpmUA5ozFCMpJJe4iChkK+RgxH6eabWUtdSFkZAhxJB?=
 =?us-ascii?Q?JP6nv5Q1SAW8CGpAF5DAuFaMFzEgZBEoiXVgncFarS1PSMrxuMfYOrdX8I+L?=
 =?us-ascii?Q?kzscLss2tgoy1Tk4MwpP/RtLlkdUk4Bk7nrkEW59h1w2LDEs7bEyZyVXt9Ik?=
 =?us-ascii?Q?oNlpZn8sXMJsBIdzIK4HgQPAIL3SiZy2hcA59gfc5dRXTsx/QK1JDsOWUUqu?=
 =?us-ascii?Q?o6h+wRQlHykA9m2kvqhgVZc8uG6gHKWc1C/kJi4iMytWdXzKfu4sP9olv0M+?=
 =?us-ascii?Q?A+hPRaHoO2CblxC2LHwsLQaySqkxybswRkQNxJEGlVqpFT7y7y5PYv2eVGaM?=
 =?us-ascii?Q?+T8LM3WydYTJXOUR6Pxe0muiY4hlPokVaneGfMSxNkQFXLTmGV8QtJSnCwie?=
 =?us-ascii?Q?jkpJp3N0Qetk7nNEplu1Zynj8ImkfAFsKX/9/8ygJTdILRb4+CHDkG8y4/ab?=
 =?us-ascii?Q?1dOdvSVb+Bvo1gAy3f8D1AEKZaM5tAJwvMWvhkHzZpsVPHQsObngNJJ5UrqY?=
 =?us-ascii?Q?Ku6/zOYIwVm7vSprfpDywL01MOLdIygbx2qCHEpLc+tzy2kDipNqVywQUGuA?=
 =?us-ascii?Q?yD2gdpy2KS/qo2hOIApdoVvdteKTFQ7jRsjWJUsQEJ0O49+XpN5J1579yL01?=
 =?us-ascii?Q?FIvRfcZOdByY7iB53WSP83u8OLfQ7iOCyRUbdVIkq4aiPhqz+0bMHnfw8LW5?=
 =?us-ascii?Q?G9VDXycec+kBVh+eYjEf172l+t0R/BeePNQhHfUSpntlpMS1cS+qPKWWmyjF?=
 =?us-ascii?Q?Tds0o8e0BqF6kp6mWHIygl6pa95Qtl0P+qbZUBYLHN1qa3Gwe0kaz1B/xBE3?=
 =?us-ascii?Q?PyYcTynxLpfWCyRRCZs7gULAsY9PfLsSd3m+kJbsIS/QSM0dB4EEYKmDQWZF?=
 =?us-ascii?Q?YqXN8/t+HGEznLFm5FRGVp9ObBT4vbzMG+vncyDCQtH1rcWDxNPmZlN3rwGE?=
 =?us-ascii?Q?+NEdsllPhaP1u/uWblA/ks6+SFJ5t2O1LpbqyA5lAU9/X+8RZBojdXpxmnYb?=
 =?us-ascii?Q?LowxqC2Q9lmyI26YIG8BrFOTAOq2lNMSnYlq7BaLVzR36C4j4cO6guWMGhLE?=
 =?us-ascii?Q?qiOCM616DO34flRtuexAztOiMngW0DbBObrVnxI8sWLL02B4dyUOawHAgFBq?=
 =?us-ascii?Q?Lc0dA+5nO5IZwIyEYNNOYIOChDfBpnvlpSg6qXKXoFGyKJExTC1m80/Eeztk?=
 =?us-ascii?Q?QBnmuiESV72cUtlGjOcUT1w6BXIRqeEnvgKwb1YLa331q4YguqFFth37olZz?=
 =?us-ascii?Q?eQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a9a9eb4-60d4-4d86-4c81-08dc12e06602
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2024 20:03:37.5237 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yUPxEBt//ToIJu+2XMXcBVepXyb9n7suAvvM3H9T5C82FjdInIJRUNpiG37LxEGcNl6/2KZKMkQBpj/oO9vsFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4973
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

On Thu, Jan 11, 2024 at 06:07:12PM +0100, Michal Wajdeczko wrote:
> 
> 
> On 11.01.2024 17:40, Matthew Brost wrote:
> > On Thu, Jan 11, 2024 at 04:27:24PM +0100, Michal Wajdeczko wrote:
> >> Not all CTB responses from the GuC are fixed size and we need to
> >> pass response length to the caller, if there was a response_buffer.
> >> Easiest solution is to return it as positive value from all
> >> xe_guc_ct_send_recv() functions.  The CTB response length is always
> >> between 1 and 254 (ie. GUC_HXG_MSG_MIN_LEN and GUC_CTB_MAX_DWORDS
> >> - GUC_HXG_MSG_MIN_LEN).
> >>
> >> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> >> Cc: Matthew Brost <matthew.brost@intel.com>
> > 
> > I has purposed a different usage of the return value [1].
> > 
> > Perhaps we just have response len as a pass by ref argument?
> 
> no need for additional argument, we can still return data0 if there was
> no response_buffer provided, and I also have patch for this, but didn't
> send right now as it conflicts with our already in-flight HXG changes.
> 
> Michal
> 

Ok this LGTM. We will need some kernel doc for GuC CT soon. Let me open
a Jira for that so we don't lose track of this.

With that:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> > 
> > Matt
> > 
> > [1] https://patchwork.freedesktop.org/patch/541762/?series=119096&rev=1
> > 
> >> ---
> >>  drivers/gpu/drm/xe/xe_guc_ct.c | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> >> index c29f095aa1b9..d490a4d42c01 100644
> >> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> >> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> >> @@ -780,7 +780,7 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
> >>  		ret = -EIO;
> >>  	}
> >>  
> >> -	return ret > 0 ? 0 : ret;
> >> +	return ret > 0 ? response_buffer ? g2h_fence.response_len : 0 : ret;
> >>  }
> >>  
> >>  int xe_guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
> >>
> >> base-commit: 79184e72263e91528195db01783148435c7e4fad
> >> -- 
> >> 2.25.1
> >>
