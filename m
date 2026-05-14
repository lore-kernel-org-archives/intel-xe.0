Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04FB7CD37AC
	for <intel-xe@archiver.kernel.org>; Thu, 14 May 2026 20:51:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FE0C88C3D;
	Thu, 14 May 2026 20:51:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="conVX/hL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 090B288C3D
 for <intel-xe@lists.freedesktop.org>; Thu, 14 May 2026 20:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778791874; x=1810327874;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=WPp6hHfp2VMdC9hWe9dCOKq2gckzOcftnXtQ65/40Os=;
 b=conVX/hLlQ3GEbI/BCe38W4/aUjQ2aYIdbQfeJVbbam5vc9fHsAcJNA2
 LfH7jXpt2/nWMdBHSL64RzaE/tv5bS2kaUxA6DIswTe4vTM8hOrI1XXMV
 FY5XOROizU5GJLggGdGu94Hoi514YPi4WHrHBmD4pWvXYxLgioyCHMoh5
 YyFtMMDVuVgSHpGQs2HfL98wu5OcnNTwkx3/xToEzzRH7YwVhVnWvPdeI
 frLGd15zm1wt1KkpeWmfSTqcq3Q4mSVCwO8/GTbT9U9djRZfXaLclZX2v
 qPqgFpbBuCJaqDtaCAk2RDZGERkDJ++qT9QSQdnHKRfS8hvrjEyQNm1KY g==;
X-CSE-ConnectionGUID: igrAXFFaTwa6/4JvIrYAwQ==
X-CSE-MsgGUID: s5gzDI8eTna2Wv7zIgz4og==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="79637497"
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; d="scan'208";a="79637497"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2026 13:51:11 -0700
X-CSE-ConnectionGUID: yGDqhGcTTV2JyxIPBZhmsg==
X-CSE-MsgGUID: 7TJ623VCTq6oFCOEyQdVug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; d="scan'208";a="238754405"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2026 13:51:11 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 14 May 2026 13:51:10 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 14 May 2026 13:51:10 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.34)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 14 May 2026 13:51:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AHXoQjwH8ZoZZLD+uHDu0qk8hbgKCD3ePtmYd4wIYwht0+MekthuncFQUTX3onGysl6ohRYCekiDxuccthjI5yJxZcG09oKV0lQlg/uFReYrizDEh9NAWNL1jjoFDKHgzDMma0f4zXKlpCj560ps+2kSLC7S21EvHsLpo2I4ijJQiXP1O0wPADzOqlmBjN2/Z89r8tE7aYxgtLEaNtB9uErlrIh9bYMgtmU63FhhNFDwR2rWniOVDPgz7uHwHJVrveTcwVFDI7r8ktMaa7gB/JOp+9zzEDYUT76NfIdNXdT51FaTo0t22aJt89hkGOOcwXp1tkM9HgnWR9rGxKxzmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Al3/iFWAGz9PnKA5mKSrnVOfmmWq7SOaXa4JaJ/fjvU=;
 b=ghUQYGxsoW+aU7FlOtvCPTs/hCVjonEfbZGodxv+mdmWhl7TglNfXMmfHm7iYNslrndwai91Fm7erLTf/iGxSW7g9OSOZlwm5Fa97M8Mf8s8ZEeLCimgpp/w7dLXHH4o/JgMEXmLJBNTLzsF5UtFlWN55fJYgcXOJG4xa1N1tSDZvFZWwShy7hsdtlvZ3vXNOtUFG33bNlW40fLhJosIuXXdvS96zpgi8ofjulbqLsCcdz7Xo7X0YmjIAsBl0Bcm2DIBy6f63+M08Q9ZLgKKZVLor/earlCyxIHbRdZTzluDoC4mVqSPBX6cRP4p7m4MoGdOSmZsOhEXAVQ+dsaRtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH7PR11MB6426.namprd11.prod.outlook.com (2603:10b6:510:1f6::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.13; Thu, 14 May
 2026 20:51:05 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9913.009; Thu, 14 May 2026
 20:51:05 +0000
Date: Thu, 14 May 2026 13:51:02 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 7/7] drm/xe/rtp: Implement a structured parser for
 rule matching
