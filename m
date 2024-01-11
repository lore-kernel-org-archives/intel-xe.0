Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7131C47077
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jan 2024 20:09:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99A1F10E8E7;
	Thu, 11 Jan 2024 20:09:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40CAE10E8E7
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jan 2024 20:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705003776; x=1736539776;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=f6MmPIl2JSpS3hE0qaBZvU3KaQmZ1VamJYolEn3TQas=;
 b=gVpjfIc7CS7Zvir7RtbsrOWBJSmVnjESPuRFQwSGLUfBSYwz0BLmfIgY
 ZgvnkGUjrCPyR0FWd9S78U1le8JOgVMMNZ8fGdExHdjies2THg1Tdn22A
 Eju+rsOSayRlssuCOwV+mwK+dWTdeLRR4Sf2W371r9Naq7JOZTxtkjNYS
 PkOPyY4/h04HdTEtZbGlZS4IN/UnAuv6gplzQkb1Y6xOlsCf559Yv8pUf
 0lx5uVqG1Y+dcjf4gSGEniqsgF6Cy5mxddD6kgBzaJtBm5WVlnZuyL7Mj
 xi3JBQWOtLANjbYONTtR4z9L2J7C58EtHIUs3OrZVUidXLJQ0eDItkmek w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="5715499"
X-IronPort-AV: E=Sophos;i="6.04,187,1695711600"; 
   d="scan'208";a="5715499"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2024 12:09:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="906071177"
X-IronPort-AV: E=Sophos;i="6.04,187,1695711600"; d="scan'208";a="906071177"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Jan 2024 12:09:27 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 11 Jan 2024 12:09:26 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 11 Jan 2024 12:09:26 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 11 Jan 2024 12:09:26 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 11 Jan 2024 12:09:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jTerb8Ds5BndghODzT1k0qK6JKBL4cjnukVtoYvd1c1go3URNnSeRSsIgv76QxLPhbuWhWQULuAIzaCPAz29ePBTclQRFqDvjV/7tBV6U6m7h5nYpUBV8SGAOZi9gJ+MIPw1cHdaGt/zNcyKpTEnk0A5CoHkjidxI/N8qG0ZNRKsWeO+59kjCDVM9BhxYmguJYVGlYvAwUkBO4istJvIy+XswNc+9RUcj0QvnUNKGsXbkXTwgN72joH8gn4/nciY0N/B0ouIJJqAe1HIxiMynY8GO8nl3hmjPrYGUvhE0YAAd4u75sagUfK9a4aEBZ7bAlPT5N4EWK0ydOiGt9NgGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E69YjVP72nu1R1jTFhxw6NUIVpf1teyEQ2k6e5nDJpM=;
 b=XFNeZu/u1JCCfkPlXAodnetUqs1CxNknePbrIxWGPWaZXhGxpfUf46aIlKYZjGEfCFnL5kK6knWmCGR3esZ9jNtdoIJjpNvbCqGhFBo4rWaJL68SAWEjfZrnlsL2JNlEIFDXryBnhD3TWRY8+oL/fH8Qzp3H5OH3Al9lTcq6OrZtBQcxpOw7SWUZgdKiqsMl6eeH1671Jf2J+IBV4ZzrcCyr6h9DVmjsyNTpDh7k+8vMj0zWAV9+0Xn+eU+hdytCU3txfvqoE6EbaCqC0ahioeGS9ea+lRV9MI4PsqOwtRVgjGDrzqAunb3HGdUinRrii3fw0Wow/BUtfR+pAdxWew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH3PR11MB7895.namprd11.prod.outlook.com (2603:10b6:610:12f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23; Thu, 11 Jan
 2024 20:09:23 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda%4]) with mapi id 15.20.7181.019; Thu, 11 Jan 2024
 20:09:23 +0000
Date: Thu, 11 Jan 2024 20:08:06 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH 2/2] drm/xe/guc: Fix arguments passed to relay G2H handlers
Message-ID: <ZaBKptKN6xjIZ+ah@DUT025-TGLU.fm.intel.com>
References: <20240110195951.453-1-michal.wajdeczko@intel.com>
 <20240110195951.453-2-michal.wajdeczko@intel.com>
 <ZZ8jSw7WdvokR5Rh@DUT025-TGLU.fm.intel.com>
 <b249c605-25f7-42d7-b5e4-ed2fc59a51f0@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <b249c605-25f7-42d7-b5e4-ed2fc59a51f0@intel.com>
