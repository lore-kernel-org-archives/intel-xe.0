Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C0E1CA1005
	for <intel-xe@archiver.kernel.org>; Fri, 30 Aug 2024 16:01:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3FBB10E788;
	Fri, 30 Aug 2024 16:01:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KNgiH9UB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3109C10E788
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Aug 2024 16:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725033671; x=1756569671;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=WBlXMwzFJnXRLhdTdRTCd0kvFbdtx0xDnNvv1IQtfUM=;
 b=KNgiH9UBmrzgGpi62j4eqSoB1uPU0qGbbXucHz4SiLm6iBOEX7b5asao
 sZq94XOTWiaQHnsGS77Oqpmv1chhhv1ECzaGaUd1g24nIvTqyxRZ36v36
 Xh5Z+mMCo+Wi+Mif4TMRMLEkQV6Kjq5S7miV0ducLem7SCEPUHxPWcBNm
 r8Bssn+wwWSYyW+NdYYg+uLuYz/CmNbSYyYuUd/DumR/q2ps2eeVvVS2a
 HoiEQP7kMiMsYeqlAbdrSKUDd18uiNUVsKIAWKsef1c3lU4dcTezg+0Sc
 F4GVnlCMkJmz2U9nPWfeIs7/aJ7P0CyVpKI2mtrd5Q3UAehq0rV3XeJNm A==;