Message-ID: <20260514205102.GE3397116@mdroper-desk1.amr.corp.intel.com>
References: <20260430-rtp-rule-parser-v2-0-157e98b4ab51@intel.com>
 <20260430-rtp-rule-parser-v2-7-157e98b4ab51@intel.com>
 <20260513233435.GH2131374@mdroper-desk1.amr.corp.intel.com>
 <87y0hlvj60.fsf@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <87y0hlvj60.fsf@intel.com>
X-ClientProxiedBy: SJ0PR03CA0062.namprd03.prod.outlook.com
 (2603:10b6:a03:331::7) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH7PR11MB6426:EE_
X-MS-Office365-Filtering-Correlation-Id: 977b531c-7b80-4999-6e83-08deb1fa843f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|18002099003|56012099003|22082099003|11063799003|4143699003;
X-Microsoft-Antispam-Message-Info: WXOYNbHhoXF+H+kXfixxnEGeqc2sIoziD3Xp85YCdm6oxYTN7OZMhf3jEfiLPX0xdK4nvIR9G1ABtM8gvHn3hFEOl74dx/Q3NJICv2WtGxBcdKEEBdTfFn4FbvpkkGPdYoQWA6yVVxF0wPF8BAJDS149zWyY39cYCxiZ5iJ8CgGhEu0A4NVpBtS1Na6NJ6vy+b3GPWwLF3uUpDnSC0KGiSUzmywSdYacuVUfASbHdFw7tSQ+rNZVPdi7tx75XBKwYpVkEthPkxyMXArFy7egILdSpWsdEPTbEsdrEIdnX1mW2Wy3AXErUFPSWoumO7zP++kcBBOAwzNER5/xcPaRjowT7MnROX5j9pSLrJuGgpf061goGqDnWwd20mZIldX6p1pqXdkFfnfcPKSirQgUJj8MOW6UjVpHvijATWg0MghjiaSEJc6+1QfOI4mwDB85otZbyvkIZCIOgpYjJn0Ak62E2lHmlKT3GtpUwJqH4kk7qERj7FQVNtGt9FJ1N0n9N6T7WfW8LomzDm/iGGifT8brHwPKDuHbYrruaFgrZ8O+pnbm3/9WYMjIGufWxNQtLein4N0caozFBPo1BPkE5azwzEBVov5eMT99jTfUnqd+TocUBlZydkj5g5y67pmxNKuapvUEb9WecX4M04X0IjMcQ/vx+/5Xf8PhRyrhjHxLVvkcPpuNxNso4KJuz5lk
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(18002099003)(56012099003)(22082099003)(11063799003)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NQiNsT3VqmYEtRtfcl/6ffKqG7X9cBUs2DnfN22M7795+wce1EaKTx87isMm?=
 =?us-ascii?Q?55jMdT84JB6rAfapDE5TZvffHV3ezfZvNK6GmuJjAmWrY0edX10o6/8bONEt?=
 =?us-ascii?Q?eECZs6S1qpMEysEFdiMbObhNUJhGnXyMSAodvcBEymCFz9aJS9IxryrbRFsA?=
 =?us-ascii?Q?a1+ksBxGrSAYPUHhA7kZHpHD6et7wyTCCWHHNkc+jbhP2R8KbCWPSqtTbl1U?=
 =?us-ascii?Q?t+uP9wyY8/b6KaNxvneyAWvU+ztkX3/WccYqgLLpnbNwSRaZ4kVNcymWnquF?=
 =?us-ascii?Q?F8ok7KY5UrAk3SjPISt41Kp2SyHqb0QkxMobSHE+k4W0VlRyU4n3bg7zoayp?=
 =?us-ascii?Q?7wB2iNTYrznkIxLh0HIglnqZ1PGQ3xxopscB5/9btrA3uvDNbd2KPOCwp+9+?=
 =?us-ascii?Q?OYwAwF/tLKJIO8IwUEkVxUUGX++045DIwPt/IOoIG0/qsqWGg1N1ylggug1/?=
 =?us-ascii?Q?oIeu7uyjk1nBuAz7PWjTNcjuhOUn0DspoM6BiUVAXCshoFUbK8Spr6vZYxTY?=
 =?us-ascii?Q?Mh0s0SG4h6NJ0oIlV8XSVOSFAJehcwUwH5ZuM3wdE8oreDso7Wr1AbKHloWJ?=
 =?us-ascii?Q?JxZYOTfIfFs98x2cglb9eHGL01mRTo2IT3UwqhBs1Je0ZD+CoxOG0l4fPIGH?=
 =?us-ascii?Q?uHCgiZn1h6oFDJ7UGYEQn069+UyRuZym+7bacDs96tlVqDeuwH1rEGGLt5f5?=
 =?us-ascii?Q?zh2iJij9KXgPkys7fMasNWTk9Mw6bGlsETHc40w9vEx+uY1j4KGXZPahX3lt?=
 =?us-ascii?Q?fhWTFadRDCbiWZRjX+lXyNcZKS6SvzsdexzSJBmvX4dNv1a9nBzZn0YCCzbQ?=
 =?us-ascii?Q?FPL+1CygesSywpNLdfu654QS9FgPtDBp2T+2OcJKQiLFbLPutSD8RpY24INE?=
 =?us-ascii?Q?QPrhv1YLtg0TnEGsPkSz3qSwsEroZQVdM7pwFNW/Ipeq2TV/v290Pj9Xxum9?=
 =?us-ascii?Q?tWIVRinUfMha8a+/hUikMM8EWjRSAACmm/Nl+GG9CgODg47UL7wDJB62xB5l?=
 =?us-ascii?Q?9BeKreoJdCdAFWzpeYzK/pgXuPTz1tna+VAWyNc4eX3RAuxnOTyPSaRKk8Z0?=
 =?us-ascii?Q?X3q7YfyMB9rStRJOMOeug3tDam/4tSjox5AYqAZyNtyfFkgmACHt0rdZrCat?=
 =?us-ascii?Q?o7aBseEirGNTD1Z2ZF9SJVcSsPJSiibiSSLCsmPMZSW3BogMCcNmw1cwwjWp?=
 =?us-ascii?Q?KwLU4aECZInJ6ykeA8FH/yMH90UQqMLgM/7QTt1d6+jHUDvN30LhhRjA8buL?=
 =?us-ascii?Q?GGIoUTXECXZpqwHkUDbFlAqz4cSNKmAO1KHbYuc1hPWke/4bVBXrdlE7jS6z?=
 =?us-ascii?Q?c69GwckSrmfMNPRETa/cr5Olp3O2w3RjPT9AFSMQFvCJ1fIuaoQGcXld3lCf?=
 =?us-ascii?Q?339WvBtYPyGe8x5053TK24PW5MHm5TboIyD1CdQUirOgD4am+HIJoxJAfRvb?=
 =?us-ascii?Q?28mpnCgrLpI9BhwMF48SIs8eWJ38OSss//FomAgnDVSYQtVZ30BPRm1cf21O?=
 =?us-ascii?Q?LWrVwDsVASQkL35j7+43cCy1F9fQ9iJY7T6Kl1ShbXCdz7jAFTCm3tX1nuSV?=
 =?us-ascii?Q?1IgzoGsRVtSlrRag4i56xabFc0UK+DogLA33Ba/HXyGz7zr5mNdLf2f8Tp/8?=
 =?us-ascii?Q?hA3x+522e1BFO/dPLv4jzSQ/8iJ33a/4Ww/xzNlq/PhUKGIn4UR2MJzej4Kb?=
 =?us-ascii?Q?UImBj4so+wNMs48FeKiV8cV9LUfKexgOZWQ3TjMmz68gwrIHAs96ZS344UNl?=
 =?us-ascii?Q?QuQDHdZQOONAwaK4LaEBwVjva3hnqR8=3D?=
