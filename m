Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42641C4345F
	for <intel-xe@archiver.kernel.org>; Mon, 29 Apr 2024 20:36:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCB5810E969;
	Mon, 29 Apr 2024 20:36:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cputOGLm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 702CD10E969
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Apr 2024 20:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714422984; x=1745958984;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=/FGaYy/NJTrbwxh0wH52Fex17j8ZcVp2l6X/meVXLCM=;
 b=cputOGLmWh5E/J2bdHJSNLzQhedSmWKLfZv1sdVoNIqTcwuaWaYFQNGn
 sHl+6x1+rJqPsD0bLwu1tkEGUx8ndykj8SC4T2sLhTDHnN5KR6jRQwe7k
 z5LeTLMcP7DoS8ft3BQlLRLD7iRnjiuq+r/MEGSo0uv9RUJI3X12lSCjE
 hUypQGrX4HRzn1URcDTfP8FHDGC8uvNkI/Z16rgq4x0M1/wK+mwc4CE09
 Y28qCjnZGF7BlubNEGgq+82MIWzNAi3mMBgJ1qPjGF7ENIsb0pZfdoez3
 9DP9O6uhiSM0E5ZHpdi+ysZzJNQEPaXzcl8mUSUvw+9y63zwIAkNOSLaP Q==;
X-CSE-ConnectionGUID: o0sJm4YISNiRAjFiJmjBlA==
X-CSE-MsgGUID: qS7X4jEtQMOGwV9WNVaXUg==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="9979601"
X-IronPort-AV: E=Sophos;i="6.07,240,1708416000"; 
   d="scan'208";a="9979601"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2024 13:36:23 -0700