X-ClientProxiedBy: SJ0PR03CA0290.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::25) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH3PR11MB7895:EE_
X-MS-Office365-Filtering-Correlation-Id: aa93b4c8-6e4c-48b1-9c85-08dc12e13466
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SeMiiu1X+jHtaM7GL8oV2jSkNPnEScjf6dXKlAtU6GWjEhnPJoWDVuNQupkLz7Q9sJklWYRjH78iDeknsPZ6FtZRlUed8s+6jF8660Q2nlIAcomXJZQQEek98C5mjr2bBHkBXQDUm6V7yKiDrJ3ZdK3eEOIGZXUo4KiWFGDYjZX4ozZUz79AMNxzYxguyxXTDwwP9/0Ff646CbnH5PGD1UlBjpVIBr5WbM7L1KgqaJEI8y7OZNjpFTfGWI0aKqAh7Nk8oGLvVpV4YGaqApTBLgq7MMqXngcMVVY4p+ZvmnzEnRrkcKwgSLYC4b2YfBX6rGpKSsErQZpqEpwJxTa3d97ZX+sY4Yuhw3RSQEvunenp+dB9GBiPSxpQefndftwKSW6H9PkqXSpYAQcPFP6GUgfDOavPiKOf0vze6sPMTdgI3ppRmcWj3QwCXD0uKsejy0fdKkjROrWVg3a6jlf4k3hIej4KEOSjpQON1/B8c0lSNB0jj5Tw14el6XpSs/yseBq1r4tjsH6+hPogAtgWu5cgZWq1xD3Jyo2Q8TGJwwq43fMXclXuAYB69HJZw9gb0nV4UBFark2Tg/tih4KPCK2sbT1qcvOvdbjXoiUzTto=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(396003)(366004)(39860400002)(136003)(376002)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(2906002)(38100700002)(5660300002)(82960400001)(41300700001)(86362001)(316002)(8676002)(8936002)(6512007)(66556008)(66946007)(26005)(6636002)(478600001)(66476007)(6486002)(6506007)(83380400001)(6666004)(44832011)(53546011)(4326008)(6862004)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bk+AVLXiqRgwbC+HivtYRV8yw5+9iMt7VeD/luTdIHleo0Z3Ti9FWJSsXodd?=
 =?us-ascii?Q?1VB6ZoRMiBTCeo6fNLiEewHAvbi9gev+jhqHiCAREuHjzF0FzJzheAcQaaVi?=
 =?us-ascii?Q?FQySQK1G195shabWg0fxD2CwUJN8Xlrs7wOURXkFLJGZZKZyiAaGca2DC9Qk?=
 =?us-ascii?Q?xJlinh66v1KlqQmh2j8uSqOEUa/wtPi5hANhsHOkqNt9csT35chBkXvh0oev?=
 =?us-ascii?Q?LCUlTiyJFGWOYRLsm9lif4IxK5SFNobpGvbT392jiSlhZ9cZg78a9G7ufocw?=
 =?us-ascii?Q?p4InslXHao+bqUOuETDfiz1K4pXcZBsNnSdOfpj9xni5aLZ3YD7fBFxEEgcg?=
 =?us-ascii?Q?5KYT3BRlOKzgAFr9hiDDyPLRKwzUqFja2h/VFl+fPCRlZEboKrsYd0hGBIDm?=
 =?us-ascii?Q?MPMXlDD1An7c+CjtbD4qyaRyUUJQdg1+dkFHFaGo1nunNKZdQ3bPsNLCHvWp?=
 =?us-ascii?Q?X4jXAwsWvt5jMaXs1FWdsHgBKLVm4HBStdq8TL0FxffN4PtS/epfS2dPZNkL?=
 =?us-ascii?Q?pIY7CN4h7Dzp+kCcwxmdaQMrhA735x8vffKyRFbhutU82r1cLCwNZUJXq1EF?=
 =?us-ascii?Q?gPrJDjASxHbq+MNdsvRx/ihqkAbAFvG64/0hhOcwp30y26g851XPN/payNxq?=
 =?us-ascii?Q?+rv2AQDF2x2Iq+7nBj/l4GeBHMfqCLGJftIaSiCQJaP7D1dFY6zGxkCaBQPi?=
 =?us-ascii?Q?HwLEu7I6r5pBQTZVYtsJdedJXMIIlm91UrV4TFYJBF5nzFyfFMlMC1SmtnLE?=
 =?us-ascii?Q?mXfs/bUFQfPrPQ93IPgspgMhexiqn4XU6v/gjSdnOkjhfxzc6ATA4pDW7zWy?=
 =?us-ascii?Q?KsKJJl7J8AQaA0Wtbj5s4NQrF11i3JWjrNxYG+YNWgZYZ4iiBTmamwcINeuj?=
 =?us-ascii?Q?jRqVdDDQSt8oG8fJ75dpKp3MXVUpqLpuCWL3Ne72dDNc2J/lZm2+rui9+SuP?=
 =?us-ascii?Q?OAFYZAszGnjy96hk8PJ6WHVhToZfPdDQN88ul4pDLnVczdQ3uD0wK98jxk3k?=
 =?us-ascii?Q?vUIPsbpCYMOa8iC+OXA4o0A3L/ISEo07A51qUNUnYnAXhh2ZQrsNU5MdmDk3?=
 =?us-ascii?Q?9Pjayrwo5sSjtqSD1/mktdFkHwSvQDqUYZPDjg1L1T7FLy02qzT/3Elwnwr8?=
 =?us-ascii?Q?cFBKGRexbFh2Qj1Gio5TCKorerbMjrxjrVddUtipm7126+Ml6VPx1Y1HxwFp?=
 =?us-ascii?Q?zWZyOGBTz88G906SPYFQIBAdDPvW8Vl9lWoWshwHgNJEZXlNijKKs4LlNyjG?=
 =?us-ascii?Q?CpU5ROdhU+rktSuz0eJQgWvS5eD0lzlzNsSAOFEm0iFSXgrY38G3FCBMUSgx?=
 =?us-ascii?Q?dJe853yeHnypsXG4/Sckm/pT5XcjmuUPG/y+7em+ngSQKFQOs4v+b1BBEGzF?=
 =?us-ascii?Q?qQzgC2OP+MLnFBXJbZsAtGWWSiaHcThPaklgZr8oM2oKZfjkn6Qra2HnKBG7?=
 =?us-ascii?Q?2lEKjMTOereR81MX1W6Y599PtS3rdDKDrDEYo25V4eTDuigrZ+A5TyQ+2ePM?=
 =?us-ascii?Q?g0h5YwGW95ix6aUFcKLui9nG7YyA2IECW6mkYJKZT+HVw5F6coilwUhvrFTO?=
 =?us-ascii?Q?p8al78H1GHcpaj7S44BXS+7XVJYlmutkbxzGoJcKZF34qp2fYHs53VN+JTip?=
 =?us-ascii?Q?iw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aa93b4c8-6e4c-48b1-9c85-08dc12e13466
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2024 20:09:23.7067 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oLGNV4UD0J9Sw8CN3GM1CyO2juvkUGvlIY02Y5wdxG9kpJmzI8xXugioLz/rS/vhJNTRnM1OsVG1BKmCHx301A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7895
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