X-Exchange-RoutingPolicyChecked: kwzszPCZgMGiw7Vtx4tfufEvxrh3BtGuhsUvQkG453p+G/oT9excCNe/bKUOFWHo7Q5hTE/Xug73YIkEu/RQUuAv1qhhRIX2BF0TJ+aO9aiBcx+6knfhvEZZEWtbtz/GZD7RYAf9OxCkkfX7gAhsVoUpRkDN5HDvuch/L+HZpmdu19OM3SgNvXYl0KGG2u6LH5WJwUnTXRFd6se6KP1Ahbs4L/j4RcYUR+Wf+qBlBt1qDf+iuHqQ9hL18ISYKS83TKJUFtkHISYRd3bIt5liCD95a33iKjHG7oFMs4mAulRUI7ysNBAbgrXux2bZTFJBFO0lQqL/2Vi7bS/2dc3waw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 977b531c-7b80-4999-6e83-08deb1fa843f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 20:51:05.3534 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +o/Z/8z/I+P76aiqAvCDFeS22pTFAnDR5GEYgmBlLBVRwYvVt4ZpR5OYgZlhLRAMEGcZeD7UeT8Mv+j5UQgQoCrzJShQTIgLKO+AIjdpw7w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6426
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

On Thu, May 14, 2026 at 05:19:03PM -0300, Gustavo Sousa wrote:
> Matt Roper <matthew.d.roper@intel.com> writes:
> 
> > On Thu, Apr 30, 2026 at 05:20:08PM -0300, Gustavo Sousa wrote:
> >> The current unwritten grammar for RTP rules is as follows:
> >> 
> >>           rules = disjunction;
> >>     disjunction = conjunction { "OR" conjunction };
> >>     conjunction = single_rule { single_rule }
> >>                               /* AND operator is implicit */;
> >>     single_rule = ? GRAPHICS_VERSION(...), MEDIA_VERSION(...),
> >>                      FUNC(...), etc ?;
> >
> > We should probably add this grammar BNF to the DOC: section at the top
> > of the file too.  Then it won't be "unwritten" anymore.  :-)
> 
> Cool. It could be on the kernel-doc for XE_RTP_RULES(). Ack on
> incrementing this patch with the following then?

