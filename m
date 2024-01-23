Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86BB6C47258
	for <intel-xe@archiver.kernel.org>; Tue, 23 Jan 2024 21:05:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5061B10E08D;
	Tue, 23 Jan 2024 21:05:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7301610E08D
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Jan 2024 21:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706043917; x=1737579917;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=UdfBAdWSgAvfGXIFp+Z6WFzdEg/yAwmI60TeZT+dOEA=;
 b=LZo66mgDI+a0JS3B5sbVK+Y+nR7PpQdvnQXlmeCLfzYsl9wX/cIQxAQB
 jurCKj+Dzr6GMWBNAjdGJ6JqKmzcMkTNCoKFjnuuHwYZFdJKpJAgMR2VQ
 lGR8i1DcdqJydEP+fghBbCT1K9HjVmhmK/Yhb0Ear2eHl8SHTTYpeGHy4
 QK6HFXH8yC9TraeMZ+8n12x7v6sWt3U+ipW7gcsY+YngHBALPHRpwyU98
 L0tIt7SNX+LprsvCM1dM1DnnJ07lUMGm3lDEKfRQsvU+SNiRJHooNJZx6
 aXMM2XwPTesvwO+S4ZeMByiUQxCNLLbdaC9S1CD462k0lvExu6w9o4/yS Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="1497119"
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; 
   d="scan'208";a="1497119"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 13:05:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="876462277"
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; d="scan'208";a="876462277"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Jan 2024 13:05:14 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Jan 2024 13:05:13 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 23 Jan 2024 13:05:13 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 23 Jan 2024 13:05:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TfxX8C8b5lsjFHY6Y1eItUT2CWtxyo4sO788Tmqad2LOF6043ocHSYtJ0eJ+7reiFvomjVYHsB4MJ0VaeL8TF6vfa3umi00J9mj+EaHF9yN9HQeDHNLqNmw6GBW7YNAxvzi1zdN7f3fmLezG28dr1v8OsyKePHyYjmXxxqCHuDxkEr8GhLbcRerueu1qy4gc84fbHF2ezfOKN1XMorBk3eByQd4eoDt9KwkfPNYadY5D7ayzBzetNZULgQL/sYts+YHTIUV8S7LaFLkr6K69Dh+PnD9uaEKoP/PS5W8xT4PjW3HEf/Jgoun5NJQGOYDkwiIZXsTObj5olsof8rZD7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cE3wWM4UJ9Zu6y5B2xUOevG9LAFf4Bt4vppNhds8H0E=;
 b=itYVRJWKH9+frfWi/UCo4HoGuM2JctB24XEe6T/5E0OT7n4m08eHdzpx7z3e0/966Ni1YSIxsjpw+3ew19jc4lFL+ojYiN80amDeiekhty2e5QPcmbJHGQTsf+v6toq/TtNRh+QgvvA0jwK8DEIH6XPgqjIVkjWFAgx2qsa6/tbiypFPjr7d6mt8FSzAwDrGswpruy9uqHkxoXjek07shWR5F4rqBdNt7pmGbHIK9dvi7gC1cp73AI9HXM5OIZILSwrFU8DSG04yL6I8rJr7Tcfau7iD+RtwOnmpaUerkk1KHoV6134CtI0VaqJrKokGSd0ydrpotOKUJOecv8ZaxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB6074.namprd11.prod.outlook.com (2603:10b6:208:3d6::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.32; Tue, 23 Jan
 2024 21:05:09 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda%4]) with mapi id 15.20.7202.035; Tue, 23 Jan 2024
 21:05:09 +0000
Date: Tue, 23 Jan 2024 21:04:09 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH] drm/xe: Prefer BIT/GENMASK macros over shifts
Message-ID: <ZbApyTRzCL4gc2hn@DUT025-TGLU.fm.intel.com>
References: <20240123190201.1599333-1-matthew.brost@intel.com>
 <87y1cfluxl.fsf@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87y1cfluxl.fsf@intel.com>