On Thu, Jan 11, 2024 at 10:37:31AM +0100, Michal Wajdeczko wrote:
> 
> 
> On 11.01.2024 00:07, Matthew Brost wrote:
> > On Wed, Jan 10, 2024 at 08:59:51PM +0100, Michal Wajdeczko wrote:
> >> By default CT code was passing just payload of the G2H event
> >> message, while Relay code expects full G2H message including
> >> HXG header which contains DATA0 field. Fix that.
> >>
> >> Fixes: 152577060697 ("drm/xe/guc: Start handling GuC Relay event messages")
> >> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > 
> > FWIW I do think the argument names in xe_guc_relay_process_* functions
> > should be changed but not going to hold of this fix.
> 
> I can rename message argument in relay g2h handlers to "hxg", but what
> about the other g2h handlers, which (IMO wrongly) take just payload, not
> a message, while still use "msg" as an argument name:
> 
> int xe_guc_sched_done_handler(... u32 *msg, u32 len)
> int xe_guc_deregister_done_handler(... u32 *msg, u32 len)
> int xe_guc_exec_queue_reset_handler(... u32 *msg, u32 len)
> int xe_guc_exec_queue_memory_cat_error_handler(... u32 *msg, u32 len)
> int xe_guc_exec_queue_reset_failure_handler(... u32 *msg, u32 len)
> int xe_guc_pagefault_handler(... u32 *msg, u32 len)
> int xe_guc_tlb_invalidation_done_handler(... u32 *msg, u32 len)
> int xe_guc_access_counter_notify_handler(... u32 *msg, u32 len)
> 

Good point I'd say lets clean all of this up.

msg -> entire G2H
hxg -> HXG + payload
payload -> payload

Ok with a follow up. We can chat off the list with who will post.

Matt

> > 
> > With that:
> > Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> > 
> >> ---
> >>  drivers/gpu/drm/xe/xe_guc_ct.c | 4 ++--
> >>  1 file changed, 2 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> >> index d6b7020a2d2f..4a0c9ce13bf8 100644
> >> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> >> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> >> @@ -984,10 +984,10 @@ static int process_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
> >>  							   adj_len);
> >>  		break;
> >>  	case XE_GUC_ACTION_GUC2PF_RELAY_FROM_VF:
> >> -		ret = xe_guc_relay_process_guc2pf(&guc->relay, payload, adj_len);
> >> +		ret = xe_guc_relay_process_guc2pf(&guc->relay, hxg, hxg_len);
> >>  		break;
> >>  	case XE_GUC_ACTION_GUC2VF_RELAY_FROM_PF:
> >> -		ret = xe_guc_relay_process_guc2vf(&guc->relay, payload, adj_len);
> >> +		ret = xe_guc_relay_process_guc2vf(&guc->relay, hxg, hxg_len);
> >>  		break;
> >>  	default:
> >>  		drm_err(&xe->drm, "unexpected action 0x%04x\n", action);
> >> -- 
> >> 2.25.1
> >>
