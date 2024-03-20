Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86CD0C54E67
	for <intel-xe@archiver.kernel.org>; Wed, 20 Mar 2024 03:20:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 236A710E658;
	Wed, 20 Mar 2024 03:20:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mdtAt3Bc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6580F10E658
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Mar 2024 03:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710904850; x=1742440850;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=bV0jjXnGY5qItxnSzVZiFYQcR6LpU5eSpfwh50eX49c=;
 b=mdtAt3BcSvDipwVAjajpPlgHoImGh5EALdBpUFLjSU+lY+ifJcc6V7d2
 V0UCmwEOkrBkTlMNWezTkE+1q3qCVDiwplEZBcSuRKV3h06Rm6pcPGS4r
 mVCe9peiRLdXIyEcgOGv0ocGwQXVnjdtowV4Sq/YT+SkVY/Rm65WLx0Qi
 88I/Sf3vewQ0sy89XRUvc0Os2JRsOicmJAC3/b+1mKljSxOppABU/9Qky
 GuXp4BhT6luO1AoGmVAyxgd6lDLtL61yNS0j/AK9R75LNmCw6wZ8P438W
 zLmvC6bdPJKFVeEC2FhgPau1xUz4JfvJbRqN0j39dc+bo18P/+HFPjn+J g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11018"; a="9607867"