X-ClientProxiedBy: BYAPR05CA0091.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::32) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB6074:EE_
X-MS-Office365-Filtering-Correlation-Id: dc3c86c8-2cbf-44ef-b1df-08dc1c56fb6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DaEhktHgQUqJe+KCncFk3Om4dqQLsv5EaIN9OAlAuaYlq2zRVo3E/Z75SKHU6ac9tx7smTXVE5bOT4Y0ProGdjQSKSgQCek3q3Mflmsx0C+8DDufh2KW1QOm8qItiDmxqZ+kC8cmAjOat8kJgGTloxTDc061Lbn9A+etwZkCHAf7AwPGasosd2woVmTDOiRuRL9gmY1dUzaWWBB6fxSm4ujEdRBZn56I2FMfRaFHaCeLdumSDIQ9scbZK3CAAaZ+EaEudpPtgwSD83v5aGpnn/AZr971VR2N7i3V0qofYRioCIp0srybLbXzSotc9PNRDOoiGJzdmF8xyImK6gH8mKHUy1SYdmxNX8VM13ZUGIo+82c+3fT014E+f3FcQPx8oyji4Hc0tN2tjoyT+MwTvv4srxnRLt9v/bUBUSA/DeHUffdCMkUU8z8nsx4aywVfA0UjhVXmDNBFKIDKUhdyNhe1ych75Cea+zfq/8X/YxddZ5qrt3Ifa2Par80nUov77I5+olNbir4aoP0Fe1MTYx5jT3Kgw9j5Cy3R1K+qb0I=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(366004)(396003)(376002)(39860400002)(346002)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(2906002)(6512007)(83380400001)(966005)(478600001)(82960400001)(6486002)(6506007)(5660300002)(86362001)(38100700002)(6916009)(316002)(41300700001)(66556008)(66476007)(26005)(66574015)(44832011)(4326008)(8676002)(66946007)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?1B9WYIUVVsqBOtR4Hw6GsIE2T5VkmjVjpw7usRMCzh1uNzcVGou2SNqoRH?=
 =?iso-8859-1?Q?UfD4LqXTeGzNNTTF9KQ5Pzu2cPmVXSwFtHXbFn9S5uNmp59BZWxTRNV8UJ?=
 =?iso-8859-1?Q?U4I0c8I7HRGbFqL8iHMHjkXFimYhJ8bz2X5PK8SUs+S8qKH7k2t2HIxzkh?=
 =?iso-8859-1?Q?4xE7el7qcClgfHPYOvB0n3/RZJtMBSCzk6LnpY4dmFVynl46MN9YcIWTuu?=
 =?iso-8859-1?Q?YuwwkQ0NaZN67E5vYTj0BTPzt3S0GMNUE7+Q0C0bJBMqkivQHoxkb2VTX+?=
 =?iso-8859-1?Q?8T9rBL+AZAQNWB081iDfaOB4fTCncIyQJ5vAW7EQ78VqfjPfHdlE8onm46?=
 =?iso-8859-1?Q?Nv6VyTtZhaZOVBzsvT5VP7spQdW7rdnItXZyem66qLyi0dGQVEkTULcMhf?=
 =?iso-8859-1?Q?BscIs/HNRCHQWYHHz1iFjLnq0QcuBTGmzecmbzvbijs6R5GEKZOZIF8MNm?=
 =?iso-8859-1?Q?x6cNYkvMkRX1Z7S/2TlMBjNkWId92ngH1RL1jz+yCcva9GjZmvaEd5wEav?=
 =?iso-8859-1?Q?foHmVlYIbCcU6tQgcpCsOIybtT2dVzBnG0msz89kA/EzBtkwYhDwyh6tgG?=
 =?iso-8859-1?Q?WqlPYf96mzbcWKK4rw1gusd2KQOEYz9gJA//Z/l4BpCbTXgZlNrIBrizX/?=
 =?iso-8859-1?Q?U3yLtagI6KDQH/L8Q68BWSEHYdcKBebTIJFXZBBjtX2WXSnCq76Dr/PUjc?=
 =?iso-8859-1?Q?5oj5DTTTfqXqvHX1poX7GApWYkGLUoJiKJQpfjVzTAR8Jyl6k1EojfndHh?=
 =?iso-8859-1?Q?6aYgCSx3IOkEeCrqwZBLLO7AzqS6Ug4aqq4K/MoVSnG6+qfvyrqV3BkSG6?=
 =?iso-8859-1?Q?TrMHE/JSaM13xaWTqQ+mv075YgvGCjF+1yIz9JT4s07bhp1zNquIOE+QBY?=
 =?iso-8859-1?Q?6TX+b/q3bsdKXZL5njFWOBNKC6lYgCCX3PNfBrTVI5qSzudLcHR34Hbhn6?=
 =?iso-8859-1?Q?Qo8IC6QhVLbcaGW/HE6seh2CinVT6V6SDbDjuIbQv/eAximV/FRbsAORTX?=
 =?iso-8859-1?Q?UdhSbsF2XOs8S6H/wpoKiiu115alvOervKPEXPm9/3t3+BmqOM+3omnMs7?=
 =?iso-8859-1?Q?kP2wBgieeSs6ELbEix67WY+Y9xVrhxHWYAipeMayf8duQxHBKNdWSZLga4?=
 =?iso-8859-1?Q?IKvCBWYFsVPgde8FoP8Rza/tau5583zafTeLAoA/CeGF0Cd6wmQ/tmAFyA?=
 =?iso-8859-1?Q?nWEFYEYaBxFIkH1zw/9knixjfM9hWlqETkB9hL+TXCaOBLYTm4hE0G3jrQ?=
 =?iso-8859-1?Q?NEVShj53yREUMc9p2yeN+uKAqr6cvMr7I7EEzW7ztYk6kalXX2MjStuvPT?=
 =?iso-8859-1?Q?5yMlyxA7SD0ZaBzgu2EeI/Q8LF6/BSrZQ7ucgEcfNB6M/LoDuFzMIXp1x7?=
 =?iso-8859-1?Q?81/QqKzf6nV630eCEjsAIw5UdwtndNvbzdyR4Cg646jiuPgS7F9jGXAKob?=
 =?iso-8859-1?Q?FO2dE6FRsktNKMDfI2pYp90B6GzgO4cpUzBnREC2k1S1++ADo4AboaexSh?=
 =?iso-8859-1?Q?soXHhrlFNIR3mpSQ+ugicnbWmUEB764F4noSuSLqOWGx5i0McETMRNOM4d?=
 =?iso-8859-1?Q?At+r86orQFsJzogAE1YRv/GZ2VuPS3YuLI8lfgfHzDzcO8SeETLCjWJ8Hq?=
 =?iso-8859-1?Q?wfzqzlHqsSnnqgWp/O/YVzCBXXqfFwaU//UuKXLY9hWli9aEflVbeDIA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dc3c86c8-2cbf-44ef-b1df-08dc1c56fb6b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2024 21:05:09.2273 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Aheeeqa95llWrPCDusvMVZKafhU4xCe0TMVgjIL3Qu2UGdx25ZSWpvKsVMRhCXP5eCHINQ5PAzSaa1TOcXEQGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6074
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Jan 23, 2024 at 09:19:02PM +0200, Jani Nikula wrote:
> On Tue, 23 Jan 2024, Matthew Brost <matthew.brost@intel.com> wrote:
> > Using BIT/GENMASK macros is a better convention than using manual shift
> > and will also fix build errors [1].
> 
> Somehow, that description doesn't match the patch!
> 

