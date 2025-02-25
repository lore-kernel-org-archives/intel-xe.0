Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48250C021B6
	for <intel-xe@archiver.kernel.org>; Tue, 25 Feb 2025 03:04:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E929510E107;
	Tue, 25 Feb 2025 03:04:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Tw9LrqCy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E56810E107
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Feb 2025 03:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740452691; x=1771988691;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=FtpJgJ+KH/pQ5Ql5SCHD4UNFhsWzjxxmf725CP7ajac=;
 b=Tw9LrqCy0GLxKzFWXnv7lKrnkGfmslYfmLOmZEUN57nZs3JjR9fw2AGK
 l5ygocBI5RLfwGClcfvgyNvNOzrva/gzjtxb8NrsRF33jQ/kuej7krhcy
 1KNJt6OvSPyQZe6lfIu1soWTc2r6dZqg8zSdUa62U2rXEWg/IM0ELM7rc
 DJjsWstQgja1ZNEqQ7pieg3o8NlKttY0zAFF7xpLOWuE+ROVyfQGEe/vH
 Vb8eeJf2WjcBOemoNo1lVO17tZVEiy/v5LONbv4AuMrrrMCG0jFnGFvE5
 wIguKLi8L1S6W/oWMbi6D5SVMUrZFxmblgoQdk3g1U0ulGpxsu2Epar8T Q==;
X-CSE-ConnectionGUID: Lz4cVnDXRJ2HYUgC1+kpWQ==
X-CSE-MsgGUID: q8HY2VrRT3Glbesl6cmg6w==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="41261526"
X-IronPort-AV: E=Sophos;i="6.13,313,1732608000"; d="scan'208";a="41261526"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 19:04:35 -0800
X-CSE-ConnectionGUID: EaNgdimuRLql6q1Qaa93Sg==
X-CSE-MsgGUID: NOs7XNrsT16mm9QhfFdwgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="121500668"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Feb 2025 19:04:34 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 24 Feb 2025 19:04:33 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 24 Feb 2025 19:04:33 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 24 Feb 2025 19:04:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e2jmo65lCr1V3J0QurzezPJ39uCRbG3ANzRP9satH2yib4/Urj8ZahUwk2XoKi8OxbHWvRMhlMiz6WUlB5/nXGuDiVolMicIaDDuMmosXj/MU7dryWKcBAUTaZArO8A2Me5Q8Zj7kyjRzOzX0ZAZsf5H2EOSJ4janAW348IO/X6m/YIqJe7mxR1ez0LE6J9bGZyT2dcXUruWlddUwIq79AF5OcwlN9RXcRLOSr3euMP/dQQECNzajEz9V0AsczYVHlBiVEekWP+US9FH4Zy8SaFJi9NvMR8gbQ22FU+HyKr2oUKcy6fc9aQXzyN0DQwf5tet8VeUd27ZBlxYMZslCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PQPcK4HYgrKZg9DI0bHOnNTEu++PcuHz6Rem7ZG3I/w=;
 b=ePioG9ng8Abk1LbPl7utxjif50JKovkhrd2SSyOw7FhBE9p6yJLk2fl8oZRz+0BzaXBTaWIesOsr1aBI4l+6j/loSpkJaM5/JRR71+M6WGr/+cXFQ+BryPu2/mKObAHW/pWTcR30irTFPjVVvEvDAI9XR9I49cbGdVD20yaFSZyZLOa9nVzCu6zDJ/5z1u0cK5O9A3npa6uh8E2SGHwN1HU/WHnxNPm4b+/kWpAGhVESLyws021sN1fc4WPtH2g/aZq+f6W8SPRHE0QgBN9JyWUv2WnmiIzPjWsZgGvyYRCKbNb6s4Oh4o5o13kwBfkRiZqAKBjeVgIMUpgpiiN4Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by LV8PR11MB8488.namprd11.prod.outlook.com (2603:10b6:408:1e7::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Tue, 25 Feb
 2025 03:04:11 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.8466.016; Tue, 25 Feb 2025
 03:04:11 +0000
Date: Mon, 24 Feb 2025 19:04:09 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH v2 1/5] drm/xe/rtp: Prepare RTP to define SR-IOV specific
 rules
