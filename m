Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8DCBC6FD18
	for <intel-xe@archiver.kernel.org>; Wed, 19 Apr 2023 20:19:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66E9110EAD5;
	Wed, 19 Apr 2023 20:19:56 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06BE610EAD5
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Apr 2023 20:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681935595; x=1713471595;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=tBhJ7xnvYCBbyQoDlWZtmtfkAkMxb8ABB9ffP8hphKU=;
 b=Z5a8ojo9Do/Wj5gWVKKXSur7kWUoyxEi5a09o80m5JEiiEaXlEQCnFN5
 vXktXmfsbqc7d+hvxfy9UKzDV4+AjeDZDKciqvy5FEctwc+uFYxReO8wK
 FUEu9ryQrXA1z0sesOENVPin/ZKjLa48yAY7Dl6QBElqHSdy54v2OR2iX
 Azr+0pi40popM0AatJPeZY+sElwR5tpPnLltLVAcTEccetcIByLGcqFa4
 OYBkhuCz7Hho4RkLsFUpD/Kt1byKcLAooogNJ3RuCMCs8kF5f7Vn0LH4h
 RiDH3r+9GcoQ9KwmOVI5hLjQ9zFdBLHz+YB8LESoRGzyPW5Py1IOpY0OG Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="408464805"
X-IronPort-AV: E=Sophos;i="5.99,210,1677571200"; d="scan'208";a="408464805"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 13:19:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="780959603"
X-IronPort-AV: E=Sophos;i="5.99,210,1677571200"; d="scan'208";a="780959603"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by FMSMGA003.fm.intel.com with ESMTP; 19 Apr 2023 13:19:54 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 19 Apr 2023 13:19:53 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 19 Apr 2023 13:19:53 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.106)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 19 Apr 2023 13:19:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pn6Em8igJKsLD8/YaTVrBJIoLVLUvZuEIR5EuAYfZp9uOddjp9K+jG/CJFb9Pbni12dMujUvF9eMHeg2mBHs84XxVlIlfTSAd2fTA1p2cq9iOjpuNhBNcVmR+Pa4HD2m4Ca6Vtf+m0CZGF3axv5JyOFAg8ZARcT6Gi0Q9Qy3U/Tz9tXIE+4pE3dhKuAKoSdR5Q4yzwDSULA5XdBsE9Gd0pOIUvR3j0vSlyNV9J2hEgOyQAEAvpZK+WCOO+HX2Of2p0FgvtITCsnwDzWJrhz6BCfrLit4r6hzl6a1vuheS0NDOEhaMPqA1dZHeVR7pt3RfrDASrNKshCXZF4RqTd3/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V4wRbaJ6+1FfXuEpucW++l3Ip8HiMpCOpCYa+Nvcch0=;
 b=etpHBKj4ww4v+uRmf47sw4oCOM5+VJpBjfzf9cfymjBpe3D+85KU9MGsrfe1IZ8kKnsOZkGwHDblqW583YPX7cUwSYtuQar7rWNNJcG8HUqvUChwRHeDcagpIssFqCvqauSGzZzj5rLRWAukflcSpszFHFuvsSvTZ204uO+E/wzgoH/UoPJfqel8d29sxW+cMoldQp4szKkGiDsV/z3mNfFdy7Ae6oElgAWDDr+5uocPa5iHzHysJHQFnYKfB3PuMt36N+QHAJKJegKLGKPMW3aW2gWfzUoI9xbXxUrA1L5zjpf4iyYwCTasitL2j23IWb6GNQGgh6vWftt+6KuXPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CO1PR11MB4836.namprd11.prod.outlook.com (2603:10b6:303:9d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Wed, 19 Apr
 2023 20:19:52 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6319.022; Wed, 19 Apr 2023
 20:19:52 +0000
Date: Wed, 19 Apr 2023 13:19:49 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Message-ID: <whic2z65emjgsfnnnpyh4hmmfdzb3jtjsxjwzxdlq76nu2s33d@36gc4ex4qghk>
References: <20230419074440.4006398-1-lucas.demarchi@intel.com>
 <20230419074440.4006398-12-lucas.demarchi@intel.com>
 <20230419173345.GJ2825255@mdroper-desk1.amr.corp.intel.com>
 <stwod2pi444nbt4isgkexorrgvtd6tixn62xezymbydjwdpd6b@z2obzqwxeh2x>
 <ZEBBSS8d4uoW5KfS@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZEBBSS8d4uoW5KfS@intel.com>
X-ClientProxiedBy: BY3PR05CA0017.namprd05.prod.outlook.com
 (2603:10b6:a03:254::22) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CO1PR11MB4836:EE_
X-MS-Office365-Filtering-Correlation-Id: f6c218e2-f551-4520-317c-08db41136e74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ieHQrjaVMBhGiP5j0fWHnY6r1IXZZVKqCt4Zdp5cP5svRLCNeuqpoKoTugzbYP2W/ibvU52/s8yGSVVXswHn99tB3SdkAkCKXKUYyFkcEvFhdjAgV8zKufaxvZyqwQ5RxRtpa6KrDxxoCmAr0PsmGaXf/d10wU58WoACQA9fHi/Hx+S6kgcJwQpAQowMhipe+8CE1Cy9Dfy164t3lfGWO4fEWbpgzmG4IWaIEa2YApjWAxumw8hZs4pqgiI4K+NkF7WXfDb5Fj8yj/6YdETS+5hp87h1osMAAh0PHB7SyKW8WlvvVq/ZaFWX6U5Ep07OKdSn60hviO2cseRCEoHcu+oTaXdOFgFg1FFXBBif/sJbFbaTzP7uMfkiEOJFZftxoMy72t99AopnpRIaRsQ3BP8FAw+sJrNLCukc39I994jRvr00K3WfzvvMXk1x3nqqNVt1oX9DkXtIzbunmpDHJQCNUQdGRB+tifn8RO1wSa4tPQOWmwYDUQY2xwlQC5YEs9PcXJpMnMsek0EXw6gsUb9uVDRiaye49cchmWr3FZV0ehqMu8bpIuFsV+0WkqM+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(136003)(346002)(396003)(366004)(376002)(39860400002)(451199021)(4326008)(9686003)(26005)(86362001)(8936002)(6862004)(8676002)(41300700001)(316002)(5660300002)(66946007)(66476007)(66556008)(6512007)(6636002)(66899021)(38100700002)(2906002)(82960400001)(6486002)(83380400001)(6666004)(33716001)(186003)(6506007)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?51k48uVv4aF36ioU+8zHbe4OyFY/dIyrNlUssP6QRhX8bi3ymgEW7wRFOW6f?=
 =?us-ascii?Q?pjerWysW9VyaZWkdT3G2H3uK6wQjCC/fI9Wf/7iE6atYGGWd3MF2qAf5roir?=
 =?us-ascii?Q?NU/PZnKHPr3PYWfs8V/3/ZyihpiaYWUIUkLjjWBj2S20qDX7XYEltMwtjj9B?=
 =?us-ascii?Q?4oLJ5ye71m5m2m5UJbN8tdJHp4jJYayBka17xztEBxgU8JIZO6Mh1Zb65vGy?=
 =?us-ascii?Q?Gulc+ga6iWAUlIlbuA7v47owNsTmrbUBUzU86x83NGPOx7D9FtYk8u1qAqqZ?=
 =?us-ascii?Q?VNEXUh8ZII6aL73MNNquz09jd/0PRBW+cI5onyc55QDlR7p3ArnEXerlmKM2?=
 =?us-ascii?Q?HeO/s9Spxt6Qi+mdtkY2hAOBhqxSjEjuPna960CFJt5jNWV3jRuCjDGcq45T?=
 =?us-ascii?Q?my2T03LRWNP7vBn7Y9bXHU8s+fRI98OpDoR6qLRxqiNuA7jwCXCKCOPneWRQ?=
 =?us-ascii?Q?Ptg6eXwvtapYFaCTXeHa7uWnqo0TWDJHHGoKsAgjo9ZqgbxHetFJfJBmWttv?=
 =?us-ascii?Q?d+PVeQF3jc0l92Q7V/EJc0dJeCKtEGMg1hCxZIp4XRofqydQ2GhOUTHCeTKi?=
 =?us-ascii?Q?z52X/CuXQ0PgoFf39bBlc5+I54p1+y3oniPrCzMPa+pOSkbp1JyDqopGg3v/?=
 =?us-ascii?Q?SfUnXS4MG43u2M1HcMPE0MCmpz+m27PobOQD1guwtxtlL0WfVSrNYIWQHb+g?=
 =?us-ascii?Q?D6ASjktASJE2IgCBl8zdmfRi65tuwVwBlEFzfrEScsrJanNB090ZFjnjMSFQ?=
 =?us-ascii?Q?UIrX/ILQnkwOX0V0eSkODs+y1iX2/hY8e4b69/GwHf8/fuyILBw7zp5fhnG8?=
 =?us-ascii?Q?8iiADoTot1S2wsscPTD80YQbaiabolqdgNbbDGfdax9iGR1BYBVdvtrwUdM7?=
 =?us-ascii?Q?vfMiM7eZbVpYUJWdkOC4w/J1hcif7gXzX6ZMYWO8vaRT1UaXBrfJq77xl4bV?=
 =?us-ascii?Q?KSDXtpexQi+7wxt2CppBszornFqtc/rcJ27is5ihcuwpD+GMrKNpYHpXalCz?=
 =?us-ascii?Q?stqW1DbGyGCJCmuZMuy8YBAyui62AvovUGSNliBIlrIFdwIUb2ZW85qR2tIa?=
 =?us-ascii?Q?4egzzx/wOs2ElM/QoINGjb6OlmBruIW1iENMYrM2OUhjimNMpIEhc2CoAORV?=
 =?us-ascii?Q?T8/cF0RH1V8S1zkzLj5eKSULdpepgZlELDWotmYx8pEUeN9vBieRI1xfRzf3?=
 =?us-ascii?Q?RsUP0zNlnlleqSgSvOK0+ikQx1nbyDmoFRQDg6Zp5gV74Q+/YudzumdyDyaE?=
 =?us-ascii?Q?YmTs0dzLXq2uxSmgYc1Ct6Q5c3wuTTjlhFsVh99KO4pZfczoFmR3zJNMXpGF?=
 =?us-ascii?Q?/HavdiX0oqA4ybbHnPTfLqbvphuWBeDZbA94HfTtRKd9gq+Rf8onfY3YJAhY?=
 =?us-ascii?Q?D7BPwtxLaJ/sb5QSC6jMrzTbEYcQy2JejpKc/ZBJvA2oyD+u0Xz4bIpnjYl3?=
 =?us-ascii?Q?CTCTjm50I6wG7ApEzxHB58DeXVjhH6kbP7llnWerYpPm+y+Hg5fEQ7tDoR6J?=
 =?us-ascii?Q?ZrTQdlZKkLvqo48Rd88qGdpvdqaS3GuAcwf2oFUffdeu+X4R67H6JPcuCWFu?=
 =?us-ascii?Q?MjKwbtgcl+nzRJTAXA9zCH1lyi0IiR8m/HRsCez5wJM3E5ri8+om5YFksy+x?=
 =?us-ascii?Q?ng=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f6c218e2-f551-4520-317c-08db41136e74
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 20:19:51.8493 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aUdUpmSYQxuGahnQGRdPDnMhUb16KKEgOZ6nSYzfkmBC65Kqy7LxoN0pTF2uetAa1MKzvW5sbdpNlZFx7XdI2MmhvrvuUp1skPf5ja1YmWg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4836
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 11/17] drm/xe: Introduce xe_reg_t
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
Cc: Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Apr 19, 2023 at 03:30:17PM -0400, Rodrigo Vivi wrote:
>On Wed, Apr 19, 2023 at 11:49:56AM -0700, Lucas De Marchi wrote:
>> On Wed, Apr 19, 2023 at 10:33:45AM -0700, Matt Roper wrote:
>> > On Wed, Apr 19, 2023 at 12:44:34AM -0700, Lucas De Marchi wrote:
>> > > Stop using i915 types for register our own xe_reg_t. Differently from
>> > > i915, this will keep under this will keep under the register definition
>> > > the knowledge for the different types of registers. For now, the "flags"
>> > > are mcr and masked, although only the former is being used.
>> > >
>> > > Most of the driver is agnostic to the register differences. Convert the
>> > > few places that care about that, namely xe_gt_mcr.c, to take the generic
>> > > type and warn if the wrong register is used.
>> >
>> > The disadvantage of this approach is that we don't get the nice
>> > type-checking that we have in i915 to catch register misuse at build
>> > time.  Instead we wind up with a bunch of run-time checks that only tell
>> > you that you used the wrong register semantics after the fact.  Wouldn't
>> > it be better to keep the strict types and let the compiler find mistakes
>> > for us at build time?
>> >
>> > The only real problem with using strict types is that there are a few
>> > places where the driver is just trying to refer to registers/offsets
>> > without actually accessing them (e.g., whitelists, OA register groups,
>>
>> that is not true.
>>
>> > etc.) and the strict typing makes it harder to provide a heterogeneous
>> > list of those registers.  But I still feel the benefits of compile-time
>> > checking outweighs the extra complexity we wind up with in a handful of
>> > places.
>>
>> I disagree here because the strict type checking is only checking for
>> "regular vs mcr". Add "masked" in the mix (that has been a huge source
>> of mistakes in i915) and you already have 4 types(?) to deal with.
>>
>> There are also places in the code where we want that "this is an
>> mcr/regular/masked register" info to be used later. See how the reg-sr is
>> handling that.
>>
>> In the end I believe having this info encoded in the regs/*.h is
>> sufficient to avoid the mistakes we had in the past.
>>
>> Any change in the code triggering these warnings has a very easy an
>> actionable fix.
>>
>> If for some reason we want to only differentiate mcr/normal as strict
>> type checks,  then I think we need to provide a better struct for the
>> places that don't care about that. Something like below maybe
>>
>> 	typedef {
>> 		xe_reg_t reg;
>> 	} xe_reg_mcr_t;
>>
>> but reg.mcr still being there. Or going the other way around:
>>
>> 	typedef union {
>> 		xe_reg_normal_t normal;
>> 		xe_reg_mcr_t	mcr;
>> 	} xe_reg_t;
>>
>> but xe_reg_normal_t and xe_reg_mcr_t actually having the same defintion.
>>
>> Lucas De Marchi
>
>I honestly liked the approach you took on this patch here. Getting rid of
>the i915_mcr is already a win by itself.
>
>One case that came to my mind though is some time sensitive mmio operations
>like display inside vblank areas. any runtime check could potentially
>increase latency, no?! If that's irrelevant time, than let's move with this
>but if it is really a problem, then explore your latest suggestion here
>with the compiler doing the checks for us seems a good alternative.

the additional check is inside xe_gt_mcr.c... I think the additional
check is negligible compared to the other operations there, with each
access to reg X requiring other 2 mmio accesses to take place.

Besides, there is no such user in display/

	$ git grep xe_gt_mcr -- drivers/gpu/drm/xe/display/


Lucas De Marchi