Indeed. I did not include abi/*.h files. Will resend.

Matt

> >
> > [1] http://kisskb.ellerman.id.au/kisskb/buildresult/15112475/log/
> >
> > Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_guc_ct.c    | 2 +-
> >  drivers/gpu/drm/xe/xe_guc_relay.c | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> > index ee5d99456aeb..fc5cc2b2bcc5 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> > @@ -866,7 +866,7 @@ static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
> >  	 */
> >  	if (fence & CT_SEQNO_UNTRACKED) {
> >  		if (type == GUC_HXG_TYPE_RESPONSE_FAILURE)
> > -			xe_gt_err(gt, "FAST_REQ H2G fence 0x%x failed! e=0x%x, h=%u\n",
> > +			xe_gt_err(gt, "FAST_REQ H2G fence 0x%x failed! e=0x%lx, h=%lu\n",
> >  				  fence,
> >  				  FIELD_GET(GUC_HXG_FAILURE_MSG_0_ERROR, hxg[0]),
> >  				  FIELD_GET(GUC_HXG_FAILURE_MSG_0_HINT, hxg[0]));
> > diff --git a/drivers/gpu/drm/xe/xe_guc_relay.c b/drivers/gpu/drm/xe/xe_guc_relay.c
> > index c0a2d8d5d3b3..2d1f19270d9a 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_relay.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_relay.c
> > @@ -300,7 +300,7 @@ static int relay_send_transaction(struct xe_guc_relay *relay, struct relay_trans
> >  		ret = -EPROTO;
> >  	}
> >  	if (unlikely(ret < 0)) {
> > -		relay_notice(relay, "Failed to send %s.%x to GuC (%pe) %*ph ...\n",
> > +		relay_notice(relay, "Failed to send %s.%lx to GuC (%pe) %*ph ...\n",
> >  			     guc_hxg_type_to_string(FIELD_GET(GUC_HXG_MSG_0_TYPE, buf[0])),
> >  			     FIELD_GET(GUC_HXG_REQUEST_MSG_0_ACTION, buf[0]),
> >  			     ERR_PTR(ret), (int)sizeof(u32) * txn->offset, buf);
> 
> -- 
> Jani Nikula, Intel