Message-ID: <20250225030409.GG4460@mdroper-desk1.amr.corp.intel.com>
References: <20250224150700.1778-1-michal.wajdeczko@intel.com>
 <20250224150700.1778-2-michal.wajdeczko@intel.com>
 <20250224194113.GC5109@mdroper-desk1.amr.corp.intel.com>
 <954fb6cf-0298-4dd5-ba55-6c340c2f1fdc@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <954fb6cf-0298-4dd5-ba55-6c340c2f1fdc@intel.com>
X-ClientProxiedBy: SJ0PR05CA0200.namprd05.prod.outlook.com
 (2603:10b6:a03:330::25) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|LV8PR11MB8488:EE_
X-MS-Office365-Filtering-Correlation-Id: 6940c51d-eab1-4075-3450-08dd5549140b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?SXx9jJrsdrmr9zHsevj5bmCawU5d6mn6sx2q/BIW1NQoL0pxS9wlak28ASse?=
 =?us-ascii?Q?RStdSgBUQCRTWn4HrfdUYdG0TS4QfyM8WUKFx6iSjQncT6cXPfDQcVaokxUr?=
 =?us-ascii?Q?Hs0UX2yB1rS04llqOObo7xbQ8kpsyBLlSDXJuEDhXud30MlD/9sp9IIdQix5?=
 =?us-ascii?Q?oP4JJaYCp0F0v4A5r3iPjbD0lgjGlXun4vBBPgcXGAv6LVzJ8EyLa+DL6TLU?=
 =?us-ascii?Q?2Sq1YRnb2i79gImaucp275gVNcNRUgcDExMAwFMKZF1t6zE1CGA1dGqnPgtI?=
 =?us-ascii?Q?ULAda0NY3XfkrMnnAvccnLRTDs7XbsqjBMpwxQqOKuRIH7mubYZnHzVjE3yJ?=
 =?us-ascii?Q?SXIIqQQWDQxIHVehJJHU8gq/hcfWQUfvjGQI4PyVXNPflPkRdK8KJxpJlV1q?=
 =?us-ascii?Q?RXrxrUS2XyAI4s/PxjYpY07y/vQ4rGVoeG3U4IhpqTY9fm6r1FFvLZPPvorl?=
 =?us-ascii?Q?aAEzxtKz7ZH76k3VC/Wuz72Bo0TBhHticQWcsrqI2Zbkddu+C7IsGXOuk3MV?=
 =?us-ascii?Q?fMNHHl6OxDN+mCmqM1GKPfbxkFTWhVv95Ihf6sTzfAa46B7S0YQiCxrbvYOb?=
 =?us-ascii?Q?5C706sV/vBlfLV/XuUa1T2aD6BJugpmww9C4SU2pkDWxYn+/dvR3xh1IMdFB?=
 =?us-ascii?Q?oXyPyJfcRBeXFdnd7MRcU6abQ275LEkG6oe+ykGPd3uWVHC6rAMJrjhjwyRt?=
 =?us-ascii?Q?8jnBNpSlICMtI4pYgXBuO4TgFONVbZPSc0TKnnjz0G2/mWpCY6YdOLerp9PF?=
 =?us-ascii?Q?0RaDx71QqF8nB2SeZJZFPjih2Lp1+gvlNK+cyhc/MUq2lenJALWmfEuTpWs8?=
 =?us-ascii?Q?QvLtbIXp64Kv9aCIVjVo51rCxf1lJ1SBk7tcjAwlLe9xQp0/zRm+Ywn1yWvP?=
 =?us-ascii?Q?QRauUvfCuUUtQ3z7VyELI+x0qIZDK0bhi/vzF3+jGL70wcfT2tZtQOQCjO4z?=
 =?us-ascii?Q?4QHUbfuq84EjNquKKVweJd1ZG26eiIGAZK4XKZbf4Wm3AT2aX1NhiN6DD19Q?=
 =?us-ascii?Q?KsEjKFpSCLnmf33QwlI+JP5Njs2afK3/CaXgoF4oaMoFjsfDvHihRTNE0qVv?=
 =?us-ascii?Q?DgvrzrFuOHrsZcnE+itQq9uzib+p2GeMF49BoPhkaNRaoeWUMYCRn8WjhzeS?=
 =?us-ascii?Q?NubuzhgtXq4WHlZuGa+mlzaz/cvP7wejwfRnCD2tql8kAl1kSj+xxbMdNpIl?=
 =?us-ascii?Q?5cVygtv6pw28SLMdDm44EkzHzIYsFnJtjBmQ1TWGhPeQrbYvOdSPU+YiyGvF?=
 =?us-ascii?Q?Mgob88GjVfPlR9aP3ksIoyuAhq1TirtHXYeOqerqJuqwD+IJyCGH1+Dw5+gt?=
 =?us-ascii?Q?4WxcXtB4NScRKr35T7UeNJDrGuCiiCCkgJslO3GhyWpDLeQqiWTXqD7SPoHq?=
 =?us-ascii?Q?0j/iFXvgDuOj6h4CG99ZNVqp3gwR?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?igXbM1mFv7Tw7yZIJYiet7MvJiuaBzejWUjgjZj/PAjRtS9gsoqKRcd4DA9N?=
 =?us-ascii?Q?uUX49rGs79BksURNF1Az0xzd3Pnaf65ctHm4cY+3mtC9FGg6CPYK8R/Gor2Q?=
 =?us-ascii?Q?aZdqqSeiWkqUMs629KH8gAOeG27TIOAABhnqKheyNp422hwpHn6s8r5gu2X3?=
 =?us-ascii?Q?WAXpfJoPCq+MoDvmZDk5eMyR+pmolzl33/rGIwDu2zueormJL85CncLxWDhW?=
 =?us-ascii?Q?Tm/FfWoJcptozFq9PYu8/t++BX4ku422hrbUEafLXRvmE9jy+3KldDlVuP/u?=
 =?us-ascii?Q?7AF1pMHN8mON+SvWPHqlA2lipzaUzR9epIwBkPYRBjqaqdAG5WwtAXUeTuKk?=
 =?us-ascii?Q?oOeEAO8J8UhEqfeujyajMLumbLlkvv/lF088i5rdqhnegbKXb6y6SjlTYylq?=
 =?us-ascii?Q?0DMkdCSit3pt6DT0KOWIf2qlid3oIryVhaPokntGd8svrmHWnpjbLpGO82Ki?=
 =?us-ascii?Q?QNJ+Yn0WQ8mQuT51DBSERRu5WUp6Ux807t0OcjMV9dApZv1wYYTxl46HsKiC?=
 =?us-ascii?Q?vWhYOUvkQnKpkZDkrvg2WSCPZ9a67kmY6Nk7zIXFHtAmIqWbNozs4NLwemV9?=
 =?us-ascii?Q?JBAwKEqOJqCUZTFJ6MSgQ+TLZp4nWQNI1Xrr7F4IUgYi9rv5OWC91eYqI2HO?=
 =?us-ascii?Q?JVJPGnIMxe88QRgVjKzBg4+s5TAQuueDsQb/MliZYZuNT/YY9AeXtHfn1VCY?=
 =?us-ascii?Q?OqGh4K/On6HC5htSL0NULQK2SXQsf7Z4VgCUB/hcuSxzeOEM31WWd/vH6B3Q?=
 =?us-ascii?Q?SYYt+ySquTM2ngFjBfEKEGKB0G1BuVC86dIKcvf/ha9+FgQQFEoScxMf2kfK?=
 =?us-ascii?Q?pzxqqkdMZBZ+ZaL7YzLvuiJKQTEv6XMT+ZJmkl3a7tJ8gadvrwM/p/JlRI4a?=
 =?us-ascii?Q?VSd0BCS1QB0g73kR7RT1Avxh7yfE/D+ihu1NGxEah/1cAl2bxbeEqco6D5+c?=
 =?us-ascii?Q?7s2RWWmUjNIV6iKwdT/oIaguwy+tOBBNt/tnocpBZCzsecf0ot8dSYwliGni?=
 =?us-ascii?Q?jQf8jgVNm7yfZR+swjV9ps0fdPTnSlKVLKtMkPzTWCUQa2f9I51NlfrTzBEO?=
 =?us-ascii?Q?70GPimlnCkyIj0YYWbFYQC2+ggbzLNo4rUWl6DtwD4cdX4t9cxJEJZR0f8+V?=
 =?us-ascii?Q?wrY8prBPYg75XxJOeh0Hgxo335wOD1yVlhkjd916HkWAfhJNrXdc4o/02l/P?=
 =?us-ascii?Q?NpzBEoAq2Cz4LeozPkkQG90hnwLDMs/WIUscphQWf9P5+hXCqeZaNzg6+B//?=
 =?us-ascii?Q?TWFs8ERGYIITSNJWkeJbH4Go0Kg+ClNvP1jUQWcFL7YnJjpBNNqEI+lBMyTj?=
 =?us-ascii?Q?IFRHWv6TICHsCyLm+Q2Sy5zseXpZy1e/KlqzNEIDogOyGPeqa0QcU+p9w6AT?=
 =?us-ascii?Q?RP9vXNEdCJAnhVg7h+diA6yIbA142hzCGjGvO95vJv564tOEvfFl43siN3gb?=
 =?us-ascii?Q?iJ0U9THV111osRscqTVWrdrKhet43UTqczJHvjmPMW+UQoX4/1F6eZuonJyN?=
 =?us-ascii?Q?fta7EPg7mxKqFrUH01zcOAeEY5jJKZrI8+Ct/B83jKqnAB0OAtUy6PD7EWOF?=
 =?us-ascii?Q?rWt1d+3nuye3046vEDgfPhW9/KzZqO/nCxG/JFgQNX+/+3M74wKeSEtGb3cM?=
 =?us-ascii?Q?0g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6940c51d-eab1-4075-3450-08dd5549140b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2025 03:04:11.5450 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z65ftXfgJgB4vsgKFVYQqa8IbD3zBGds9f8sAgMC9p8WPwzPac203ZVm7zxDfxy2/eMrxjE0A0gpHB2RSTkr7PCfooE7mibWIzqmaIjMMX4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8488
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

