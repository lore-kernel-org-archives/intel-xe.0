Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C98EAC282DE
	for <intel-xe@archiver.kernel.org>; Mon, 10 Mar 2025 17:14:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 792B289F08;
	Mon, 10 Mar 2025 17:14:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iRE1myy3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06E3D89E2A
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Mar 2025 17:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741626892; x=1773162892;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Yb4ckGLLV3sckwrpPR38b+gnoulfo6mvlDiva6BPVZY=;
 b=iRE1myy3F/d2F6A8iWL08VSYh2e8WXSlbqlfTZExg0SH9yPZPIAJq20i
 Cyk5dA3/RPLgv2ekR4o+eW/n+s2+KqBldDsoIIcOPXA2IUerkbXTxJjXP
 cDuNFq6melXKYEGgAVFPf2924KbSJyXv59Yhe7E8ierk8i/XvcLOTMV1y
 sNv2RmeITyyBDavBMdSBUgur8ApEHK/TLQBDUYGUH185U1hcJltQnOsps
 7zFumCCaTDPv3DjW4Nduu0K5uFJBDFXNchNHGXia5lRFxrrTBZpnQ/t2Q
 19+BgTPDdYlWvD9DfZBhY1U2f7mzT20FMMbdila/HXoNCtzzR5IQssuMq w==;