X-CSE-ConnectionGUID: cd/HI0GWTieovZhRFNOM+Q==
X-CSE-MsgGUID: iOQmSqohT6e3l15RdnLgrA==
X-IronPort-AV: E=McAfee;i="6700,10204,11180"; a="34295531"
X-IronPort-AV: E=Sophos;i="6.10,189,1719903600"; d="scan'208";a="34295531"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2024 09:01:03 -0700
X-CSE-ConnectionGUID: +iIaRkPDQKi6+jVtef8s3A==
X-CSE-MsgGUID: lYmiojbUR7W0Q0eWRY+QAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,189,1719903600"; d="scan'208";a="63990827"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Aug 2024 09:01:03 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 30 Aug 2024 09:01:02 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 30 Aug 2024 09:01:02 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 30 Aug 2024 09:01:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G+clS+O51/qsWRaZtz41FFvl5s/q2H+ZvcZ3MUB+odUuPM9WUfJJBNgHv2oBZK8sK9b44EZrq57VURLGPKhSzDMEgOr3MCzf23Dmmijtco1HfyhNE32pV2sQgUhW+uYm2nYpYoWaoEJPtqLJGkYP9X/d8rxeD/r2vgfQKalIijcXQYe3WrUMzUAIgtiw+yizpnwTSPuKND0/iNl+3wiNFhXxJC15igFsphn3lV/h7uVudPdYa/iDKPwpP67XU8bW9pPHT5cnl+TWK9HJq1nYxKPCl07cQOt5iaasuLTSfevhZXdLWE5rYoRSHoW1ZW7vs9mnWfMcjjunIL1YTT4V8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9v+G9NJfng7Mkvs4v9bNepwFVgUY1h6fESvoru0UH+c=;
 b=tRankGKOl8WopUThi4sJNlOd/x7DfoGdg++rQ74foAO0BDHUWftWCEyCxW70Rgb5G8hy+Qh1w7LMopGvZPSJ3G6JHZTZPRfiKiHZG4C5aky6GmKx2okqB10GiT37VQ3DNUcL7GS7Pp/ZQRsSznXyjDROWg0vYKr2CNDG5kPbwB5mqhNiZ8Zutk0AnSDzg4tWJ4LhsR9G8BX9SBkQfvUxQwXd5dYmXLhHJLpcxKWbwgHbBd6sCIN4xEn6mjhQdFpLd4p9/gkEA+S77if9oIAkopGXfVUN3LdUWhojy/9vbtgDyV+Cnoh8xN+ZqE8Vef6F3SDV8t8jG+1OkOa6dXgzjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CY8PR11MB7313.namprd11.prod.outlook.com (2603:10b6:930:9c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.28; Fri, 30 Aug
 2024 16:00:56 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.7897.027; Fri, 30 Aug 2024
 16:00:55 +0000
Date: Fri, 30 Aug 2024 09:00:52 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIENJLkZVTEw6IGZhaWx1cg==?= =?utf-8?Q?e?= for
 drm/xe/display: Drop unnecessary xe_gt.h includes
Message-ID: <20240830160052.GG5091@mdroper-desk1.amr.corp.intel.com>
References: <20240829230307.886233-2-matthew.d.roper@intel.com>
 <172502974787.854946.3137561798839006443@2413ebb6fbb6>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <172502974787.854946.3137561798839006443@2413ebb6fbb6>
X-ClientProxiedBy: BYAPR07CA0027.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::40) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CY8PR11MB7313:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a0e5788-73f0-4a55-b547-08dcc90cee1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vbrluuNdcGZvNeZ0sYSUm56veTUCTdRCJDn6DiX0Ox4IO/Q2jLQ9M6UmTrEw?=
 =?us-ascii?Q?7tltGHRubofQaXidZCTi/unSCVDAO2d7UQl0kpfGuSdvrkPB8GF+S93JOq82?=
 =?us-ascii?Q?9FL/iKF6hU5pKo8ikUWH2Q2ddtmBuKeiPSsMv5xu9nGmW9ZKr3UFrYG1a4Xe?=
 =?us-ascii?Q?RBJWyruDS/5jXkkbVXQzygsKsz9N3cmnX3q/r7UJey69LcJITOB2dvCrhlUq?=
 =?us-ascii?Q?kX0gIkM6t0nK7ba/QuaO1q5pBv1THretaVeK8A6B4YJ7EmApC4o+FFA5YI/n?=
 =?us-ascii?Q?/TpcTlADhO6WEHMA499n+NTgIqpWAlUjT9O5kBxsq0vfvDqbY3tDfOGNCA6T?=
 =?us-ascii?Q?Gg8XWY2o1nc+5O0e5QBPLYrnSsLX5bxudWG4pMbGgS09EQhXwJ1aT1aLGeqS?=
 =?us-ascii?Q?2tOq7bHz/HGo49l3tRoAIAEUZyCnhRd1J6U0yVlxWTlDWi2lliF2zz+rH1gt?=
 =?us-ascii?Q?BSQpWohH3GP0lljSexOdIhv3R+d/nnWdvJspHbCym0LAG0jMlq7OxZG66UWx?=
 =?us-ascii?Q?1b78kHVjKec9YnE8ahyieXpvJ4wsUqr5YMdSMV9UZIT+mIx7R+lQXEMrqz4S?=
 =?us-ascii?Q?ZZXqYesd6xXQUieP21UjY71dPApqNFyiUNN9FwD9bUVaJUq62EDACEPMUmCb?=
 =?us-ascii?Q?CXQMpVMjKE3+ITZ9e/5V7ph+BgKp2Mw9ismQhdFWfHXl3Lm6hLE9nvm04sVO?=
 =?us-ascii?Q?Kza5CCFBpH4/JEPoa9NJoycsWdYInAy3K2LViJFXRdEW+tKUxqS8wsa8ODgx?=
 =?us-ascii?Q?QYLEwpBu89sbwvRGpnP4hgCNnH0+dtp47afFSMyP4oaaC0QGw3m3sHgLBfF/?=
 =?us-ascii?Q?yvOGWayFtgIDQ9ZUtPjJ1pY0YRFM2CAt+hNk5DMCw08uYHN6jkhQCMafjwV3?=
 =?us-ascii?Q?IB106Pq0qJ0B5ao5oiKOzTpY86Q4MuWWK9zCb+6hVILui0XPj6yHU0sfl4UR?=
 =?us-ascii?Q?m0NAHj/eQ3SfedR9lXc48nQk6eHgtbehfzx+WXRoYoAbWZRhe6yoSGfb+9I/?=
 =?us-ascii?Q?rlNS5LvdMRFevAzTexTK+ht/KGLqx+bQD7m1yh0IMaS14j8twbJ64vYCPWtn?=
 =?us-ascii?Q?dBkdYrrqbCr2Hy9Gf+6zlwhkbTyqllCEDZ9IHSfxaJhkD7Q5CaUNCSAO2YXT?=
 =?us-ascii?Q?4+yiG5+Z9UckyLNicoEM+mIW2ISGpsSztT8pjJBmDG/0NSkVYATDAtwyBF4f?=
 =?us-ascii?Q?K9vW3XA0i9ElVJ2Kq663QT99kDltCJMnlleLxIHO5E5BgAgy2PIyxKGce0r/?=
 =?us-ascii?Q?LV681SY4TTaccW1zf9aaUHKRp/3znSModIMAyTZfpR+JRqDH2SuHJdCJsS03?=
 =?us-ascii?Q?TBI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zEjVfNUMbEzNDloSjW78rNHGzJOgDaQoBfNXUiQv352YacmJ7fXezmpTdLSS?=
 =?us-ascii?Q?+gtQWoKIhQ6YQRZuYyY8ikm7TLzLtpTMyFfwtVJWsPUda9kjmeWrk4k6EKHd?=
 =?us-ascii?Q?IesaYSD1a3hVQvdBprAK3ZPQCIeMTQrgYFVIWhT65YIsAGxPHGhyMgE4CQBp?=
 =?us-ascii?Q?FohYpNcMzccb5CkQhe90PCy+j4t+dpet28vXjoppNLBZLkSsFiM6ycMc2jot?=
 =?us-ascii?Q?0/Na2QYS558JR0Wjfo7g8GT4lBOn4fLOYhwN5PAVKOaB5G845jkUh+5uIW2g?=
 =?us-ascii?Q?F+z+354LXhG/PLTyn7L26GMw60Hi5+Iij6bx7Gcfyi8OXPqEXvW98KCB0SEc?=
 =?us-ascii?Q?Fy1smoE/+eFd8qWH7Xwpw+da5oyJvo0a6RG5V13E+NugQsydTr+0Mj/sgR6i?=
 =?us-ascii?Q?TBJEHfi7SejueHMpCwNV8Jc3guWAD2f1ZiiPYorGJIaK1czJhXipa2h4AJ2Q?=
 =?us-ascii?Q?3rylfZkpH2dIb2wDjwVm+/79lVxLZMB+Ci7tki/uWnIylCqqwJ1bW0W5JFRA?=
 =?us-ascii?Q?q6XMdZrH9eZNYARCSRJ04UIAnIBzM7bPvKFyEJjqdUerWy3q2/Z8i4vS+UHr?=
 =?us-ascii?Q?uNAMwBvZ/wqa09GXXabNbC9nUNu1285kJc+fnJwhQDao5f//PRuQ96HDDkt/?=
 =?us-ascii?Q?LNXdhNEBxDq+hwBc7f6gI5dIJ8alstoxz78iiGcEyRSU2RDEHoRJAJ6UcTgN?=
 =?us-ascii?Q?5WamsoKGaFCPnTed5KgnkmVt5zJlp3lGLNaXZCiaRYpjxvDnzv0cnB1eOUKc?=
 =?us-ascii?Q?FeEGQ+1qNrRaaFZuv4XdUE9gz3SY3nrGubZRIr26q71smnDocEh3f3XkdZWw?=
 =?us-ascii?Q?9lf+Mdke4BK+U3lt9rWH+xaHwXLLLV79IPvZtDOOZzOnsZvcDWBD0zeX+a/f?=
 =?us-ascii?Q?DPIFVqHu0GiffSif9voh4z2aIimg0eA2n7HxZd4AAtK/2Eb5nGbIu4yxbf0Z?=
 =?us-ascii?Q?6RWXNJ0bWDTckHpgULu/jOpjue4Twe37o8uaVB/tnjTy5e6r7mY5CC849jTJ?=
 =?us-ascii?Q?eKpWM6qBEMYIMFsDfYWhDnC84cT1FDsCV+D8V7odhN7oMnB2AUibsl3S8QnK?=
 =?us-ascii?Q?5yiKBgphtJU2Nw5EdHrAakVDm4xMGia4KDibPvqvbWBj2H+cPTF2DZ9PtL3U?=
 =?us-ascii?Q?cHdfXDZ0J5Yv2I5xp3w8Q7Xj5GWYoHIZGnLlQhnjVTan07qDAqcr7PVW1veW?=
 =?us-ascii?Q?hBqumLwR4et08sUKpPdphloaL+QDw/L3wvB5Bl9gxsh9kCwzAae7RWtUDerV?=
 =?us-ascii?Q?6fPH/f473TJCv+8absvQUsDrXbcUnd0zizc57tnb1+VkT6kD7RU8x7CH/bmi?=
 =?us-ascii?Q?GHj5YJz+CoNCry9TJdMq2cupLFuth51oyVn3bwUWV/n8jaRuL/vVIs7Z20Zv?=
 =?us-ascii?Q?vVO7OypfJtwzVuJ+pSUxb/r6xoJvwiLQKvmWzYHo5yvms+C4TPMyk6/MSR/F?=
 =?us-ascii?Q?in9Pun8tDfO7f7zkYVwHPZNyYiyntB9ITIqqBA79070MTY+PURzPRFgdL7p1?=
 =?us-ascii?Q?IMUt2eFbOzBcNQSSZrwDMpKUsXBBqJeWnHwSf2kpTDDYBEFVTkrN+d4+lMEC?=
 =?us-ascii?Q?1BO+DhMFOFbOKPnffwbOwS3rex8kteGrbR1CKgHXs9ujrUtxhbSz/ibi/Cdh?=
 =?us-ascii?Q?XQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a0e5788-73f0-4a55-b547-08dcc90cee1a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2024 16:00:55.2910 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qk4rXiF7EWAiGyfQCtIaEyvJIuorI/krD9bL8cKaCfsySUbuz+/sMCCCi8anxc8r4zfiSp1uY12pN+2Ki5V0DiMElMtWbtKN7SEzwg9/N7o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7313
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