On Tue, Feb 25, 2025 at 12:36:25AM +0100, Michal Wajdeczko wrote:
> 
> 
> On 24.02.2025 20:41, Matt Roper wrote:
> > On Mon, Feb 24, 2025 at 04:06:56PM +0100, Michal Wajdeczko wrote:
> >> Almost all currently defined workaround actions are dedicated
> >> for the driver running in a privileged mode (native or SR-IOV PF)
> >> and those actions should not be used when running in the VF mode.
> >>
> >> While we can easily skip any attempt to apply tile, engine or
> >> LRC workarounds by doing early exit, it's not so easy with OOB
> >> workarounds, as on exception basis, there could be some actions
> >> expected to be done also by the VF driver.
> > 
> > A bit orthogonal to the specific patch you're adding here, but stepping
> > back and thinking about this for a moment...does it actually make sense
> > for LRC workarounds to not apply to VF?  I can understand the tile, gt,
> > and engine workarounds not applying since presumably there's only one
> > setting at the hardware level and the VFs would use the setting the PF
> > had programmed into the hardware.  But LRC workarounds seem different
> > because the hardware value is expected to update with each context
> > switch to whatever is in the incoming context's LRC.  If we don't apply
> > LRC workarounds in a VF, then the actual LRC getting switched in won't
> > be inheriting anything from the VF, but rather using whatever unmodified
> > value is present in the VF's default LRC.
> > 
> > Am I overlooking somoething here or should we actually be handling LRC
> > workarounds in a different manner?
> > 
> 
> from commit 9632dfb0def4 ("drm/xe/vf: Don't run any save-restore RTP
> actions if VF") we are doing early exit from xe_rtp_process_to_sr() that
> is also used for LRC WAs
> 
> and IIUC the Bspec:52398 says that VFs can write only to allowed
> registers within the engines, which our chicken WA regs are not, so all
> LRI will be NOP'ed anyway

Yeah, I don't think LRI's and such executed from batchbuffers work
(i.e., the way we apply LRC workarounds today), but the statement in
that table about allowing accesses to enable context save/restore makes
it sound like the contents of the LRC in memory do still get loaded into
the hardware (i.e., LRI's done as part of context switch take effect,
even if LRI's done as part of batch/ring execution don't).

So that makes me wonder if we actually need to rethink how we do LRC
workarounds, at least for VF's.  Today we do:

 1. Hardware comes out of reset with default register/state values
 2. Context switch to context (A) with "restore inhibit" to make a
    context active on the engine without actually doing a "context
    restore" or changing any register values.
 3. Submit a batchbuffer containing all the register + state adjustments
    we want to make for the purposes of workarounds, tuning, etc.
 4. Context switch to context (B) to force the current register/state
    values to be written out to the LRC in memory of context (A).  We
    grab a copy of this LRC to use as the "default LRC" that acts as the
    starting point for all subsequent contexts created.

It sounds like in a VF, step 3 here is ineffective, at least for
registers.  However in theory it should still be possible to apply the
workarounds by skipping step 3, and instead manually poking the updated
values into the proper place in the LRC in memory as a new step 5.  That
would probably be a lot more fragile (i.e., we have to be careful that
we're finding the correct offset in the LRC for the register or state
instruction, and make sure that we don't accidentally clobber any
non-workaround values that the default context is trying to set).  But
in theory I think it should still be possible (and probably what we
should be doing if we want the effect of the workarounds)?

> 
> >>
> >> Since we process OOB rules also in the SR-IOV VF mode, we had to
> >> explicitly decline the ones that were not applicable for VF, by
> >> using FUNC(xe_rtp_match_not_sriov_vf). However that may not
> >> scale well, since most future workarounds will likely not be
> >> needed in VF mode.
> >>
> >> Instead of forcing us to append more and more FUNC(not_sriov_vf)
> >> to potentially every new OOB workaround, change the RTP logic
> >> and assume that RTP rules are not applicable to VFs by default,
> >> unless there will be added a special SRIOV(VF_READY) rule.
> >>
> >> As of today only no_media_l3 OOB workaround seems to be applicable
> >> also for the VF mode, since the value of MIRROR_FUSE3(0x9118) from
> >> the PF is likely unreliable, so mark that WA as VF_READY right away.
> >>
> >> For completeness define also SRIOV(ONLY) to require PF or VF mode,
> >> SRIOV(PF_ONLY) to require PF mode and SRIOV(VF_ONLY) for VF mode.
> > 
> > For the purposes of a workaround, what would be the difference between
> > PF mode and native?  
> 
> in PF mode (controlled by xe.max_vfs param) we must retain possibility
> to enable VFs, so we might need to make different steps
> 
> > I.e., what kind of language in a workaround
> > description would signal to us that we need PF_ONLY (or SRIOV(ONLY))?
> 
> what about "in PF mode we shouldn't modify XXX or enable YYY, or we must
> use different setup for ZZZ, where XXX/YYY/ZZZ are native features, as
> otherwise we would completely block VFs enabling"
> 
> > Do we have any historic examples of these?
> 
> not yet, but in rev1 I was also assuming that VF_READY is just a ready
> to use solution for some future undefined yet exception case, but was
> shortly pointed by the CI that there is one already (no_media_l3)

Okay, sounds good.  I just want to make sure we'll be able to recognize
such workaround if/when they show up in the workaround database.


Matt

> 
> > 
> > 
> > Matt
> > 
> >>
> >> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> >> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> >> Cc: Matt Roper <matthew.d.roper@intel.com>
> >> ---
> >> v2: tag no_media_l3 workaround as VF_READY
> >> ---
> >>  drivers/gpu/drm/xe/xe_rtp.c        | 20 +++++++++++++++++++-
> >>  drivers/gpu/drm/xe/xe_rtp.h        |  8 ++++++++
> >>  drivers/gpu/drm/xe/xe_rtp_types.h  |  4 ++++
> >>  drivers/gpu/drm/xe/xe_wa_oob.rules |  2 +-
> >>  4 files changed, 32 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
> >> index 7a1c78fdfc92..b607be981590 100644
> >> --- a/drivers/gpu/drm/xe/xe_rtp.c
> >> +++ b/drivers/gpu/drm/xe/xe_rtp.c
> >> @@ -37,6 +37,7 @@ static bool rule_matches(const struct xe_device *xe,
> >>  {
> >>  	const struct xe_rtp_rule *r;
> >>  	unsigned int i, rcount = 0;
> >> +	bool vf_ready = false;
> >>  	bool match;
> >>  
> >>  	for (r = rules, i = 0; i < n_rules; r = &rules[++i]) {
> >> @@ -110,6 +111,22 @@ static bool rule_matches(const struct xe_device *xe,
> >>  		case XE_RTP_MATCH_FUNC:
> >>  			match = r->match_func(gt, hwe);
> >>  			break;
> >> +		case XE_RTP_MATCH_SRIOV_VF_READY:
> >> +			match = true;
> >> +			vf_ready = true;
> >> +			break;
> >> +		case XE_RTP_MATCH_SRIOV_VF_ONLY:
> >> +			match = IS_SRIOV_VF(xe);
> >> +			vf_ready = match;
> >> +			break;
> >> +		case XE_RTP_MATCH_SRIOV_PF_ONLY:
> >> +			match = IS_SRIOV_PF(xe);
> >> +			vf_ready = false;
> >> +			break;
> >> +		case XE_RTP_MATCH_SRIOV_ONLY:
> >> +			match = IS_SRIOV(xe);
> >> +			vf_ready = match;
> >> +			break;
> >>  		default:
> >>  			drm_warn(&xe->drm, "Invalid RTP match %u\n",
> >>  				 r->match_type);
> >> @@ -128,6 +145,7 @@ static bool rule_matches(const struct xe_device *xe,
> >>  				return false;
> >>  
> >>  			rcount = 0;
> >> +			vf_ready = false;
> >>  		} else {
> >>  			rcount++;
> >>  		}
> >> @@ -137,7 +155,7 @@ static bool rule_matches(const struct xe_device *xe,
> >>  	if (drm_WARN_ON(&xe->drm, !rcount))
> >>  		return false;
> >>  
> >> -	return true;
> >> +	return IS_SRIOV_VF(xe) ? vf_ready : true;
> >>  }
> >>  
> >>  static void rtp_add_sr_entry(const struct xe_rtp_action *action,
> >> diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
> >> index 38b9f13bba5e..7874ea8588db 100644
> >> --- a/drivers/gpu/drm/xe/xe_rtp.h
> >> +++ b/drivers/gpu/drm/xe/xe_rtp.h
> >> @@ -207,6 +207,14 @@ struct xe_reg_sr;
> >>  #define XE_RTP_RULE_IS_DISCRETE							\
> >>  	{ .match_type = XE_RTP_MATCH_DISCRETE }
> >>  
> >> +/**
> >> + * XE_RTP_RULE_SRIOV - Create a SR-IOV rule for Virtual Functions
> >> + *
> >> + * Refer to XE_RTP_RULES() for expected usage.
> >> + */
> >> +#define XE_RTP_RULE_SRIOV(TAG)							\
> >> +	{ .match_type = XE_RTP_MATCH_SRIOV_##TAG }
> >> +
> >>  /**
> >>   * XE_RTP_RULE_OR - Create an OR condition for rtp rules
> >>   *
> >> diff --git a/drivers/gpu/drm/xe/xe_rtp_types.h b/drivers/gpu/drm/xe/xe_rtp_types.h
> >> index 1b76b947c706..02c4e67906cc 100644
> >> --- a/drivers/gpu/drm/xe/xe_rtp_types.h
> >> +++ b/drivers/gpu/drm/xe/xe_rtp_types.h
> >> @@ -53,6 +53,10 @@ enum {
> >>  	XE_RTP_MATCH_ENGINE_CLASS,
> >>  	XE_RTP_MATCH_NOT_ENGINE_CLASS,
> >>  	XE_RTP_MATCH_FUNC,
> >> +	XE_RTP_MATCH_SRIOV_VF_READY,
> >> +	XE_RTP_MATCH_SRIOV_VF_ONLY,
> >> +	XE_RTP_MATCH_SRIOV_PF_ONLY,
> >> +	XE_RTP_MATCH_SRIOV_ONLY,
> >>  	XE_RTP_MATCH_OR,
> >>  };
> >>  
> >> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> >> index 228436532282..ff9da494efcf 100644
> >> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> >> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> >> @@ -40,6 +40,6 @@
> >>  16023588340	GRAPHICS_VERSION(2001)
> >>  14019789679	GRAPHICS_VERSION(1255)
> >>  		GRAPHICS_VERSION_RANGE(1270, 2004)
> >> -no_media_l3	MEDIA_VERSION(3000)
> >> +no_media_l3	MEDIA_VERSION(3000), SRIOV(VF_READY)
> >>  14022866841	GRAPHICS_VERSION(3000), GRAPHICS_STEP(A0, B0)
> >>  		MEDIA_VERSION(3000), MEDIA_STEP(A0, B0)
> >> -- 
> >> 2.47.1
> >>
> > 
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