Ack, looks good to me.


Matt

> 
>     diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
>     index 562082b18d7b..2a8e536eaa5d 100644
>     --- a/drivers/gpu/drm/xe/xe_rtp.h
>     +++ b/drivers/gpu/drm/xe/xe_rtp.h
>     @@ -394,18 +394,39 @@ struct xe_reg_sr;
>       * XE_RTP_RULES - Helper to set multiple rules to a struct xe_rtp_entry_sr entry
>       * @...: Rules
>       *
>     - * At least one rule is needed and up to 12 are supported. Multiple rules are
>     - * AND'ed together, i.e. all the rules must evaluate to true for the entry to
>     - * be processed. See XE_RTP_MATCH_* for the possible match rules. Example:
>     + * When an RTP table is being processed, the rules of each entry are evaluated
>     + * to check if they match the target entity (platform, gt or hwe, depending on
>     + * the specific RTP table).
>     + *
>     + * The sequence of arguments of this macro must follow the following eBNF
>     + * grammar::
>     + *
>     + *            rules = disjunction;
>     + *      disjunction = conjunction, { "OR" conjunction };
>     + *      conjunction = single_rule, { single_rule };
>     + *				   (* the AND operator is implicit *)
>     + *      single_rule = ? GRAPHICS_VERSION(...), MEDIA_VERSION(...),
>     + *                      FUNC(...), etc ?
>     + *
>     + * Examples:
>       *
>       * .. code-block:: c
>       *
>       *	const struct xe_rtp_entry_sr wa_entries[] = {
>       *		...
>     - *		{ XE_RTP_NAME("test-entry"),
>     + *		{ XE_RTP_NAME("entry-a"),
>     + *		  // Match DG2-G10 with graphics steppings A0 up-to B0
>     + *		  // (exclusive).
>       *		  XE_RTP_RULES(SUBPLATFORM(DG2, G10), GRAPHICS_STEP(A0, B0)),
>       *		  ...
>       *		},
>     + *		{ XE_RTP_NAME("entry-b"),
>     + *		  // Match graphics version 20 (all steppings) or graphics
>     + *		  // version 30 steppings A0 up-to B0 (exclusive).
>     + *		  XE_RTP_RULES(GRAPHICS_VERSION(2000), OR,
>     + *			       GRAPHICS_VERSION(3000), GRAPHICS_STEP(A0, B0))
>     + *		  ...
>     + *		},
>       *		...
>       *	};
>       */
> 
> --
> Gustavo Sousa
> 
> >
> >> 
> >> While rule_matches() currently works for the grammar above, it doesn't
> >> easily resemble it.  Let's replace it with an implementation that is
> >> structured in a way to resemble the grammar.
> >> 
> >> Such a new implementation, although a bit more verbose, is arguably
> >> easier to reason about and to adapt to any extension we do to the
> >> grammer in the future.
> >> 
> >> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
> >
> > Aside adding the kerneldoc, this looks good to me.  It will definitely
> > make it easier to define and implement additions to the grammar in the
> > future, if necessary.
> >
> >
> > Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
> >
> >> ---
> >>  drivers/gpu/drm/xe/xe_rtp.c | 138 ++++++++++++++++++++++++++++----------------
> >>  1 file changed, 88 insertions(+), 50 deletions(-)
> >> 
> >> diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
> >> index 976a2e1f5592..dec9d94e6fb0 100644
> >> --- a/drivers/gpu/drm/xe/xe_rtp.c
> >> +++ b/drivers/gpu/drm/xe/xe_rtp.c
> >> @@ -30,11 +30,28 @@ static bool has_samedia(const struct xe_device *xe)
> >>  	return xe->info.media_verx100 >= 1300;
> >>  }
> >>  
> >> -static bool rule_match_item(const struct xe_device *xe,
> >> -			    struct xe_gt *gt,
> >> -			    struct xe_hw_engine *hwe,
> >> -			    const struct xe_rtp_rule *r)
> >> +struct rule_match_ctx {
> >> +	const struct xe_device *xe;
> >> +	struct xe_gt *gt;
> >> +	struct xe_hw_engine *hwe;
> >> +	const struct xe_rtp_rule *rules;
> >> +	const unsigned int n_rules;
> >> +	unsigned int head;
> >> +	int err;
> >> +};
> >> +
> >> +static bool rule_is_item(const struct xe_rtp_rule *r)
> >> +{
> >> +	return r->match_type != XE_RTP_MATCH_OR;
> >> +}
> >> +
> >> +static bool rule_match_item(struct rule_match_ctx *match_ctx)
> >>  {
> >> +	const struct xe_device *xe = match_ctx->xe;
> >> +	struct xe_gt *gt = match_ctx->gt;
> >> +	struct xe_hw_engine *hwe = match_ctx->hwe;
> >> +	const struct xe_rtp_rule *r = &match_ctx->rules[match_ctx->head];
> >> +
> >>  	switch (r->match_type) {
> >>  	case XE_RTP_MATCH_PLATFORM:
> >>  		return xe->info.platform == r->platform;
> >> @@ -120,6 +137,63 @@ static bool rule_match_item(const struct xe_device *xe,
> >>  	}
> >>  }
> >>  
> >> +/*
> >> + * Match a conjunctive set of rules (rules joined by an implicit "AND").
> >> + *
> >> + * Once one item evaluates to false, the remaining items are not evaluated
> >> + * anymore.  Nevetheless, all rules are consumed to allow detecting syntax
> >> + * errors.
> >> + */
> >> +static bool rule_match_and(struct rule_match_ctx *match_ctx, bool parse_only)
> >> +{
> >> +	bool match = true;
> >> +	unsigned int count = 0;
> >> +
> >> +	while (match_ctx->head < match_ctx->n_rules &&
> >> +	       rule_is_item(&match_ctx->rules[match_ctx->head])) {
> >> +		if (!parse_only)
> >> +			match = rule_match_item(match_ctx);
> >> +
> >> +		if (!match)
> >> +			parse_only = true;
> >> +
> >> +		match_ctx->head++;
> >> +		count++;
> >> +	}
> >> +
> >> +	if (drm_WARN_ON(&match_ctx->xe->drm, !count)) {
> >> +		match_ctx->err = -EINVAL;
> >> +
> >> +		if (!parse_only)
> >> +			match = false;
> >> +	}
> >> +
> >> +	return match;
> >> +}
> >> +
> >> +/*
> >> + * Match a disjunctive set of rules (subset of rules joined by
> >> + * "XE_RTP_MATCH_OR").
> >> + *
> >> + * Once one subset evaluates to true, the remaining items are not evaluated
> >> + * anymore. Nevetheless, all rules are consumed to allow detecting syntax
> >> + * errors.
> >> + */
> >> +static bool rule_match_or(struct rule_match_ctx *match_ctx)
> >> +{
> >> +	bool match = rule_match_and(match_ctx, false);
> >> +
> >> +	while (match_ctx->head < match_ctx->n_rules &&
> >> +	       match_ctx->rules[match_ctx->head].match_type == XE_RTP_MATCH_OR) {
> >> +		/* Consume XE_RTP_MATCH_OR. */
> >> +		match_ctx->head++;
> >> +
> >> +		match = rule_match_and(match_ctx, match);
> >> +	}
> >> +
> >> +	return match;
> >> +}
> >> +
> >>  static bool rule_matches_with_err(const struct xe_device *xe,
> >>  				  struct xe_gt *gt,
> >>  				  struct xe_hw_engine *hwe,
> >> @@ -127,55 +201,19 @@ static bool rule_matches_with_err(const struct xe_device *xe,
> >>  				  unsigned int n_rules,
> >>  				  int *err)
> >>  {
> >> -	const struct xe_rtp_rule *r;
> >> -	unsigned int i, rcount = 0;
> >> -	bool short_circuit_or = false;
> >> +	struct rule_match_ctx match_ctx = {
> >> +		.xe = xe,
> >> +		.gt = gt,
> >> +		.hwe = hwe,
> >> +		.rules = rules,
> >> +		.n_rules = n_rules,
> >> +	};
> >> +	bool match = rule_match_or(&match_ctx);
> >>  
> >>  	if (err)
> >> -		*err = 0;
> >> -
> >> -	for (r = rules, i = 0; i < n_rules; r = &rules[++i]) {
> >> -		if (r->match_type == XE_RTP_MATCH_OR) {
> >> -			if (drm_WARN_ON(&xe->drm, !rcount)) {
> >> -				if (err)
> >> -					*err = -EINVAL;
> >> -				continue;
> >> -			}
> >> -
> >> -			/*
> >> -			 * This is only reached if a complete conjunction of
> >> -			 * rules passed, in which case we short-circuit rule
> >> -			 * evaluation, but still keep parsing to find any syntax
> >> -			 * errors.
> >> -			 */
> >> -			short_circuit_or = true;
> >> -			rcount = 0;
> >> -			continue;
> >> -		}
> >> -
> >> -		if (short_circuit_or || rule_match_item(xe, gt, hwe, r)) {
> >> -			rcount++;
> >> -		} else {
> >> -			/*
> >> -			 * Advance rules until we find XE_RTP_MATCH_OR to check
> >> -			 * if there's another set of conditions to check
> >> -			 */
> >> -			while (++i < n_rules && rules[i].match_type != XE_RTP_MATCH_OR)
> >> -				;
> >> -
> >> -			if (i >= n_rules)
> >> -				return false;
> >> -
> >> -			rcount = 0;
> >> -		}
> >> -	}
> >> -
> >> -	if (drm_WARN_ON(&xe->drm, !rcount)) {
> >> -		if (err)
> >> -			*err = -EINVAL;
> >> -	}
> >> +		*err = match_ctx.err;
> >>  
> >> -	return short_circuit_or || rcount;
> >> +	return match;
> >>  }
> >>  
> >>  static bool rule_matches(const struct xe_device *xe,
> >> 
> >> -- 
> >> 2.53.0
> >> 
> >
> > -- 
> > Matt Roper
> > Graphics Software Engineer
> > Linux GPU Platform Enablement
> > Intel Corporation

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