X-IronPort-AV: E=Sophos;i="6.07,138,1708416000"; 
   d="scan'208";a="9607867"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2024 20:20:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,138,1708416000"; d="scan'208";a="14096276"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Mar 2024 20:20:45 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 19 Mar 2024 20:20:44 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 19 Mar 2024 20:20:44 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 19 Mar 2024 20:20:44 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 19 Mar 2024 20:20:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ESTMgZxmkFLVOxW547ONqFfFNSY5jNPDdJliiisC9uQUxpz253V2wTkNpGWt21U7uFTnzeD1sQzL5ckjK1P1eLbrIfY3d0RL4AB8hOOImGi8asQbcMpyBxqw/tjSsGB9+qYx93S/VJzJNonrPdm4O+ynPdZVoRfBaFd7+qlUkzmZjbvKB+WlQMdGOIqS9B6aBPMkwbrWHnJkSt8/NgYw675S+HormI9gsPnQGc6ACyDCb0tWo/YS9VmAHSBinhSZweKYBwQadmC9QBwQeKG2gqHa0d4PKAQbIMblHjMVV9E4SvVYW0oriuPMkgVbJdmmkW5MOm+s/7lf20qES9RecA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FBgOpL9Go/ss9vQNodgxB1Ihe3xvG0FFjciP6K6E9eI=;
 b=I1+/AycLKNHPCH/zXW3upUaholSAd+cjgEBbtOV+eQPO+6E3gjVNDNF/a0tvoTCv/13hkgGmSw4kB0Ai1kgXMYi4TTq43m6aObnsdHjX+vuVKefemwz32KHpvfLirMjJql0m2z36fQtOcTBq/n989r9WbnOr2xArINydpYCf6r6ivK/hIjzFovnVs2nhxPI9qH9OQW3EVlNW429dLtJI9P6YTR0FssceOz/ReCjkz4D1HJ8ASugD8LqP1RgvccY32/2pEDrx8b8QOEXyOY0YG3qadNhr7d0p2sL2RAaXDYTtLQyj1d4BWYucie1taHN/hGWsR6D35cEo8P4UfFp88g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SN7PR11MB6775.namprd11.prod.outlook.com (2603:10b6:806:264::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.11; Wed, 20 Mar
 2024 03:20:41 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7409.010; Wed, 20 Mar 2024
 03:20:41 +0000
Date: Tue, 19 Mar 2024 22:20:35 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
CC: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Matthew Brost
 <matthew.brost@intel.com>
Subject: Re: [PATCH v2 2/2] drm/xe: Add a WARN_ON for NULL job in
 xe_sync_entry_signal
Message-ID: <ghya5zsi2nxf4rx3253d3yh7btwybd2k6pdxeps26wnqabyf3d@yrghhvwbu57t>
References: <20240318164342.3094-1-nirmoy.das@intel.com>
 <20240318164342.3094-2-nirmoy.das@intel.com>
 <5f468d07-be94-479d-a0ae-6e8c76486f11@intel.com>
 <3dabee23-9a7a-4f43-be33-d4902a5fc7af@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <3dabee23-9a7a-4f43-be33-d4902a5fc7af@intel.com>
X-ClientProxiedBy: SJ2PR07CA0023.namprd07.prod.outlook.com
 (2603:10b6:a03:505::9) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SN7PR11MB6775:EE_
X-MS-Office365-Filtering-Correlation-Id: d2601b91-0a2b-4715-732e-08dc488cb8f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YETxPk0em0UVzu8B8bw90Qw2hVqlETMoJDXx0uPAq1cID18z9jXhaltpoiT+MKY9uKmWU1Gpvh3dbc6+LvOVYgITrJihfW+VuzWKN7Sa/dmXWyKjGC5QtgUYJxkrNEpeXVNPcLEFyCC6NNZienRKZlFMZ2sYDYY+IQU9ts+1J2eQX/FLkdPRUH26k6d2vDy2wP/eNktoTjExOW/FpTcB3VKxMGDz26oIICbKp63OkrXCsFZTOeFwn/6gkI0i7/aQbu3SBlnuj5WeuwckkENotLhWPN8aSqLjazw8LumF/uOlHj6YzJLwXzGof0yWJKO5dn8tDjrkv4Ml2Vu0RqLW20OYDU5x3v90iaXfdh70hPLSpKC9XzvUsAg/CrprN0PvIsTpD64FTrES2sx+coI655zoWW49tImAVqN9xUvvvytccm6QLQ/gxZNVrdlyM8TPptkCnMz9ByPAf4RvtcUUnDcRF9PJoijvd7tvtHuwrI6zacGLAm1Mw98SLEob3NS4WORCsXqG0BVNoDwGNzHvOGHppzKWPjOmTs12ijZ51SoYzaPUXirjHZHYmoZ/b4gqX77GIU7qSz1XoiuFTnGTz2CZS/8PWu6oOsWNrzkvIRXJhMKzvPJncEhp5YixUzWwOwpPGa54FVoP1877g20mbvS5C2i0gKm7UQWulD2d4As=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iHwHzE8kTC17w6jLI7/2rp1CRhYKmJku/OcciQGuhha22tbKFW7nJU10GaPt?=
 =?us-ascii?Q?py/Un/+RCyHH3GX5TNbohoCQ34mj3QNkrnOnd5zd/mGeEYA5qbAq6VvYYa9+?=
 =?us-ascii?Q?FxQNKnlg9x5JLOflzRm741uM24us2Tmt/BY3JVHFTLMT1w0LPBvwmcAq8mFe?=
 =?us-ascii?Q?SO98yILCc7jgFfxHJ9+a09UDUJJFnuemd7MH0FAnh52QA4Db6HYqC8PqTDlD?=
 =?us-ascii?Q?YsKIoanJHMnztcGH8yBuQPL9YzIfh8EsyXb37bPfCR8ahkjpSvAuoob3v0vS?=
 =?us-ascii?Q?E6DO6XzRfL2f80f0J0UicerunHCnqyp9ezubhE33v6j5lx9i6JI8Nv6xPzaJ?=
 =?us-ascii?Q?MdyIT8PSLq2lhGgUv29uvH7NwcikwYwE4hRrJuF3wXSMFWtQEfMG9z+tDyhF?=
 =?us-ascii?Q?T1MC8YI9V6R7k5knY8wEfXv6NZByuoX4D5QHQVn1e7mI+sYZFZ2JAQE9RGio?=
 =?us-ascii?Q?xD0ucQmePCkA1vO0G2Jaru24IRhXIqOxZBcjgAv0h47psc+QMZc1A+Xjc6Xy?=
 =?us-ascii?Q?CpLTNGlCvhfqqaBmxrk5NSDpeh8BDGcV3wmI09H7Vt5TbJG5Zc377x2mY2wu?=
 =?us-ascii?Q?7X2PvuqHO6UjPM5M4e3vSZAzbJQGpkwQuwOvCohDWYuviJE7MLeskKWncl7t?=
 =?us-ascii?Q?YP1W28uW5Pgz07wWjWw8Ip3+CCNoV2KKZKfs6ZrKlLebuZ9ZoodVR6GH8FVP?=
 =?us-ascii?Q?cejW4vFFw+OpyfFG6VOdXrzQhkbWTBrplj0oihnLEWQ+qwg2Np9gjFlXwYET?=
 =?us-ascii?Q?pdvRmbgc55Bz+ijIBwUujAIhYH99JXj4cslHe4XgbIH1slcSpjoTrvtDwkcT?=
 =?us-ascii?Q?lPtwZfd6bZzHg1LR5GBv9Cfl1fcNFIk52tMBE5+EUBtHdXk+74CiG2hGRQsb?=
 =?us-ascii?Q?9ebhQFGr606NYULhiSzS75M/k9qT465gn13gWGta+8rI2VlRPP6EPUfew3Va?=
 =?us-ascii?Q?FWy6IMe9krEARHiiKc7YQJqJAstqaHUHNnp4UAgIXNoSiaaJYQulisso/8kY?=
 =?us-ascii?Q?oQvfZQzGoytFVq/rw9rwgCZgWJ0HFYMldtBNddaql5GYukKHjV7+Kq/egLAn?=
 =?us-ascii?Q?EpimmFDbRe4asz7hf7SQr31Mx95xvvQmfP5IeLzPiYf1FBYPqiXhbyR0brXG?=
 =?us-ascii?Q?bNC2KC1sdpdB092tUydtWzsXD4gDbj8yQRnrVG7nUdG4xOcjP/5ln3oKSj6d?=
 =?us-ascii?Q?+wXWMzIDPU5bxB9o9/cLGsD6y4JeUN+VudRGLZzRI4pg8Z26vFvtClFlws+d?=
 =?us-ascii?Q?JvqYomUyTL1ijuGjkXGJHx7lpjemVlGIzwBpYkpaX89EYXil1tU8sgX/5q/L?=
 =?us-ascii?Q?kZ6N1fOiWIrD+ysW4Eg3rG9l5nilAOFMUSr7yuQNJXbqQeuyeAdPN9RxOzPt?=
 =?us-ascii?Q?dGeI9l2wDjS/Lid5SczLyv/fSnNxCU8h278cgBwXRYYJKvD40Dwxzj2iEJ/u?=
 =?us-ascii?Q?OVjOmA06Tsk6kcdLE2vh5N3ch1givznzaxalwl2AQtVvMFQKlZVa/gGl0gq/?=
 =?us-ascii?Q?RFKkXMKfZcSH8vabdCOpmQqONvI7PAefFR/DO/JlkKzBSoe2Uihkldy9wL74?=
 =?us-ascii?Q?Tc+t1xL6taRfPaUCrX84azHx1fNF8ceml2SKVAVvOIbNtzI7zgpRuWpT9tnS?=
 =?us-ascii?Q?9g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d2601b91-0a2b-4715-732e-08dc488cb8f3
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2024 03:20:41.7088 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xO3pk+ZfGex4ETs/0XolaFWjhJKE34FIhxsDjNxh/FDnFliM2Xtcla3JiAI3FQ8xIJYBNY3EDwjARGSfeCvHMXKoXIzzTh4bhdUZHqjprLk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6775
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

On Mon, Mar 18, 2024 at 07:41:56PM +0100, Nirmoy Das wrote:
>
>On 3/18/2024 6:41 PM, Michal Wajdeczko wrote:
>>
>>On 18.03.2024 17:43, Nirmoy Das wrote:
>>>Add a warn for NULL job when sync->type is
>>>DRM_XE_SYNC_TYPE_USER_FENCE. This should be a programming
>>>error and should never happen so warn and let the kernel crash
>>>if that ever happens.
>>IMO adding WARN and then let kernel crash is pointless as you will have
>>almost exactly the same report as from NPD
>
>WARN should give us the line number which is not the case for NDP I think.

and a NPD will put the line with the NPD straight in the RIP line. So,
to second what Michal said, what's the point?

it would make sense if you were adding the warning earlier and make the
driver still behave. The place it was added, not so much

Lucas De Marchi

>
>
>Regards,
>
>Nirmoy
>
>>
>>for programming errors we should xe_assert() that will provide necessary
>>hint during code refactor but will be compiled on production builds
>>
>>only if you feel that that job could be still (but unlikely) NULL then
>>you should use drm_WARN/xe_gt_WARN and provide necessary fallback
>>
>>>Cc: Matthew Auld <matthew.auld@intel.com>
>>>Cc: Matthew Brost <matthew.brost@intel.com>
>>>Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>>>---
>>>  drivers/gpu/drm/xe/xe_sync.c | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>>diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
>>>index 02c9577fe418..247505c3478d 100644
>>>--- a/drivers/gpu/drm/xe/xe_sync.c
>>>+++ b/drivers/gpu/drm/xe/xe_sync.c
>>>@@ -255,6 +255,7 @@ void xe_sync_entry_signal(struct xe_sync_entry *sync, struct xe_sched_job *job,
>>>  			dma_fence_put(fence);
>>>  		}
>>>  	} else if (sync->type == DRM_XE_SYNC_TYPE_USER_FENCE) {
>>>+		XE_WARN_ON(!job);
>>>  		job->user_fence.used = true;
>>>  		job->user_fence.addr = sync->addr;
>>>  		job->user_fence.value = sync->timeline_value;