On Fri, Aug 30, 2024 at 02:55:47PM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe/display: Drop unnecessary xe_gt.h includes
> URL   : https://patchwork.freedesktop.org/series/137981/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-1861-ba2da4a21bf2d821ddf79e6d5c9b994202156355_full -> xe-pw-137981v1_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-137981v1_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-137981v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (4 -> 4)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in xe-pw-137981v1_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_plane_scaling@2x-scaler-multi-pipe:
>     - shard-dg2-set2:     [PASS][1] -> [DMESG-WARN][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1861-ba2da4a21bf2d821ddf79e6d5c9b994202156355/shard-dg2-432/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137981v1/shard-dg2-436/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
> 
>   * igt@xe_drm_fdinfo@drm-most-busy-idle-check-all:
>     - shard-adlp:         [PASS][3] -> [FAIL][4]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1861-ba2da4a21bf2d821ddf79e6d5c9b994202156355/shard-adlp-2/igt@xe_drm_fdinfo@drm-most-busy-idle-check-all.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137981v1/shard-adlp-1/igt@xe_drm_fdinfo@drm-most-busy-idle-check-all.html

This patch has no functional change, so these failures are not related.

Applied to drm-xe-next.  Thanks Himal for the review.


Matt

> 
>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ab-dp2-hdmi-a3:
>     - {shard-bmg}:        NOTRUN -> [INCOMPLETE][5]
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137981v1/shard-bmg-8/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ab-dp2-hdmi-a3.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-137981v1_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@core_hotunplug@unplug-rescan:
>     - shard-adlp:         [PASS][6] -> [INCOMPLETE][7] ([Intel XE#1195])
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1861-ba2da4a21bf2d821ddf79e6d5c9b994202156355/shard-adlp-9/igt@core_hotunplug@unplug-rescan.html
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137981v1/shard-adlp-2/igt@core_hotunplug@unplug-rescan.html
> 
>   * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
>     - shard-lnl:          NOTRUN -> [SKIP][8] ([Intel XE#1466])
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137981v1/shard-lnl-5/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear:
>     - shard-lnl:          [PASS][9] -> [FAIL][10] ([Intel XE#911]) +3 other tests fail
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1861-ba2da4a21bf2d821ddf79e6d5c9b994202156355/shard-lnl-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137981v1/shard-lnl-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html
> 
>   * igt@kms_big_fb@4-tiled-64bpp-rotate-180:
>     - shard-lnl:          [PASS][11] -> [FAIL][12] ([Intel XE#1659])
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1861-ba2da4a21bf2d821ddf79e6d5c9b994202156355/shard-lnl-8/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137981v1/shard-lnl-1/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html
> 
>   * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
>     - shard-lnl:          NOTRUN -> [SKIP][13] ([Intel XE#1407])
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137981v1/shard-lnl-5/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html
> 
>   * igt@kms_big_fb@y-tiled-16bpp-rotate-0:
>     - shard-lnl:          NOTRUN -> [SKIP][14] ([Intel XE#1124]) +2 other tests skip
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137981v1/shard-lnl-5/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html
> 
>   * igt@kms_big_joiner@invalid-modeset:
>     - shard-lnl:          NOTRUN -> [SKIP][15] ([Intel XE#346])
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137981v1/shard-lnl-5/igt@kms_big_joiner@invalid-modeset.html
> 
>   * igt@kms_bw@linear-tiling-4-displays-3840x2160p:
>     - shard-lnl:          NOTRUN -> [SKIP][16] ([Intel XE#1512])
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137981v1/shard-lnl-5/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][17] ([Intel XE#1201] / [Intel XE#787]) +8 other tests skip
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137981v1/shard-adlp-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][18] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +5 other tests skip
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137981v1/shard-adlp-2/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:
>     - shard-lnl:          NOTRUN -> [SKIP][19] ([Intel XE#1399]) +3 other tests skip
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137981v1/shard-lnl-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html
> 
>   * igt@kms_chamelium_color@ctm-0-25:
>     - shard-adlp:         NOTRUN -> [SKIP][20] ([Intel XE#1201] / [Intel XE#306])
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137981v1/shard-adlp-2/igt@kms_chamelium_color@ctm-0-25.html
> 
>   * igt@kms_chamelium_color@degamma:
>     - shard-lnl:          NOTRUN -> [SKIP][21] ([Intel XE#306])
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137981v1/shard-lnl-5/igt@kms_chamelium_color@degamma.html
> 
>   * igt@kms_chamelium_frames@hdmi-crc-fast:
>     - shard-lnl:          NOTRUN -> [SKIP][22] ([Intel XE#373])
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137981v1/shard-lnl-5/igt@kms_chamelium_frames@hdmi-crc-fast.html
> 
>   * igt@kms_chamelium_hpd@dp-hpd:
>     - shard-adlp:         NOTRUN -> [SKIP][23] ([Intel XE#1201] / [Intel XE#373])
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137981v1/shard-adlp-2/igt@kms_chamelium_hpd@dp-hpd.html
> 
>   * igt@kms_content_protection@dp-mst-type-1:
>     - shard-lnl:          NOTRUN -> [SKIP][24] ([Intel XE#307])
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137981v1/shard-lnl-5/igt@kms_content_protection@dp-mst-type-1.html
> 
>   * igt@kms_cursor_crc@cursor-random-256x85:
>     - shard-lnl:          NOTRUN -> [SKIP][25] ([Intel XE#1424])
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137981v1/shard-lnl-5/igt@kms_cursor_crc@cursor-random-256x85.html
> 
>   * igt@kms_cursor_crc@cursor-random-512x512:
>     - shard-adlp:         NOTRUN -> [SKIP][26] ([Intel XE#1201] / [Intel XE#308])
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137981v1/shard-adlp-2/igt@kms_cursor_crc@cursor-random-512x512.html
> 
>   * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
>     - shard-dg2-set2:     [PASS][27] -> [INCOMPLETE][28] ([Intel XE#1195]) +2 other tests incomplete
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1861-ba2da4a21bf2d821ddf79e6d5c9b994202156355/shard-dg2-463/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137981v1/shard-dg2-436/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
>     - shard-lnl:          NOTRUN -> [SKIP][29] ([Intel XE#1421])
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137981v1/shard-lnl-5/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling:
>     - shard-adlp:         NOTRUN -> [SKIP][30] ([Intel XE#1201] / [Intel XE#455]) +1 other test skip
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137981v1/shard-adlp-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
>     - shard-lnl:          NOTRUN -> [SKIP][31] ([Intel XE#1401] / [Intel XE#1745])
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137981v1/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling@pipe-a-default-mode:
>     - shard-lnl:          NOTRUN -> [SKIP][32] ([Intel XE#1401])
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137981v1/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling@pipe-a-default-mode.html
> 
>   * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y:
>     - shard-adlp:         [PASS][33] -> [FAIL][34] ([Intel XE#1874]) +1 other test fail
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1861-ba2da4a21bf2d821ddf79e6d5c9b994202156355/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y.html
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137981v1/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-mmap-wc:
>     - shard-lnl:          NOTRUN -> [SKIP][35] ([Intel XE#651]) +3 other tests skip
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137981v1/shard-lnl-5/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-blt:
>     - shard-adlp:         NOTRUN -> [SKIP][36] ([Intel XE#1201] / [Intel XE#656]) +5 other tests skip
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137981v1/shard-adlp-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-render:
>     - shard-adlp:         NOTRUN -> [SKIP][37] ([Intel XE#1201] / [Intel XE#651])
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137981v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
>     - shard-lnl:          NOTRUN -> [SKIP][38] ([Intel XE#656]) +9 other tests skip
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137981v1/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
> 
>   * igt@kms_getfb@getfb2-accept-ccs:
>     - shard-adlp:         NOTRUN -> [SKIP][39] ([Intel XE#1201] / [Intel XE#1339])
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137981v1/shard-adlp-2/igt@kms_getfb@getfb2-accept-ccs.html
> 
>   * igt@kms_hdr@invalid-hdr:
>     - shard-dg2-set2:     [PASS][40] -> [SKIP][41] ([Intel XE#1201] / [Intel XE#455])
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1861-ba2da4a21bf2d821ddf79e6d5c9b994202156355/shard-dg2-463/igt@kms_hdr@invalid-hdr.html
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137981v1/shard-dg2-436/igt@kms_hdr@invalid-hdr.html
> 
>   * igt@kms_invalid_mode@clock-too-high:
>     - shard-lnl:          NOTRUN -> [SKIP][42] ([Intel XE#1450] / [Intel XE#2568] / [Intel XE#599])
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137981v1/shard-lnl-5/igt@kms_invalid_mode@clock-too-high.html
> 
>   * igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1:
>     - shard-lnl:          NOTRUN -> [SKIP][43] ([Intel XE#1450]) +1 other test skip
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137981v1/shard-lnl-5/igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1.html
> 
>   * igt@kms_invalid_mode@clock-too-high@pipe-c-edp-1:
>     - shard-lnl:          NOTRUN -> [SKIP][44] ([Intel XE#1450] / [Intel XE#599])
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137981v1/shard-lnl-5/igt@kms_invalid_mode@clock-too-high@pipe-c-edp-1.html
> 
>   * igt@kms_plane@plane-position-covered:
>     - shard-lnl:          [PASS][45] -> [DMESG-FAIL][46] ([Intel XE#324]) +3 other tests dmesg-fail
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1861-ba2da4a21bf2d821ddf79e6d5c9b994202156355/shard-lnl-6/igt@kms_plane@plane-position-covered.html
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137981v1/shard-lnl-2/igt@kms_plane@plane-position-covered.html
> 
>   * igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3:
>     - shard-lnl:          [PASS][47] -> [DMESG-WARN][48] ([Intel XE#324]) +6 other tests dmesg-warn
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1861-ba2da4a21bf2d821ddf79e6d5c9b994202156355/shard-lnl-6/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137981v1/shard-lnl-4/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-a-edp-1:
>     - shard-lnl:          NOTRUN -> [SKIP][49] ([Intel XE#2318]) +3 other tests skip
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137981v1/shard-lnl-5/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-a-edp-1.html
> 
>   * igt@kms_psr@pr-primary-render:
>     - shard-lnl:          NOTRUN -> [SKIP][50] ([Intel XE#1406])
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137981v1/shard-lnl-5/igt@kms_psr@pr-primary-render.html
> 
>   * igt@kms_psr@psr2-sprite-plane-onoff:
>     - shard-adlp:         NOTRUN -> [SKIP][51] ([Intel XE#1201] / [Intel XE#929])
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137981v1/shard-adlp-2/igt@kms_psr@psr2-sprite-plane-onoff.html
> 
>   * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
>     - shard-adlp:         NOTRUN -> [SKIP][52] ([Intel XE#1127] / [Intel XE#1201])
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137981v1/shard-adlp-2/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
>     - shard-lnl:          NOTRUN -> [SKIP][53] ([Intel XE#1127])
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137981v1/shard-lnl-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
> 
>   * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
>     - shard-adlp:         NOTRUN -> [SKIP][54] ([Intel XE#1201] / [Intel XE#327])
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137981v1/shard-adlp-2/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
> 
>   * igt@kms_setmode@invalid-clone-single-crtc:
>     - shard-lnl:          NOTRUN -> [SKIP][55] ([Intel XE#1435])
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137981v1/shard-lnl-5/igt@kms_setmode@invalid-clone-single-crtc.html
> 
>   * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>     - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#362])
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137981v1/shard-lnl-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> 
>   * igt@xe_copy_basic@mem-set-linear-0x369:
>     - shard-adlp:         NOTRUN -> [SKIP][57] ([Intel XE#1126] / [Intel XE#1201])
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137981v1/shard-adlp-2/igt@xe_copy_basic@mem-set-linear-0x369.html
> 
>   * igt@xe_evict@evict-beng-mixed-many-threads-small:
>     - shard-dg2-set2:     [PASS][58] -> [TIMEOUT][59] ([Intel XE#1473] / [Intel XE#402])
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1861-ba2da4a21bf2d821ddf79e6d5c9b994202156355/shard-dg2-434/igt@xe_evict@evict-beng-mixed-many-threads-small.html
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137981v1/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-small.html
> 
>   * igt@xe_evict@evict-large-cm:
>     - shard-adlp:         NOTRUN -> [SKIP][60] ([Intel XE#1201] / [Intel XE#261])
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137981v1/shard-adlp-2/igt@xe_evict@evict-large-cm.html
> 
>   * igt@xe_evict@evict-mixed-threads-large:
>     - shard-dg2-set2:     [PASS][61] -> [FAIL][62] ([Intel XE#1000])
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1861-ba2da4a21bf2d821ddf79e6d5c9b994202156355/shard-dg2-463/igt@xe_evict@evict-mixed-threads-large.html
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137981v1/shard-dg2-466/igt@xe_evict@evict-mixed-threads-large.html
> 
>   * igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen:
>     - shard-lnl:          NOTRUN -> [SKIP][63] ([Intel XE#688]) +2 other tests skip
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137981v1/shard-lnl-5/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen.html
> 
>   * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:
>     - shard-lnl:          NOTRUN -> [SKIP][64] ([Intel XE#1392]) +1 other test skip
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137981v1/shard-lnl-5/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html
> 
>   * igt@xe_exec_fault_mode@once-bindexecqueue-userptr:
>     - shard-adlp:         NOTRUN -> [SKIP][65] ([Intel XE#1201] / [Intel XE#288]) +2 other tests skip
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137981v1/shard-adlp-2/igt@xe_exec_fault_mode@once-bindexecqueue-userptr.html
> 
>   * igt@xe_pat@pat-index-xelpg:
>     - shard-lnl:          NOTRUN -> [SKIP][66] ([Intel XE#979])
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137981v1/shard-lnl-5/igt@xe_pat@pat-index-xelpg.html
> 
>   * igt@xe_pm@s4-basic-exec:
>     - shard-adlp:         [PASS][67] -> [ABORT][68] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794])
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1861-ba2da4a21bf2d821ddf79e6d5c9b994202156355/shard-adlp-8/igt@xe_pm@s4-basic-exec.html
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137981v1/shard-adlp-9/igt@xe_pm@s4-basic-exec.html
> 
>   * igt@xe_pm@s4-vm-bind-unbind-all:
>     - shard-lnl:          [PASS][69] -> [ABORT][70] ([Intel XE#1794])
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1861-ba2da4a21bf2d821ddf79e6d5c9b994202156355/shard-lnl-6/igt@xe_pm@s4-vm-bind-unbind-all.html
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137981v1/shard-lnl-2/igt@xe_pm@s4-vm-bind-unbind-all.html
> 
>   * igt@xe_pm@vram-d3cold-threshold:
>     - shard-lnl:          NOTRUN -> [SKIP][71] ([Intel XE#579])
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137981v1/shard-lnl-5/igt@xe_pm@vram-d3cold-threshold.html
> 
>   * igt@xe_pm_residency@toggle-gt-c6:
>     - shard-lnl:          NOTRUN -> [FAIL][72] ([Intel XE#958])
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137981v1/shard-lnl-5/igt@xe_pm_residency@toggle-gt-c6.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1:
>     - shard-lnl:          [FAIL][73] ([Intel XE#1426]) -> [PASS][74] +1 other test pass
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1861-ba2da4a21bf2d821ddf79e6d5c9b994202156355/shard-lnl-4/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137981v1/shard-lnl-1/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
>     - shard-lnl:          [FAIL][75] ([Intel XE#1659]) -> [PASS][76] +2 other tests pass
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1861-ba2da4a21bf2d821ddf79e6d5c9b994202156355/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137981v1/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
> 
>   * igt@kms_cursor_legacy@single-bo@pipe-b:
>     - shard-dg2-set2:     [DMESG-WARN][77] ([Intel XE#877]) -> [PASS][78] +1 other test pass
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1861-ba2da4a21bf2d821ddf79e6d5c9b994202156355/shard-dg2-435/igt@kms_cursor_legacy@single-bo@pipe-b.html
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137981v1/shard-dg2-434/igt@kms_cursor_legacy@single-bo@pipe-b.html
> 
>   * igt@kms_flip@flip-vs-suspend:
>     - {shard-bmg}:        [INCOMPLETE][79] ([Intel XE#2597]) -> [PASS][80]
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1861-ba2da4a21bf2d821ddf79e6d5c9b994202156355/shard-bmg-6/igt@kms_flip@flip-vs-suspend.html
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137981v1/shard-bmg-8/igt@kms_flip@flip-vs-suspend.html
> 
>   * igt@kms_flip@flip-vs-suspend@d-hdmi-a3:
>     - {shard-bmg}:        [INCOMPLETE][81] ([Intel XE#2597] / [Intel XE#2635]) -> [PASS][82]
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1861-ba2da4a21bf2d821ddf79e6d5c9b994202156355/shard-bmg-6/igt@kms_flip@flip-vs-suspend@d-hdmi-a3.html
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137981v1/shard-bmg-8/igt@kms_flip@flip-vs-suspend@d-hdmi-a3.html
> 
>   * igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1:
>     - shard-lnl:          [FAIL][83] ([Intel XE#886]) -> [PASS][84] +1 other test pass
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1861-ba2da4a21bf2d821ddf79e6d5c9b994202156355/shard-lnl-3/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1.html
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137981v1/shard-lnl-8/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1.html
> 
>   * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x:
>     - shard-adlp:         [FAIL][85] ([Intel XE#1874]) -> [PASS][86] +2 other tests pass
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1861-ba2da4a21bf2d821ddf79e6d5c9b994202156355/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137981v1/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html
> 
>   * igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-1:
>     - shard-lnl:          [DMESG-WARN][87] ([Intel XE#324]) -> [PASS][88] +2 other tests pass
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1861-ba2da4a21bf2d821ddf79e6d5c9b994202156355/shard-lnl-6/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-1.html
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137981v1/shard-lnl-4/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-1.html
> 
>   * igt@kms_plane@plane-position-hole@pipe-a-plane-4:
>     - shard-lnl:          [DMESG-FAIL][89] ([Intel XE#324]) -> [PASS][90] +1 other test pass
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1861-ba2da4a21bf2d821ddf79e6d5c9b994202156355/shard-lnl-5/igt@kms_plane@plane-position-hole@pipe-a-plane-4.html
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137981v1/shard-lnl-5/igt@kms_plane@plane-position-hole@pipe-a-plane-4.html
> 
>   * igt@kms_rotation_crc@primary-x-tiled-reflect-x-180:
>     - {shard-bmg}:        [DMESG-WARN][91] ([Intel XE#877]) -> [PASS][92] +1 other test pass
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1861-ba2da4a21bf2d821ddf79e6d5c9b994202156355/shard-bmg-5/igt@kms_rotation_crc@primary-x-tiled-reflect-x-180.html
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137981v1/shard-bmg-3/igt@kms_rotation_crc@primary-x-tiled-reflect-x-180.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak:
>     - {shard-bmg}:        [FAIL][93] ([Intel XE#899]) -> [PASS][94] +1 other test pass
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1861-ba2da4a21bf2d821ddf79e6d5c9b994202156355/shard-bmg-6/igt@kms_universal_plane@cursor-fb-leak.html
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137981v1/shard-bmg-8/igt@kms_universal_plane@cursor-fb-leak.html
> 
>   * igt@xe_evict@evict-beng-mixed-threads-large:
>     - shard-dg2-set2:     [FAIL][95] ([Intel XE#1000]) -> [PASS][96]
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1861-ba2da4a21bf2d821ddf79e6d5c9b994202156355/shard-dg2-466/igt@xe_evict@evict-beng-mixed-threads-large.html
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137981v1/shard-dg2-463/igt@xe_evict@evict-beng-mixed-threads-large.html
> 
>   * igt@xe_gt_freq@freq_reset_multiple:
>     - shard-lnl:          [FAIL][97] -> [PASS][98]
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1861-ba2da4a21bf2d821ddf79e6d5c9b994202156355/shard-lnl-4/igt@xe_gt_freq@freq_reset_multiple.html
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137981v1/shard-lnl-1/igt@xe_gt_freq@freq_reset_multiple.html
> 
>   * igt@xe_pm@s2idle-multiple-execs:
>     - {shard-bmg}:        [DMESG-WARN][99] ([Intel XE#1616] / [Intel XE#877]) -> [PASS][100]
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1861-ba2da4a21bf2d821ddf79e6d5c9b994202156355/shard-bmg-2/igt@xe_pm@s2idle-multiple-execs.html
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137981v1/shard-bmg-7/igt@xe_pm@s2idle-multiple-execs.html
> 
>   * igt@xe_pm@s4-exec-after:
>     - shard-adlp:         [ABORT][101] ([Intel XE#1358] / [Intel XE#1607]) -> [PASS][102]
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1861-ba2da4a21bf2d821ddf79e6d5c9b994202156355/shard-adlp-9/igt@xe_pm@s4-exec-after.html
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137981v1/shard-adlp-2/igt@xe_pm@s4-exec-after.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
>     - shard-dg2-set2:     [SKIP][103] ([Intel XE#316]) -> [SKIP][104] ([Intel XE#1201] / [Intel XE#316])
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1861-ba2da4a21bf2d821ddf79e6d5c9b994202156355/shard-dg2-432/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137981v1/shard-dg2-436/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
> 
>   * igt@kms_big_fb@y-tiled-64bpp-rotate-180:
>     - shard-dg2-set2:     [SKIP][105] ([Intel XE#1124]) -> [SKIP][106] ([Intel XE#1124] / [Intel XE#1201]) +1 other test skip
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1861-ba2da4a21bf2d821ddf79e6d5c9b994202156355/shard-dg2-432/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137981v1/shard-dg2-436/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
>     - shard-adlp:         [DMESG-FAIL][107] ([Intel XE#324]) -> [FAIL][108] ([Intel XE#1231])
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1861-ba2da4a21bf2d821ddf79e6d5c9b994202156355/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137981v1/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
>     - shard-adlp:         [FAIL][109] ([Intel XE#1231]) -> [DMESG-FAIL][110] ([Intel XE#324]) +1 other test dmesg-fail
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1861-ba2da4a21bf2d821ddf79e6d5c9b994202156355/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137981v1/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
> 
>   * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
>     - shard-dg2-set2:     [SKIP][111] ([Intel XE#1252]) -> [SKIP][112] ([Intel XE#1201] / [Intel XE#1252])
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1861-ba2da4a21bf2d821ddf79e6d5c9b994202156355/shard-dg2-432/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137981v1/shard-dg2-436/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][113] ([Intel XE#787]) -> [SKIP][114] ([Intel XE#1201] / [Intel XE#787]) +13 other tests skip
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1861-ba2da4a21bf2d821ddf79e6d5c9b994202156355/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6.html
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137981v1/shard-dg2-436/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs:
>     - shard-dg2-set2:     [SKIP][115] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][116] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +3 other tests skip
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1861-ba2da4a21bf2d821ddf79e6d5c9b994202156355/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137981v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html
> 
>   * igt@kms_chamelium_hpd@vga-hpd:
>     - shard-dg2-set2:     [SKIP][117] ([Intel XE#373]) -> [SKIP][118] ([Intel XE#1201] / [Intel XE#373]) +2 other tests skip
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1861-ba2da4a21bf2d821ddf79e6d5c9b994202156355/shard-dg2-432/igt@kms_chamelium_hpd@vga-hpd.html
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137981v1/shard-dg2-436/igt@kms_chamelium_hpd@vga-hpd.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
>     - shard-dg2-set2:     [SKIP][119] ([Intel XE#308]) -> [SKIP][120] ([Intel XE#1201] / [Intel XE#308])
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1861-ba2da4a21bf2d821ddf79e6d5c9b994202156355/shard-dg2-432/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137981v1/shard-dg2-436/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
> 
>   * igt@kms_display_modes@mst-extended-mode-negative:
>     - shard-dg2-set2:     [SKIP][121] ([Intel XE#307]) -> [SKIP][122] ([Intel XE#1201] / [Intel XE#307])
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1861-ba2da4a21bf2d821ddf79e6d5c9b994202156355/shard-dg2-432/igt@kms_display_modes@mst-extended-mode-negative.html
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137981v1/shard-dg2-436/igt@kms_display_modes@mst-extended-mode-negative.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:
>     - shard-dg2-set2:     [SKIP][123] ([Intel XE#455]) -> [SKIP][124] ([Intel XE#1201] / [Intel XE#455]) +1 other test skip
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1861-ba2da4a21bf2d821ddf79e6d5c9b994202156355/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137981v1/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-mmap-wc:
>     - shard-dg2-set2:     [SKIP][125] ([Intel XE#651]) -> [SKIP][126] ([Intel XE#1201] / [Intel XE#651]) +7 other tests skip
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1861-ba2da4a21bf2d821ddf79e6d5c9b994202156355/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-mmap-wc.html
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137981v1/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt:
>     - shard-dg2-set2:     [SKIP][127] ([Intel XE#653]) -> [SKIP][128] ([Intel XE#1201] / [Intel XE#653]) +7 other tests skip
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1861-ba2da4a21bf2d821ddf79e6d5c9b994202156355/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt.html
>    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137981v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt.html
> 
>   * igt@kms_psr@psr2-primary-render:
>     - shard-dg2-set2:     [SKIP][129] ([Intel XE#929]) -> [SKIP][130] ([Intel XE#1201] / [Intel XE#929]) +3 other tests skip
>    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1861-ba2da4a21bf2d821ddf79e6d5c9b994202156355/shard-dg2-432/igt@kms_psr@psr2-primary-render.html
>    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137981v1/shard-dg2-436/igt@kms_psr@psr2-primary-render.html
> 
>   * igt@kms_rotation_crc@sprite-rotation-90:
>     - shard-dg2-set2:     [SKIP][131] ([Intel XE#327]) -> [SKIP][132] ([Intel XE#1201] / [Intel XE#327])
>    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1861-ba2da4a21bf2d821ddf79e6d5c9b994202156355/shard-dg2-432/igt@kms_rotation_crc@sprite-rotation-90.html
>    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137981v1/shard-dg2-436/igt@kms_rotation_crc@sprite-rotation-90.html
> 
>   * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>     - shard-dg2-set2:     [SKIP][133] ([Intel XE#1201] / [Intel XE#362]) -> [SKIP][134] ([Intel XE#1201] / [Intel XE#1500])
>    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1861-ba2da4a21bf2d821ddf79e6d5c9b994202156355/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
>    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137981v1/shard-dg2-436/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> 
>   * igt@xe_exec_fault_mode@once-rebind-imm:
>     - shard-dg2-set2:     [SKIP][135] ([Intel XE#288]) -> [SKIP][136] ([Intel XE#1201] / [Intel XE#288]) +5 other tests skip
>    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1861-ba2da4a21bf2d821ddf79e6d5c9b994202156355/shard-dg2-432/igt@xe_exec_fault_mode@once-rebind-imm.html
>    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137981v1/shard-dg2-436/igt@xe_exec_fault_mode@once-rebind-imm.html
> 
>   * igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
>     - shard-dg2-set2:     [SKIP][137] ([Intel XE#2360]) -> [SKIP][138] ([Intel XE#1201] / [Intel XE#2360])
>    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1861-ba2da4a21bf2d821ddf79e6d5c9b994202156355/shard-dg2-432/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html
>    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137981v1/shard-dg2-436/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html
> 
>   * igt@xe_oa@oa-unit-exclusive-stream-sample-oa:
>     - shard-dg2-set2:     [SKIP][139] ([Intel XE#2541]) -> [SKIP][140] ([Intel XE#1201] / [Intel XE#2541])
>    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1861-ba2da4a21bf2d821ddf79e6d5c9b994202156355/shard-dg2-432/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html
>    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137981v1/shard-dg2-436/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html
> 
>   * igt@xe_pm@d3cold-multiple-execs:
>     - shard-dg2-set2:     [SKIP][141] ([Intel XE#2284] / [Intel XE#366]) -> [SKIP][142] ([Intel XE#1201] / [Intel XE#2284] / [Intel XE#366])
>    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1861-ba2da4a21bf2d821ddf79e6d5c9b994202156355/shard-dg2-432/igt@xe_pm@d3cold-multiple-execs.html
>    [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137981v1/shard-dg2-436/igt@xe_pm@d3cold-multiple-execs.html
> 
>   * igt@xe_query@multigpu-query-invalid-size:
>     - shard-dg2-set2:     [SKIP][143] ([Intel XE#944]) -> [SKIP][144] ([Intel XE#1201] / [Intel XE#944])
>    [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1861-ba2da4a21bf2d821ddf79e6d5c9b994202156355/shard-dg2-432/igt@xe_query@multigpu-query-invalid-size.html
>    [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137981v1/shard-dg2-436/igt@xe_query@multigpu-query-invalid-size.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [Intel XE#1000]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000
>   [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
>   [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
>   [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
>   [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
>   [Intel XE#1252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
>   [Intel XE#1339]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1339
>   [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
>   [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>   [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
>   [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
>   [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
>   [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
>   [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
>   [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
>   [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
>   [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
>   [Intel XE#1450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1450
>   [Intel XE#1466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1466
>   [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
>   [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
>   [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
>   [Intel XE#1616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616
>   [Intel XE#1656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1656
>   [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
>   [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
>   [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
>   [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
>   [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
>   [Intel XE#2236]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236
>   [Intel XE#2251]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2251
>   [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
>   [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
>   [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
>   [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
>   [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
>   [Intel XE#2318]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318
>   [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
>   [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
>   [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
>   [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
>   [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
>   [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
>   [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
>   [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
>   [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
>   [Intel XE#2568]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2568
>   [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
>   [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
>   [Intel XE#2635]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2635
>   [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>   [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>   [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
>   [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
>   [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
>   [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
>   [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
>   [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
>   [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
>   [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
>   [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
>   [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
>   [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
>   [Intel XE#911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/911
>   [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>   [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
>   [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-1861-ba2da4a21bf2d821ddf79e6d5c9b994202156355 -> xe-pw-137981v1
> 
>   IGT_7999: a73311079a5d8ac99eb25336a8369a2c3c6b519b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-1861-ba2da4a21bf2d821ddf79e6d5c9b994202156355: ba2da4a21bf2d821ddf79e6d5c9b994202156355
>   xe-pw-137981v1: 137981v1
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137981v1/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