X-CSE-ConnectionGUID: ve0a82vbSVSyZ0If8dT7Zw==
X-CSE-MsgGUID: ZuYNp2ZbT6GoPePZiGSfdg==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="53625136"
X-IronPort-AV: E=Sophos;i="6.14,236,1736841600"; d="scan'208";a="53625136"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2025 10:14:51 -0700
X-CSE-ConnectionGUID: +b2p37UjSrKW97NkReqdlA==
X-CSE-MsgGUID: DIkt5F4kR+Gze4c9lQUpnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,236,1736841600"; d="scan'208";a="120744614"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2025 10:14:51 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 10 Mar 2025 10:14:50 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 10 Mar 2025 10:14:50 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 10 Mar 2025 10:14:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QF7eiDbrT7PJB4I34JRvYf0wj9T+Tm6/iZsiQPfV+S73UF8IO0/PvLIgE5t42N+586iL2DAhasG6iLYyYG5l3gKnNij4Lq9xFw0gyIhT3AuE/VM7DaR/9Y3xHweFyXncGOY0cG0PKJ09zj0LwoW+Kew23XAjaYTDinfvOjqjR9z1YpHVcol8Fb8M64EOBblaFnDJ2FZRmfN9CTp54+Fshg6ybkETKMQQY4PYuFsORVz4w2KuN5TbcsH0jgwPgY+7fDeWhZ4Tb2ojry2CZhVTNh2QMTAEEGcgDKOI7QMjGBKIRe0ED3QdOl7p6D9UV9d9mbXidkxK+QJb5rFiok7fzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g2d0s4pJxUN0kCFaFr2zZlF/9zI+xg94bXnc2E9Bk6E=;
 b=Q0+YWwBAWSPQBwP5qxMWgaF6BdZBUUnlyOMjpDxBNY2TqwrMIM07lBEPWarTvOQjzIm28df9lruOSdbQMk/hvolsid369ZrpjwXtzjJo0iEZZz/SUUqh62JXcjsWQL0N/IV4Z2FnZnMSq9Q+KTX79D6U1mnqlO/0RKcq0B9o0rX0BRXD3eWB9omKnc+IqA/3aLCnKit1EnOdtPprHyWmKFA89aNskgty3jqnUnpKg2EyiFnnOxc/EZKd3vZU4QNxm3KIqpZNr/qqXmciXACaw5oTm9wNv4CLPaIBpybkcnt7uaw4PCMxPEI3SPaHUB5hpVmtLYxOBUWeLeFGTUxbPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB8427.namprd11.prod.outlook.com (2603:10b6:806:373::19)
 by MW3PR11MB4651.namprd11.prod.outlook.com (2603:10b6:303:2c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.26; Mon, 10 Mar
 2025 17:14:07 +0000
Received: from SA1PR11MB8427.namprd11.prod.outlook.com
 ([fe80::b156:b61b:d462:b781]) by SA1PR11MB8427.namprd11.prod.outlook.com
 ([fe80::b156:b61b:d462:b781%4]) with mapi id 15.20.8511.025; Mon, 10 Mar 2025
 17:14:06 +0000
Date: Mon, 10 Mar 2025 13:14:02 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>,
 <anshuman.gupta@intel.com>, <matthew.d.roper@intel.com>
Subject: Re: [PATCH 1/2] RFC drm/xe: Add configfs to enable survivability mode
Message-ID: <Z88d2u0ZLjDEQXTo@intel.com>
References: <20250307142446.1790715-1-riana.tauro@intel.com>
 <20250307142446.1790715-2-riana.tauro@intel.com>
 <txoeuk2zlt4gotrzltt3cjtzf2u4ebsjtjicvtsa4a4iz5o5eo@oqgl43byhdoe>
 <bb979148-ec3d-43c8-b73f-e22476f9a809@intel.com>
 <xgmworhkqvbo3gr6toa54occ7tanxjimgyx43pzoojf3li4wxf@7imyzpy5vurl>
 <7024396b-0356-4723-bc75-4cb6f6a05cd1@intel.com>
 <Z88WB7oI6hwbzteq@intel.com>
 <bc7caow57dfierr7fjyjcu3tanurj7z5zld5tkx4olj4i63x7y@ry364xf5ornr>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bc7caow57dfierr7fjyjcu3tanurj7z5zld5tkx4olj4i63x7y@ry364xf5ornr>
X-ClientProxiedBy: MW4PR03CA0272.namprd03.prod.outlook.com
 (2603:10b6:303:b5::7) To SA1PR11MB8427.namprd11.prod.outlook.com
 (2603:10b6:806:373::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB8427:EE_|MW3PR11MB4651:EE_
X-MS-Office365-Filtering-Correlation-Id: c0a32d87-ca90-4a7f-6398-08dd5ff6f6ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?FJavXB9h7CgoCuNI/n0p148F26ItUzfyzXFoelvYIMJ6mLQo1ai6G09cKU?=
 =?iso-8859-1?Q?+ncV0abXw2XugJ1nw/ETcRwrk0oNCHmEkVo5fP/+9yKt0bWK6zIUzZxa2t?=
 =?iso-8859-1?Q?qao3GD4ADGkeIEaileOsY0wCdbFOzAd5F72OBBnMoH3LMo7Fce8plBFhtS?=
 =?iso-8859-1?Q?uJkC9o3OzSK9Fz1N+OWTOo7rLMqacwI0JM1RWfB2NgUTHqbCLPvfkdc39U?=
 =?iso-8859-1?Q?GlFVSNBRahtX/BVV5YxI1XM6wRYDfL3wGaVukgoTKwnyPgJpGB+7v1K3qz?=
 =?iso-8859-1?Q?NVegq/Nq9FUDb9OnjayPo0SWxnm1kvIirhbdHv2itcuiLkZE3aOHKrwHKd?=
 =?iso-8859-1?Q?DwwlXz/Lf2CJ6V0fB5TlVhlWKKFLNaECkB+MuSYwaAEFjK5MaQc8s9UIBO?=
 =?iso-8859-1?Q?F5COJL0y5CEl6KtjwyGm4AcpktWHaPL6haGLajNoj8T1xVjjwezMWW6oXf?=
 =?iso-8859-1?Q?xpPUIKTshekMusr4iMh0yyY2i6v4JGAxaCB6jMJNUVpla63JQScj/vfK01?=
 =?iso-8859-1?Q?5viZENfNRvfcN17yfCstMIUL915afrOibJEJAv+DjekOjk1xX19EdFpigi?=
 =?iso-8859-1?Q?6JRpEv/ZcEWsSSxcRDGjPtLe8sNDqJEzCovStKmSFyE4RT9Z3VY1Fgim6c?=
 =?iso-8859-1?Q?o/zvR2lwdQ4+NfJSNME6KbnqKeVrZkj+cR/s8z/Y1RD0/YXo9Kaf6wFDt4?=
 =?iso-8859-1?Q?OJEf1Gg7klUBGtPKAnTg13u1Si2E8ABXlKHMggCVZWZ/liH1f62cHgAdg7?=
 =?iso-8859-1?Q?brDGE0Okk69D/85DpLHECNW9MZ0m4L0RHLkz+gdt/P1aDDfLBjbYEPCRKe?=
 =?iso-8859-1?Q?NlBAz/ynCGGN6zRLuhbzVA0FTtZdqMYjmntLcdca7rYz7btKujKT4sUv2c?=
 =?iso-8859-1?Q?V8500l2YGbrrS12Txu5cFZAgZp0oZ4naCg43xwrdH65AVlcJYvDoWQrlaP?=
 =?iso-8859-1?Q?1PfNz80R43Mrpg6BKQZj3YKppKEzecYOZzIgytjYMdBtsd3KhWTxJKBos0?=
 =?iso-8859-1?Q?GPnJEZbyCeeJDybs2AuPIu23r0FuVakNHDpX/Wd1q/Wqd+LrU1ujgZ4YEZ?=
 =?iso-8859-1?Q?v3cFT+bRurSTGDG+i//EKU1ciF7pgkGJKGNzOEDID+Q8U4HMv5NMdh+UVy?=
 =?iso-8859-1?Q?kdWZElBq2/vsoXP6SWvzAIRaWqg0af9SUd3FEvSH6wmeh5pDvjqeTp7r04?=
 =?iso-8859-1?Q?qxGvPvx4X5qprfoRK3OCxaf0N16M54YCV7mqMMVU5wnIExlP8zNsqch0It?=
 =?iso-8859-1?Q?hcUXEgyxxXPkGC5qNHuN+m7mpgLwCQI2x8dC3y8+h99aPbG2kirrunJSxs?=
 =?iso-8859-1?Q?hUwdTmIFjMnzuY0qF4lXQbWIMGgZKuZnfOhXdjsko/W/JSHO8B9IdndVQ9?=
 =?iso-8859-1?Q?kvGsLfWR7mHwv9gFEyXFIKqStbN7wNYYf4ShIWMUe0MU/qdj1GcamD8owU?=
 =?iso-8859-1?Q?CGhaX6ouVr2cB736?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB8427.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?/UjSLcpDnfPbw4sS7iqpWs8qy596FDe9HSkMpZN22eFuu2HjjJYmgGpoat?=
 =?iso-8859-1?Q?w4K2EnFH8jpK8ZCiVTyDzyXrtm0Sn17PbKrlJeUKubXvyAJl5mI/4dUUpv?=
 =?iso-8859-1?Q?YFXD9VtLMPiql3j9Q2IUZejc5LP4AgHQ9ppnz7yJbzfVQiStUx+Ye4AQPg?=
 =?iso-8859-1?Q?2h9vpoOySztgpaTR1eLv3jUKl1Czy32WnwmHEzbPqrurGES+HJG6ic/VWH?=
 =?iso-8859-1?Q?M8pTVp1S55pKCm2j5HyuhxgOlnDOE0qT0Y6Jsw9/ZTLQTq+jDXE4TcB4nP?=
 =?iso-8859-1?Q?Qa6kYvp9/eHInRgIKBylfp8gaqTGs3mheJjTOLbyFTYdpmEQgK9NmihiqM?=
 =?iso-8859-1?Q?7b31kbiTEi2Cm38dK8uYSBdGkVfvTOvlFmWmlsuF8hc/vXPiHxHRkck4Hz?=
 =?iso-8859-1?Q?B62OdyUArKVNwMWMR09lBHnwci0mkJmkAJTeEAXyLrqhYdHeM219ZiaoGD?=
 =?iso-8859-1?Q?ZFUSTp4dG/oib8B3Nn0K9LQQZdbEe0AAz/E024f+WtlewV9MU+9M1uA1Kr?=
 =?iso-8859-1?Q?/2iMJkjGv1SML0HY3wpNoyxK6jRxyktP0BzxHi2oh26d5UUMzpzyle5odg?=
 =?iso-8859-1?Q?XMgBHTthx4NLSmVHW/U3D5wGBtOJT4CsNWSgqNdPLKTluSQdtFX5Z9wPZZ?=
 =?iso-8859-1?Q?x3xN96pt3i9OOYCmtg7bM1fWAinFaQ/p1M3cKJyPeyYOFRqhWd3UWhEcgA?=
 =?iso-8859-1?Q?tuTy21YQ9JEG1/yxQHAmAaJY4/jv71Lo2va4/REAA/1+7N/VDu211PTw2b?=
 =?iso-8859-1?Q?NyFemh5IDizbuRnV1Hce9lrXyjeMH9HsdDcXAbrw557VDS0bPCYUYajtSs?=
 =?iso-8859-1?Q?5Mtp2sPXTdP7OuEq3p4bUlT8vxmf+aFYA3Z4xHPh30j8p7kc6HFq9OwU6+?=
 =?iso-8859-1?Q?IvoGvCFPpL+G/zcpJZiIotXCBcCyA3fo27A4gOlvrePF5jQ/yE2E1msINr?=
 =?iso-8859-1?Q?py9Vrkq6s8Nxsec022zxGLC3zXgY/X16aiMEfGVTUeV0q8bs8IqZjyJ30A?=
 =?iso-8859-1?Q?ahbWUtLjhzSRJknF6QlldfJ2k4Zr+6XHVvwlJ/Fbpft/HaV2r1O1QrHgtv?=
 =?iso-8859-1?Q?bfvEk99xH+5lP2gcgVPPkesoSDqsm5yrahpcB+Q+e0lMODRT//jTVsR7We?=
 =?iso-8859-1?Q?8nOLzMGRf2y13gOw0JxrFUAWSXnCCuWaIotObIEpkofEJyi6ZKNpE1s5fC?=
 =?iso-8859-1?Q?5suHOk9PkZV+gGKOeiB6imLd/E9pzuwbUH+pAVa6TxS5CZPuZ04D3JVrXa?=
 =?iso-8859-1?Q?m7D8JIPW+tihdeYn4vxyfGHTAA38X4gQlUh42agGosITGZkJ6+CT4+5DI8?=
 =?iso-8859-1?Q?+6QxKIGUiA73m1/CqqrLCj8nDqvhTMDhDxJdZAlYsZgV5YHuvMcBbU/Vfa?=
 =?iso-8859-1?Q?JoWl8c7s8Z2/ie4QIG51ZvKDYcsTnof36YyUdKHhMKBc3sQkPVT8zXQTri?=
 =?iso-8859-1?Q?kMHRt2M115+Rzmzx9kvZ173O2aZSZTUH5u7XI4SDXXgHSVbWWkFOs4xRYZ?=
 =?iso-8859-1?Q?FOrtuvTSMBIRWkcooTQzRUQ65WaamYgEZZGfFFVSSG+ud96MDR96qqEGz1?=
 =?iso-8859-1?Q?jZyVGweFeqi783TpF/r3ZszWWdHE2KydX/RryHntQLHJ2jc0FJouRgXRJ4?=
 =?iso-8859-1?Q?PSn/o6pw98idX9CnMHLuQCeKZAvAvW28CCgwURqLGGZe8C8BgQIqsuzw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c0a32d87-ca90-4a7f-6398-08dd5ff6f6ea
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8427.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2025 17:14:06.7886 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bJ6TN19ozu5Rfg5Y8EX13XgobfsX86EVD0f8l8hnXKMqRpu4AnL2qacyXGOIpXohLY28Ot49nFu0T4LRNlKnkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4651
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

On Mon, Mar 10, 2025 at 12:01:55PM -0500, Lucas De Marchi wrote:
> On Mon, Mar 10, 2025 at 12:40:39PM -0400, Rodrigo Vivi wrote:
> > On Mon, Mar 10, 2025 at 07:53:27PM +0530, Riana Tauro wrote:
> > > Hi Lucas
> > > 
> > > On 3/10/2025 7:01 PM, Lucas De Marchi wrote:
> > > > On Mon, Mar 10, 2025 at 11:01:50AM +0530, Riana Tauro wrote:
> > > > > Hi Lucas
> > > > >
> > > > > On 3/7/2025 8:46 PM, Lucas De Marchi wrote:
> > > > > > On Fri, Mar 07, 2025 at 07:54:44PM +0530, Riana Tauro wrote:
> > > > > > > Registers a configfs subsystem called 'xe' to userspace. The user can
> > > > > > > use this to modify exposed attributes.
> > > > > > >
> > > > > > > Add survivability mode attribute (config/xe/survivability_mode) to the
> > > > > > > subsystem to allow the user to specify the card that should enter
> > > > > > > survivability mode.
> > > > > > >
> > > > > > > Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> > > > > > > ---
> > > > > > > drivers/gpu/drm/xe/Makefile      |  1 +
> > > > > > > drivers/gpu/drm/xe/xe_configfs.c | 95 ++++++++++++++++++++++++++++++++
> > > > > > > drivers/gpu/drm/xe/xe_configfs.h | 12 ++++
> > > > > > > drivers/gpu/drm/xe/xe_module.c   |  5 ++
> > > > > > > drivers/gpu/drm/xe/xe_module.h   |  1 +
> > > > > > > 5 files changed, 114 insertions(+)
> > > > > > > create mode 100644 drivers/gpu/drm/xe/xe_configfs.c
> > > > > > > create mode 100644 drivers/gpu/drm/xe/xe_configfs.h
> > > > > > >
> > > > > > > diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> > > > > > > index 9699b08585f7..3f8c87292cee 100644
> > > > > > > --- a/drivers/gpu/drm/xe/Makefile
> > > > > > > +++ b/drivers/gpu/drm/xe/Makefile
> > > > > > > @@ -28,6 +28,7 @@ $(obj)/generated/%_wa_oob.c
> > > > > > > $(obj)/generated/ %_wa_oob.h: $(obj)/xe_gen_wa_oob \
> > > > > > > xe-y += xe_bb.o \
> > > > > > >     xe_bo.o \
> > > > > > >     xe_bo_evict.o \
> > > > > > > +    xe_configfs.o \
> > > > > > >     xe_devcoredump.o \
> > > > > > >     xe_device.o \
> > > > > > >     xe_device_sysfs.o \
> > > > > > > diff --git a/drivers/gpu/drm/xe/xe_configfs.c
> > > > > > > b/drivers/gpu/drm/xe/ xe_configfs.c
> > > > > > > new file mode 100644
> > > > > > > index 000000000000..8c5f248e466d
> > > > > > > --- /dev/null
> > > > > > > +++ b/drivers/gpu/drm/xe/xe_configfs.c
> > > > > > > @@ -0,0 +1,95 @@
> > > > > > > +// SPDX-License-Identifier: MIT
> > > > > > > +/*
> > > > > > > + * Copyright © 2025 Intel Corporation
> > > > > > > + */
> > > > > > > +
> > > > > > > +#include <linux/configfs.h>
> > > > > > > +#include <linux/init.h>
> > > > > > > +#include <linux/module.h>
> > > > > > > +
> > > > > > > +#include "xe_configfs.h"
> > > > > > > +#include "xe_module.h"
> > > > > > > +
> > > > > > > +/**
> > > > > > > + * DOC: Xe Configfs
> > > > > > > + *
> > > > > > > + * XE KMD registers a configfs subsystem called 'xe'to
> > > > > > > userspace that allows users to modify
> > > > > > > + * the exposed attributes.
> > > > > > > + *
> > > > > > > + * Attributes:
> > > > > > > + *
> > > > > > > + * config/xe/survivability_mode : Write only attribute that
> > > > > > > allows user to specify the PCI address
> > > > > > > + *                  of the card that has to enter survivability mode
> > > > > >
> > > > > > I think the desired interface is actually that the user mkdir the bdf in
> > > > > > <configfs>/xe/. This populates the available config entries that
> > > > > > the user
> > > > > > writes to.
> > > > >
> > > > > Initial thought was mkdir bdf, but since it was a single attribute
> > > > > and after a offline discussion with Rodrigo, did a simpler version
> > > > > to get comments on the RFC patch and if configfs is okay to use
> > > > > for survivability mode
> > > >
> > > > I disagree on the conclusion as then you are moving away from how
> > > > configfs is commonly used and also making it harder to add new
> > > > attributes in a uniform way.
> > 
> > My bad, I'm sorry.
> > I might have created the confusion here.
> > 
> > > >
> > > > >
> > > > > For survivability mode, below procedure needs to be followed
> > > > >
> > > > > echo "0000:03:00.0" > /sys/bus/pci/drivers/xe/unbind
> > > > > add bdf for survivability mode
> > > > > echo "0000:03:00.0" > /sys/bus/pci/drivers/xe/bind
> > > > >
> > > > > After the device is removed directory has to be created, the bdf has
> > > > > to be checked if it belongs to xe driver and then attrs populated.
> > > > > Even i think mkdir is better in case other attrs have to be added in
> > > > > future, but for unbind case the check of the driver might be tricky
> > > > > .
> > > >
> > > > I think you are talking about the mkdir in the wrong place. It isn't
> > > > related to unbind at all. The sequence you mentioned is just because we
> > > > lazy and let pci auto probe the driver. Under the hood you are doing:
> > > >
> > > > 1) load the module
> > > > 2) bind the driver
> > > > 3) unbind the driver
> > > > 4) bind the driver in survivability mode
> > > >
> > > > The sequence we should actually have is:
> > > >
> > > > 1) load the module
> > > > 2) bind the driver in survivability mode
> > 
> > No, this doesn't work for the use case we want it.
> > 
> > The goal is to be able to only move one single device to the survivability
> > mode at runtime without disrupting the work that is going on on other devices.
> > So we cannot unload the module and remove the autoprobe.
> 
> where are you seeing the need to remove the module in the above
> sequence?
> 
> See that step 1 is about loading  the module. *If* the module
> was already loaded, then unbinding it would make sense, but it's not a
> required step.

Ah okay. Yeap, in the use case that we have the module is already loaded
and we don't want to disrupt other running GPUs. So let's considered
that module is already loaded at boot and we need to unbind. So we are
in the same page and avoid some confusion here.

so,
1. unbind specific device
2. configfs (create dirs/files needed with the content of the desired pci bus address.)
3. bind specific device (during the bind we check the config against the device it is
   getting probed and move to survivability mode. ignore otherwise and proceed with the probe)

> 
> Lucas De Marchi
> 
> > 
> > > 
> > > This is what i meant.
> > > 
> > > 1) load the module
> > > 2) bind the driver
> > > 3) unbind the driver
> > > 
> > > 4)  mkdir /sys/kernel/config/xe/0000:03:00.0
> > >    echo .... > /sys/kernel/kernel/config/xe/0000:03:00.0/...
> > > 5) bind the driver in survivability mode
> > > 
> > > 
> > > At step 4, when creating directory. The bdf needs to be validated, ie (it
> > > should be pci_dev that xe will probe). i checked the struct pci_dev but
> > > didn't find anything.
> > > Will have to match the device id against supported pci device ids.
> > 
> > I don't believe we need to run any validation. If admin creates a file/directory
> > with invalid address it will be just ignored, no?!
> > 
> > On the probe we only get the directory, file for the pci device we are probing.
> > 
> > > 
> > > Otherwise, there might be wrong non functional bdf directories present based
> > > on what user provides.
> > > 
> > > Thanks
> > > Riana
> > > >
> > > > You shouldn't create any directory when unbinding. It's the user who
> > > > should create it. When **binding** the driver we should check what are
> > > > the extra configuration available and adapt the probe according to that.
> > > >
> > > > For that we have to disable pci driver autoprobe and tweak the
> > > > configfs settings:
> > > >
> > > > 1) echo 0 > /sys/bus/pci/drivers_autoprobe
> > > >     modprobe xe
> > > >
> > > > 2) mkdir /sys/kernel/config/xe/0000:03:00.0
> > > >     echo .... > /sys/kernel/kernel/config/xe/0000:03:00.0/...
> > > >     echo "0000:03:00.0" > /sys/bus/pci/drivers/xe/bind
> > > >
> > > >
> > > > Lucas De Marchi
> > > >
> > > > >
> > > > > The attr is WO and any value can be written, only if the correct bdf
> > > > > is added in the attr then it'll be used on probe to enter
> > > > > survivability mode.The current patch only checks the format and does
> > > > > not check if bdf belongs to xe.
> > > > > >
> > > > > > > + */
> > > > > > > +
> > > > > > > +void xe_configfs_clear_survivability_mode(void)
> > > > > > > +{
> > > > > > > +    kfree(xe_modparam.survivability_mode);
> > > > > > > +    xe_modparam.survivability_mode = NULL;
> > > > > > > +}
> > > > > > > +
> > > > > > > +static ssize_t survivability_mode_store(struct config_item
> > > > > > > *item, const char *page, size_t len)
> > > > > >
> > > > > > once you handle the mkdir mentioned above, this should probably be
> > > > > > a boolean attr like this:
> > > > > >
> > > > > >     drivers/nvme/target/configfs.c:CONFIGFS_ATTR(nvmet_,
> > > > > > param_pi_enable);
> > > > > >
> > > > > > > +{
> > > > > > > +    char *survivability_mode;
> > > > > > > +    int ret;
> > > > > > > +    unsigned int domain, bus, slot, function;
> > > > > > > +
> > > > > > > +    ret = sscanf(page, "%04x:%02x:%02x.%x", &domain, &bus,
> > > > > > > &slot, &function);
> > > > > > > +    if (ret != 4)
> > > > > > > +        return -EINVAL;
> > > > > > > +
> > > > > > > +    survivability_mode = kstrdup(page, GFP_KERNEL);
> > > > > > > +    if (!survivability_mode)
> > > > > > > +        return -ENOMEM;
> > > > > > > +
> > > > > > > +    xe_configfs_clear_survivability_mode();
> > > > > > > +    xe_modparam.survivability_mode = survivability_mode;
> > > > > > > +
> > > > > > > +    return len;
> > > > > > > +}
> > > > > > > +
> > > > > > > +CONFIGFS_ATTR_WO(, survivability_mode);
> > > > > > > +
> > > > > > > +static struct configfs_attribute *xe_configfs_attrs[] = {
> > > > > > > +    &attr_survivability_mode,
> > > > > > > +    NULL,
> > > > > > > +};
> > > > > > > +
> > > > > > > +static const struct config_item_type xe_config_type = {
> > > > > > > +    .ct_attrs    = xe_configfs_attrs,
> > > > > > > +    .ct_owner    = THIS_MODULE,
> > > > > > > +};
> > > > > > > +
> > > > > > > +static struct configfs_subsystem xe_config_subsys = {
> > > > > > > +    .su_group = {
> > > > > > > +        .cg_item = {
> > > > > > > +            .ci_namebuf = "xe",
> > > > > > > +            .ci_type = &xe_config_type,
> > > > > > > +        },
> > > > > > > +    },
> > > > > > > +};
> > > > > > >
> > > > > >
> > > > > > so... it seems you are missing a configfs_group_operations.make_group.
> > > > > >
> > > > > > > +int __init xe_configfs_init(void)
> > > > > > > +{
> > > > > > > +    int ret;
> > > > > > > +
> > > > > > > +    config_group_init(&xe_config_subsys.su_group);
> > > > > > > +    mutex_init(&xe_config_subsys.su_mutex);
> > > > > >
> > > > > > this mutex_init seems odd, but inline with other drivers
> > > > > yeah it is not used anywhere but the sample and other drivers also
> > > > > initialize it
> > > > > >
> > > > > > > +    ret = configfs_register_subsystem(&xe_config_subsys);
> > > > > > > +    if (ret) {
> > > > > > > +        pr_err("Error %d while registering subsystem %s\n",
> > > > > > > +               ret, xe_config_subsys.su_group.cg_item.ci_namebuf);
> > > > > > > +        mutex_destroy(&xe_config_subsys.su_mutex);
> > > > > > > +        return ret;
> > > > > > > +    }
> > > > > > > +
> > > > > > > +    return 0;
> > > > > > > +}
> > > > > > > +
> > > > > > > +void __exit xe_configfs_exit(void)
> > > > > > > +{
> > > > > > > +    xe_configfs_clear_survivability_mode();
> > > > > > > +    configfs_unregister_subsystem(&xe_config_subsys);
> > > > > > > +    mutex_destroy(&xe_config_subsys.su_mutex);
> > > > > > > +}
> > > > > > > +
> > > > > > > diff --git a/drivers/gpu/drm/xe/xe_configfs.h
> > > > > > > b/drivers/gpu/drm/xe/ xe_configfs.h
> > > > > > > new file mode 100644
> > > > > > > index 000000000000..491629a2ca53
> > > > > > > --- /dev/null
> > > > > > > +++ b/drivers/gpu/drm/xe/xe_configfs.h
> > > > > > > @@ -0,0 +1,12 @@
> > > > > > > +/* SPDX-License-Identifier: MIT */
> > > > > > > +/*
> > > > > > > + * Copyright © 2025 Intel Corporation
> > > > > > > + */
> > > > > > > +#ifndef _XE_CONFIGFS_H_
> > > > > > > +#define _XE_CONFIGFS_H_
> > > > > > > +
> > > > > > > +int xe_configfs_init(void);
> > > > > > > +void xe_configfs_exit(void);
> > > > > > > +void xe_configfs_clear_survivability_mode(void);
> > > > > > > +
> > > > > > > +#endif
> > > > > > > diff --git a/drivers/gpu/drm/xe/xe_module.c
> > > > > > > b/drivers/gpu/drm/xe/ xe_module.c
> > > > > > > index 475acdba2b55..15b3cf22193c 100644
> > > > > > > --- a/drivers/gpu/drm/xe/xe_module.c
> > > > > > > +++ b/drivers/gpu/drm/xe/xe_module.c
> > > > > > > @@ -11,6 +11,7 @@
> > > > > > > #include <drm/drm_module.h>
> > > > > > >
> > > > > > > #include "xe_drv.h"
> > > > > > > +#include "xe_configfs.h"
> > > > > > > #include "xe_hw_fence.h"
> > > > > > > #include "xe_pci.h"
> > > > > > > #include "xe_pm.h"
> > > > > > > @@ -91,6 +92,10 @@ static const struct init_funcs init_funcs[] = {
> > > > > > >     {
> > > > > > >         .init = xe_check_nomodeset,
> > > > > > >     },
> > > > > > > +    {
> > > > > > > +        .init = xe_configfs_init,
> > > > > > > +        .exit = xe_configfs_exit,
> > > > > > > +    },
> > > > > > >     {
> > > > > > >         .init = xe_hw_fence_module_init,
> > > > > > >         .exit = xe_hw_fence_module_exit,
> > > > > > > diff --git a/drivers/gpu/drm/xe/xe_module.h
> > > > > > > b/drivers/gpu/drm/xe/ xe_module.h
> > > > > > > index 84339e509c80..c238dbee6bc7 100644
> > > > > > > --- a/drivers/gpu/drm/xe/xe_module.h
> > > > > > > +++ b/drivers/gpu/drm/xe/xe_module.h
> > > > > > > @@ -24,6 +24,7 @@ struct xe_modparam {
> > > > > > > #endif
> > > > > > >     int wedged_mode;
> > > > > > >     u32 svm_notifier_size;
> > > > > > > +    char *survivability_mode;
> > > > > >
> > > > > > drop this.. We want a  config struct in the xe_device. It's actually
> > > > > > allocated by the mkdir in the configs and when we are probing, we should
> > > > > > find the config instace based on pdev and set the pointer xe->configfs
> > > > > > or something like that.
> > > > >
> > > > > Will add a new struct
> > > > >
> > > > > Thanks
> > > > > Riana
> > > > > >
> > > > > > thanks
> > > > > > Lucas De Marchi
> > > > > >
> > > > > > > };
> > > > > > >
> > > > > > > extern struct xe_modparam xe_modparam;
> > > > > > > --
> > > > > > > 2.47.1
> > > > > > >
> > > > >
> > > 