X-CSE-ConnectionGUID: H5YGPNlMSp2PAF1q/kx3lA==
X-CSE-MsgGUID: k5ArcnRmRX6H9lW44Qn30g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,240,1708416000"; d="scan'208";a="26318156"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Apr 2024 13:36:23 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 29 Apr 2024 13:36:22 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 29 Apr 2024 13:36:22 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 29 Apr 2024 13:36:22 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.172)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 29 Apr 2024 13:36:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UCq6P43xeZbQgc9b7wsJhp801lJvlptv4isGMJF7JjNr2EgaV0zF8g12AreOspjsnWt5TgeZ+MF2Soh4zj9OEJzQWG/eMZRinm8Xu3oLaAix9AwoNLr739oigm+N2XRoqxd7nkEeWrmXWLKoxsToSY8QaFt6h/WqqlvjzAVHFXGZ7VIbu1F5+pfwcYBaRV1koQcmwcuKCJfHPJrrMyVVqBGoPw1KT1c+Iz8pgHsUBh9KNCm9wgrCW8HW1t0DwozDYlBEwmtINEANxXOgDvhoSxo6HTD5+UTOLRPceiN09wsL58IE2wa+rMtaHCT7NV9gPyCT17ovSI/Yi3chCRG/gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s+ejEbnhVvUXVXTuA+HgtTs/GkxVNoDErKu804VEd8k=;
 b=amc6wj8yqtgEiVJXZx7lccY/HtbeCjtghZNdp7hzeHteE86POcqZJumPbOXNqjT3AjloFE7WRgSLxEQ+M+TkT8FYoXhkxDXwGHIhtcpDKLfYkkKVjPpSzb4D7T6lO/TVgUU9/+3xI598SPqW3RfTG6msVb4Es/mYOcekbrlxBsRZvgOp3MB6NFGz3GQZ9QK3ynrIHoZH/Ik0FhltNQ5O5BJcA86wFonWv0NEt5ATzuEWsneebBcoqxwboYnnmZtjOGEbo/Hv9rp1ci6l26rcpOV6IPzjlKe2As6SpbeuQSzJaK7JHm0M+8n7OYPzGMy9NoEmwJQ/EZ2XkUh4sLNqJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SN7PR11MB8284.namprd11.prod.outlook.com (2603:10b6:806:268::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.34; Mon, 29 Apr
 2024 20:36:14 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7519.031; Mon, 29 Apr 2024
 20:36:14 +0000
Date: Mon, 29 Apr 2024 20:36:04 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>, <vinay.belgaumkar@intel.com>,
 <michal.winiarski@intel.com>
Subject: Re: [PATCH 1/5] drm/xe: Drop __engine_mask
Message-ID: <ZjAEtBb/P1kDQzeI@DUT025-TGLU.fm.intel.com>
References: <20240425182410.2705061-1-lucas.demarchi@intel.com>
 <20240425182410.2705061-2-lucas.demarchi@intel.com>
 <ZjADLvXstooUQk58@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZjADLvXstooUQk58@intel.com>
X-ClientProxiedBy: BY5PR13CA0011.namprd13.prod.outlook.com
 (2603:10b6:a03:180::24) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SN7PR11MB8284:EE_
X-MS-Office365-Filtering-Correlation-Id: d3716b4b-a979-4dd6-07ed-08dc688c03a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?RGvED977XWpRJ6k0wNxoXNFXfcIz6pJDvSAt93L3j0UGYrORSQR4YBtDDCB2?=
 =?us-ascii?Q?ifuLHbX7zvpJCY4BaMI9Y0oC7uETIKsPzqXdDPhiIjx84y5YihnYdrieK7kC?=
 =?us-ascii?Q?bHkLTxhN0oeDpbRF7ZpZBtNoatJMjhVdUE3+rDuF2kQCDKQpbQpbNTiPU4El?=
 =?us-ascii?Q?xYtxzbRYvRcktU7nut2e4Q5X7UWxpRvYRpOyyFzNAhaM2us8elJtvwrxELTK?=
 =?us-ascii?Q?HC06Dv1muAqrwf73PsStHoxvqhKpSt+iRX4GeZBF1+00pTDzq2EfkTC8MwAd?=
 =?us-ascii?Q?5xAkC8pi8+4HCbXs9UACKr2LruYdW6Eo57AiU5GEW6I9lapHN8kptJ7r1755?=
 =?us-ascii?Q?OzXC6/9pKOrw1qdwm8JDMt+4P45oTgpccWEuRA+OpeobmmwFQ2pcPH+JmNWc?=
 =?us-ascii?Q?7zPGIVXFv2+lyMgr+O8rCOGA13ZeYMvwLAIqIATtGOR9y230EiwHXFfrx32I?=
 =?us-ascii?Q?RfjHHDefGm/qjGm+fEXh2Vi+Kx3bmtIyG2A0vhtZKLMRDIq5WrwQM5j8ptV9?=
 =?us-ascii?Q?PPZKzrd9LdWSkbMo3FJgAUmx2/LWfTW5FjTbMNj0uWF0/Q9eDmpFtkKWBr8G?=
 =?us-ascii?Q?IKYQFNJa+GzPafNdh4V3psrQVwgBHMUxU+jtUn+fmcP3//7T2JSsMLV0JLlM?=
 =?us-ascii?Q?zKpLJ4fONJpPOGl2heleUC6rPFLMqJqTlb3Fdqdy+v1kzbEjEV1OylKxg/S0?=
 =?us-ascii?Q?n21kSqiqJ3PotmDiqBfkETARIbZnhV7aVM3i1wYL8QlEeylnSOh0qWzCvpqF?=
 =?us-ascii?Q?niA5IijecgDWTHBxJfNd6/1jMoXb8ErTRfcRYQLmky4Nb5N2Bn/+TzlJJrO8?=
 =?us-ascii?Q?l6Bg4zUWevvBE7wv4d0bWRtcgJEvWjwlaQDjUlluYp+jADumUCRkZWVfrBzL?=
 =?us-ascii?Q?TGf6UXvZ15QAI3NrLd8MgWY1kxQXBKG4OSByF73fi81BSS9PlT+Am0Vm2IfF?=
 =?us-ascii?Q?YerlbTlHVbr8tciUBdQNlDnTI0/gQUEHbLGqqZ9R+N1TCafjI0lBmaMMY1Hi?=
 =?us-ascii?Q?xsCXzbwI2fjB3l/TAbAwedeJmxUOuBUxrep2C0Ka8hqazr4I3rpfqOVaxxgw?=
 =?us-ascii?Q?YyU4EgaJfiJrkhzPNvlW2SN0RHUvtoegEquvD6l6y106XgnG9hWqyJ9B19sF?=
 =?us-ascii?Q?eimbmj1fD/W7ersOxTYLSEcq/ls5AIGFr9vu/mqIRWRXY8+9FFKZdrvPQKBS?=
 =?us-ascii?Q?OeLlHsm0RLhXoeO7toZlRVZiKYGFrmyblgmU9qKnjfNI5X43pzUMF1Uc5kj/?=
 =?us-ascii?Q?Twv1Ds0c0V018KuLmSPU9iNCFUHXlF7DHdA/UkbiLA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SuCTdnEu+t5CZKoE0XEoF+R+nUS8+kHyI5fSSbGGxONScGfqC0rETGmErpsE?=
 =?us-ascii?Q?SUuiQeKKSQmwiImmIu2DA5KKtzT1HgBmMFoeLZKet4dOoArwTTmJr/EroBCQ?=
 =?us-ascii?Q?9H1pOao/m53qSz1URvV70cQ+Z/zhFD+yFYAu4KPW/krS0s5gmrEXj7reFlzd?=
 =?us-ascii?Q?dDu8Q/4nCRycFni65ZPqLwnqEZ7RSDBQsggGhULaRa3SREzF3BBn3CvHeX2a?=
 =?us-ascii?Q?EvthEeokK76MEs/DazormiEi4IdSZUCqOPrCY7LGykMVd40X3oNJ0A2ZDqK6?=
 =?us-ascii?Q?hkR/lJqC8sy2sBdNZC9ssGIAfEhUvbRxlNPMuUEVuEaUU+FCQ20Fg/VPs/iD?=
 =?us-ascii?Q?z4XLHmuZvRmoauEybh93JOrSJ89ErABDd8TmRhPRek4LaSBXl8Izt/+27PxH?=
 =?us-ascii?Q?HU3efaRGTwRtiQx0pnV4FpL0IDfO+kvKJKeVy/LIhkvdOFQ5HXBaCza/mLaK?=
 =?us-ascii?Q?7OtSXyIlAcWi3Sw0Efcb47CjvFbVXaE6ViIoABXq/txcCRjmg2TuiRjWePu6?=
 =?us-ascii?Q?rdltTU1WeB9B0QCjUlbbEkamyPQKqXnJ0+aFw2qgX6QMyM4auwxRGUQuJGdm?=
 =?us-ascii?Q?Q9jLPhOiKx//n0eSF/gjoioAya1S1liXkB9+GknYo5gAtcUV4ReQCk4Lkv6r?=
 =?us-ascii?Q?rtIJ8H9+Vl23omXjHP7dlyCO3CmCM+t3SuwhIoKy6VcMUbVJXgGfDOaA+MIF?=
 =?us-ascii?Q?cpnCo5SXIgpQ1OZDhj4YxVFMgVJBPfFU6ppfxup5WCImzqwrakgczT3uii2F?=
 =?us-ascii?Q?sxDoMsuHDhl5aBjSoj0hwuvjxpAy4LqIAXRO7Rc7esmuBcmYjL0Zt0ynbc/z?=
 =?us-ascii?Q?TPhLkNOnRVZ+gNWv1WDnqeKbWQP7ZbXEGYtVnCTEY4SnoqHMvMQeiVPyCcov?=
 =?us-ascii?Q?dC75uc002PbQLlL4lBw6fh9FUB58pjzgwzPnIzXMMqzZrqwPltzTlsEWtFkX?=
 =?us-ascii?Q?3nPzWxIBeyHaoCWeinKtzNScZRTF07+L3rw/zQ9C4kAZ3Ia2eRiEkgPwZMcF?=
 =?us-ascii?Q?qf4JzqS1sefGvO1jHgJQnzWAPxKqKRUUCCFT4XSQLPe77AuMAo1eb/kWpQEz?=
 =?us-ascii?Q?9T4Dvm/D88x8Wt5kYSPom5FGHX/EVpWa/eJEegw7mU+H7LNFgnxTfCF6rCbz?=
 =?us-ascii?Q?M885fV8Gdo4L4F9XxrhfBXR/dCKQybOCzus6pTJvYdbtzO7W0MMr3bRvJzZI?=
 =?us-ascii?Q?jYlASqYz7JQjc9/goHWn2Pg1pSN7I76uV0bwHcEMk3nwLq1q3Ok6HDwdy02n?=
 =?us-ascii?Q?f8sw3+3Xj6PpMTCKYq4WgNqimeVd8UjkTCMdnn2OnsqJmRMVPhxkUtofQR3H?=
 =?us-ascii?Q?3MOw0JtGMyW5UAsUmSeYN2c354ZrZrHFMwGkkAsyUl+Y3XCLf+/y0HW7cNot?=
 =?us-ascii?Q?1LM+dQ6mdgGbofBmJ2XeM6b6RMVelrCHBN67J0yskhqDpKhsJ1tsI0DJefm+?=
 =?us-ascii?Q?/2XRnJ8QN+M+Nkf2eNtNBbIiglUk+DUcBDIiSUTDgE7kD4/aBjfe3PiKVcAP?=
 =?us-ascii?Q?vLKoEzbz2Acp2i6CyWxMNieWH+7UvyjyipAHCT0HxvPlDAZ8wyhF33kXQBkt?=
 =?us-ascii?Q?JTQHVN2z6GmQzQrjd0PfuRyM+Xg0QWfpEwFJ3Z1O5CKjZWNyWGE+dARrbGuc?=
 =?us-ascii?Q?sQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d3716b4b-a979-4dd6-07ed-08dc688c03a9
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2024 20:36:14.7141 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QKJ/APkRt5QDtrEG42yoxaa00d5RJBNsMT1eb5W2vZK+qROdf4QEiOzaM8XgIWpBnd9gM2A/+QXi4nC/RGzBLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8284
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

On Mon, Apr 29, 2024 at 04:29:34PM -0400, Rodrigo Vivi wrote:
> On Thu, Apr 25, 2024 at 11:24:06AM -0700, Lucas De Marchi wrote:
> > Not really used, it's just a copy of engine_mask, which already reads
> > the fuses to mark engines as available/not-available.
> 
> I got confused trying to understand why this ever existed.
> It indeed doesn't make much sense on today's code.
> 

That was my doing with the intent that we never use the engine mask
until after hwconfig load as the engine mask would be read from that. Or
alternatively in SRIOV via CTB (or MMIO) relays.

i.e. it was fake way to enforce correct load ordering.

Assuming fuses are read after this removed LoC, the load ordering is
correct.

Matt

> > 
> > While at it, use XE_HW_ENGINE_BCS_MASK to span all copy engines.
> > 
> > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> 
> 
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 
> 
> > ---
> >  drivers/gpu/drm/xe/xe_gt.c       | 3 ---
> >  drivers/gpu/drm/xe/xe_gt_types.h | 6 ------
> >  drivers/gpu/drm/xe/xe_migrate.c  | 3 +--
> >  drivers/gpu/drm/xe/xe_pci.c      | 6 +++---
> >  4 files changed, 4 insertions(+), 14 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> > index e922e77f5010..00a22cf2f5b5 100644
> > --- a/drivers/gpu/drm/xe/xe_gt.c
> > +++ b/drivers/gpu/drm/xe/xe_gt.c
> > @@ -515,9 +515,6 @@ int xe_gt_init_hwconfig(struct xe_gt *gt)
> >  	if (err)
> >  		goto out_fw;
> >  
> > -	/* XXX: Fake that we pull the engine mask from hwconfig blob */
> > -	gt->info.engine_mask = gt->info.__engine_mask;
> > -
> >  out_fw:
> >  	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
> >  out:
> > diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> > index cfdc761ff7f4..72568414fb7d 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_types.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> > @@ -116,12 +116,6 @@ struct xe_gt {
> >  		u32 reference_clock;
> >  		/** @info.engine_mask: mask of engines present on GT */
> >  		u64 engine_mask;
> > -		/**
> > -		 * @info.__engine_mask: mask of engines present on GT read from
> > -		 * xe_pci.c, used to fake reading the engine_mask from the
> > -		 * hwconfig blob.
> > -		 */
> > -		u64 __engine_mask;
> >  		/** @info.gmdid: raw GMD_ID value from hardware */
> >  		u32 gmdid;
> >  	} info;
> > diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> > index 9f6e9b7f11c8..59a3f24d31e6 100644
> > --- a/drivers/gpu/drm/xe/xe_migrate.c
> > +++ b/drivers/gpu/drm/xe/xe_migrate.c
> > @@ -936,8 +936,7 @@ static bool has_service_copy_support(struct xe_gt *gt)
> >  	 * all of the actual service copy engines (BCS1-BCS8) have been fused
> >  	 * off.
> >  	 */
> > -	return gt->info.__engine_mask & GENMASK(XE_HW_ENGINE_BCS8,
> > -						XE_HW_ENGINE_BCS1);
> > +	return gt->info.engine_mask & XE_HW_ENGINE_BCS_MASK;
> >  }
> >  
> >  static u32 emit_clear_cmd_len(struct xe_gt *gt)
> > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> > index a0cf5dd803c2..6b2086ea24ab 100644
> > --- a/drivers/gpu/drm/xe/xe_pci.c
> > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > @@ -656,9 +656,9 @@ static int xe_info_init(struct xe_device *xe,
> >  		gt = tile->primary_gt;
> >  		gt->info.id = xe->info.gt_count++;
> >  		gt->info.type = XE_GT_TYPE_MAIN;
> > -		gt->info.__engine_mask = graphics_desc->hw_engine_mask;
> > +		gt->info.engine_mask = graphics_desc->hw_engine_mask;
> >  		if (MEDIA_VER(xe) < 13 && media_desc)
> > -			gt->info.__engine_mask |= media_desc->hw_engine_mask;
> > +			gt->info.engine_mask |= media_desc->hw_engine_mask;
> >  
> >  		if (MEDIA_VER(xe) < 13 || !media_desc)
> >  			continue;
> > @@ -673,7 +673,7 @@ static int xe_info_init(struct xe_device *xe,
> >  
> >  		gt = tile->media_gt;
> >  		gt->info.type = XE_GT_TYPE_MEDIA;
> > -		gt->info.__engine_mask = media_desc->hw_engine_mask;
> > +		gt->info.engine_mask = media_desc->hw_engine_mask;
> >  		gt->mmio.adj_offset = MEDIA_GT_GSI_OFFSET;
> >  		gt->mmio.adj_limit = MEDIA_GT_GSI_LENGTH;
> >  
> > -- 
> > 2.43.0
> > 
