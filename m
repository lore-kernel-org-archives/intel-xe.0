Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04E0EC55838
	for <intel-xe@archiver.kernel.org>; Wed,  5 Aug 2026 01:39:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B434B10E122;
	Wed,  5 Aug 2026 01:39:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C6R6MLVu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BED5410E122
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Aug 2026 01:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785893971; x=1817429971;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=kSJPy4p6vFkzCLKyzDbmJ8L6WBD87ru6q1QnhWVPcMo=;
 b=C6R6MLVun3PiRDSVOfODFzYVOMBaRtfF3CYOg1NazmcA2as4VDp0Lwv0
 9UbI7mmvP0gBFe+BkTq2JvEkoDPudg4eSSflOvBLnp323xIQI+7c3M0qB
 UpihSRDHlokCuEDWYVp2Wlp2v2ujMvvyrMYrMdS3nhNVQm8rk/kV5hjYj
 9JbACMK/3tN2LnQyPGZBRTV6ZUfHupCCG5Byq5jQ578EhVf4KGGDUJXfQ
 +K7k36neaaIhcuXrEv5H0yR7ghAEBjAz6AHlP9jhzTuWaFdWmaF7fyFtz
 EYy8MEUs4buEJqOqIBpl6O9Bii929Fcpc27S/ZUIC0KJsUOGdqAQIk9YL g==;
X-CSE-ConnectionGUID: Ud+LS+7KTJactnVBil8Dgg==
X-CSE-MsgGUID: o8nxLmeMSg+LHPrykDwiAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="86336018"
X-IronPort-AV: E=Sophos;i="6.25,205,1779174000"; d="scan'208";a="86336018"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2026 18:39:29 -0700
X-CSE-ConnectionGUID: kbQzaCueSEybGFl0HSNe0g==
X-CSE-MsgGUID: OdlUOOveThWw99dFHXzWTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,205,1779174000"; d="scan'208";a="265909451"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2026 18:39:29 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 4 Aug 2026 18:39:27 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 4 Aug 2026 18:39:27 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.57) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 4 Aug 2026 18:39:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HTxDSY/LzTJVSbSnYLucOPrYHPEnY/8dncSO3QveqfoJ+Sl/7chHkpib+qhXtLGP6FpJchAJU4MHGQPwRi2FMJIPSzY/KaVV0Ds58FWoC+YnWSDv3xBvAUQkJQ/zxz4bt4R8qexsgNEIjorIhShWeczs3g7H1XU88p75i1lfPmpvFMfv/QbC+ujrQyeLja22uuETaJY0ge2MtOn28yeu60YtLEsg9P1UCw0Cj0mKHEtJBwipWquszDBxn4VFeZWgtgMBTZg/wKkOT5xUygIBl62OLemruMPqi9Z5nm5QRMtA11dvvG2r21vbEWOa6zQOUh2+vjPh3GldUjHe1pRbDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1uD1yPX6fBGwJum9w6H+WLJAjGEZs45RUpIth8SSYWI=;
 b=v04xH811xQv7tBTfZBRZk0UFFDRFE1oPKCvsH4DnRUuMxW9kVUT06C9f0YPO6DLOPjJmHizbyaud64OoMR3q13naJXHiWQ31q7gpUXD9Xb95/cs4z3csYMs4R0Jq0kHQPxSULMFcgHtEPJTonOc84KDcNAzpXBQn/KZYSPIBxNJoSb00EhY+bqC+vVRrG6PlBVVYA6Y10dsbIm/n1zRs127jYgioRbxIpKtUbNJexUlsMPTPnn6XHrtqGxj4NOOiI9k44lt9X983duKIcxO1Caf3AzfcpP5yBO6AiBuJ+1kBwsp5Gv9xdcgqts2Sy3uZz99dyKYDGaE8eeNRwJtsKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5073.namprd11.prod.outlook.com (2603:10b6:303:92::23)
 by PH0PR11MB9727.namprd11.prod.outlook.com (2603:10b6:510:399::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.15; Wed, 5 Aug
 2026 01:39:26 +0000
Received: from CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe]) by CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe%7]) with mapi id 15.21.0292.013; Wed, 5 Aug 2026
 01:39:26 +0000
Date: Tue, 4 Aug 2026 21:39:22 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Wajdeczko, Michal" <michal.wajdeczko@intel.com>, "Tauro, Riana"
 <riana.tauro@intel.com>, "Koujalagi, Mallesh" <mallesh.koujalagi@intel.com>,
 "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>, "Jadav, Raag"
 <raag.jadav@intel.com>, "Levitt, Yoni" <yoni.levitt@intel.com>
Subject: Re: [PATCH v3 02/23] drm/xe/log: Add structured SIGID error logging
 infrastructure
Message-ID: <anKUSnKhfb6qcocj@intel.com>
References: <20260730152121.576-1-michal.wajdeczko@intel.com>
 <20260730152121.576-3-michal.wajdeczko@intel.com>
 <522ab2835b03dcd101d52fb752b3fb839ed0c15c.camel@intel.com>
 <547b7d1b3a27baf19d7cfbe18fa43a95261f1396.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <547b7d1b3a27baf19d7cfbe18fa43a95261f1396.camel@intel.com>
X-ClientProxiedBy: BY5PR03CA0028.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::38) To CO1PR11MB5073.namprd11.prod.outlook.com
 (2603:10b6:303:92::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5073:EE_|PH0PR11MB9727:EE_
X-MS-Office365-Filtering-Correlation-Id: fa376b10-c81d-4fda-813b-08def2926223
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|1800799024|376014|56012099006|4143699003|5023799004|3023799007|11063799006|10067099003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: tyewmz5Qrq8oQEcWHb8RPehSJgGQXoAHOv5nLV7rWMBAGjhsghdwULK/YFwC8kg6E9gDEtf+jiLVmazIWd03s8FargObFE8EnaY7YJqe97SUZHJJq7n8kcDEBBs6K9NQGGc/0Lb9whR2a7YTJyZ38G5VTMjwuB5xXFHDC2sHfM/IqYcsMKugOIYfOcBOSXN1OYm5sR6n8/hTkVywzNYcVWOeg0OPYlLgEbHNKcNs4N2xOdDJU/jFe3/YZNzN+kOwLdCK7gPwVHxGSiHquF3nY7zUaBZmkSspdrik+Fw0PBcGnYaho6Qg1GUaEoDIc16df6ko41h9kSe4NTvdZZ1SpeQ1k2Xx7GNb7BcEKaefyJ2tmkEpUJiErfdyS3UH50+p/Mj4jJzjGFGpDYvK5VeFt8J1mQyBe1ycgD5u0KqsKLzfP4pybPxPUTpc3g+LO+hfE7aYUOdHSyGmmxgRRLLDPcVyZmDEApI9OkxWOwShnRKTFIujjiHkxzA7DKqCxS/p4g5PeeAVs2Im0+FgIYVzBl+1ZLd2dt8kWIdJVrLfiZG2uiW9O1X2kAj7QBqIYzT0oSF2X92CyTLyOWxSdfcEnXHb0XrGK6WqREHY7K6kp4gAZF0T/2HkNERo1eS9ZpQRVqLT5u0eg8Z53HmFbbb5ztWaoZgiB4/H/eGclRE+prU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5073.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(56012099006)(4143699003)(5023799004)(3023799007)(11063799006)(10067099003)(6133799003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?qtZghANZ86YNYL8FORUEdhQqVGEuQgG1NMicR/zsXACZbjNHXEj7At60MY?=
 =?iso-8859-1?Q?a9ETbKAy9EAnYcco+6GL5cMhpQKsQNIiAjJZBUL4x4/WApxAMCa7O3KNBn?=
 =?iso-8859-1?Q?NPVGMga+t1uIgohqRYuli5rWYQVPsLv3NQjc7rPo4ME5dvln7u3akbexgK?=
 =?iso-8859-1?Q?z3pJIm+fB/s0/iVKVmxvGsKZpOcRJwTS6v3rsYRvFNnfb30TQVL4TCgGge?=
 =?iso-8859-1?Q?wx3LKyOkLoGkg8TJRxtl+rBdhKvyadwv4+pEKsY1BEwWDvrFv2gseiROaz?=
 =?iso-8859-1?Q?789uJOVQgdFUqjno5/1Xwzu49uoDIeVn83BEiAV2GCz0MW6s5bHTUe3EQp?=
 =?iso-8859-1?Q?dxjzafJydKMzb+lm6wy1Q8SJA7U2+cpLKxSvHm+sdaHlCly4Mg59jJWwDs?=
 =?iso-8859-1?Q?LYsnPlbz2WOdWtuUb6q4FMm2e6xvdEasOs+9V915pslmRvTxqlVbEOfU28?=
 =?iso-8859-1?Q?dese6YMJViJuHTaAbYd6pFUBVD1h8kfa8VCZBNv8Gr1mt2FibwWqB7Duy7?=
 =?iso-8859-1?Q?CN8X070eOCI6x01wanykGkuoNU6DPhE9DfsOuDRtoiTuY1CF58i2fedOO6?=
 =?iso-8859-1?Q?ud46M8ZmnN81DpHHfLAvK0DfMMO+1NjIOnXcGdPWU4hS/Nsd5GcdLmGGIi?=
 =?iso-8859-1?Q?53YoVOLg+JqjP758AnzKxOHDLR5UWm/1k0edYxLW2fjk6OCenwuWeqKu/8?=
 =?iso-8859-1?Q?8CzLC0sFwOzjvrtywOAQTo06Wsec94be3rsjvUJpWgIoNPcufCOT/6AbWW?=
 =?iso-8859-1?Q?DqgE70HBfRHLre//12CPCNzmADBOU1LUqnUg9RAnWU7Z0uXD2GZfZOYd1W?=
 =?iso-8859-1?Q?UCAeF8sdDPWE05mVLaZFKwx/+zLoKRzGWUTVQyOUiESfTiN+v/oAzwm/Mn?=
 =?iso-8859-1?Q?UB4R41bcu2sjFIzuOXYzJxkv94Oce3tsPmUDRWwxPREKmu46ts47DfUtJ3?=
 =?iso-8859-1?Q?rl/1JCMp9+ZuPLfokrKkkg2WqvJB5nYXkULm1HSqqsZYnUlp28yasM9rnr?=
 =?iso-8859-1?Q?IatswEdv8oaKS/Y2No5cxWQhjgUkRT32D5aOj+QC8T7b/hODSaCJNhLK3N?=
 =?iso-8859-1?Q?59YmTq2eU4fZnKsq8fFVWAISwbXogmxt9rGfjtNDRt/uL+QMu9Mt+jVvjm?=
 =?iso-8859-1?Q?xRKq4qMi1PgO1DVvUeAqH+penEoCB79eLlLwOCEzklK3Gv+3WoFDaGac/u?=
 =?iso-8859-1?Q?LEaol58dPawN1A+vwgWv/N1d2Xk9GmdwE67No3j609aCe9C8ghffNel8u/?=
 =?iso-8859-1?Q?/1+2M+633yvOtmDUDw+HGkEew9cwdBpqno1M8yfNLVHAKuA0kUuekRIYqs?=
 =?iso-8859-1?Q?kGHTahODJ4SHl+dzp7+mJE+RJ+V3cUx5bCp15MuOe9djstqjqudGQ7IfhE?=
 =?iso-8859-1?Q?Iwj8UCOnFPnpsVQWoa4mGcde3UG6vwB4RGn8AujvdwN0QF0y0VIo8Vaw18?=
 =?iso-8859-1?Q?jai/aIMFYh42RcNT86IFtROr1H5E6tOC13J99wnD4JcFPlO457xncCIqN7?=
 =?iso-8859-1?Q?/NT2xwkaMARfwi2u3Ucp/GLR6jJJAz2i02eDkss/0e1iuI768PhY4yUPtv?=
 =?iso-8859-1?Q?9vlyUyRYYOwUBwh4QkEN9LErs2mGGHp3n9eEw1k/M+R9q3TyO6TvRZqitI?=
 =?iso-8859-1?Q?OEZM59Lqzp+RJUlrjJv3JAKBiasq6WLkQSBNhoDOMbCTCRbGeug6BnPN4i?=
 =?iso-8859-1?Q?o6ijgNTVSvP/OsoqQuewZCibK7CTZ8CB46ozYQ/tHKbLe33qpUKt2AF2BT?=
 =?iso-8859-1?Q?ik9rq1PdxF1ZwZ+8Q1lTtt3UMnR4hZe/SrGNGyizu0ILuoW5kPSlvCKCOF?=
 =?iso-8859-1?Q?VWMfYrLfIw=3D=3D?=
X-Exchange-RoutingPolicyChecked: Wv362c+JoYYg1r7dz/CWmVfRvVTgJVz1X3ZemEdER64okWYnSbkP1Klh43dZ92NOuO3C7zkv2ErLRXYMSdSGES0QBjxoz2FmbByRC8v91ogroOvjX9GMB6xdWBgg71UDF/vEVL7Cqzow+wYWt3hl/VIfmqRDfeJo6yOVvhRo9dxbOo97BmL1mJeDj8vCDdJKKT6xj2lzXaO3G/1pd/gMeFRF0Lxe4Kcuib39JEhSgIEMi2V9KnNbW3UVTx7l6n4L+TzeS1aUmOx1cqPvYCWD77T/CviTddiWcoDTafG34kILn4z+FxMTQMdALisXkbTLZ7RyAsZBW6H2O0MtX6nc5g==
X-MS-Exchange-CrossTenant-Network-Message-Id: fa376b10-c81d-4fda-813b-08def2926223
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5073.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 01:39:26.2098 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AXUa1PEJh746eLDhqMAjjrPuIPtMRRDmr/xnVoqVzYFwuujsrcoM0Wkk20AIhTre11+qrarRIq/agxeqY+pV4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB9727
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

On Tue, Aug 04, 2026 at 05:22:29PM -0400, Summers, Stuart wrote:
> On Tue, 2026-08-04 at 21:21 +0000, Summers, Stuart wrote:
> > On Thu, 2026-07-30 at 17:20 +0200, Michal Wajdeczko wrote:
> > > From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> > > 
> > > Today the driver reports faults with ad-hoc drm_err()/xe_gt_err()
> > > strings that have no stable shape. That is readable for a human,
> > > but
> > > it
> > > gives fleet tooling nothing durable to match on: the wording
> > > changes
> > > between releases, lines can be rate-limited or dropped under an
> > > error
> > > storm, and there is no consistent way to ask "which recognised
> > > fault
> > > just happened?".
> > > 
> > > Introduce a signature identifier (SIGID): a small, stable integer
> > > that
> > > names one recognised Xe fault situation and serves as the primary
> > > handle
> > > for triage. A SIGID maps, through published end-user documentation,
> > > to a
> > > description and a recommended action; the driver only has to emit
> > > the
> > > right SIGID next to the usual human-readable text.
> > 
> > I'm a little worried we're introducing some ABI with this that isn't
> > really maintainable in the long term: we might decide to change the
> > flow or change the way an error is reported or the situation that
> > triggers this error from firmware or hardware might change for some
> > reason. Does this lock us into a solution for all of this? I still
> > need
> > to go through the full patch series...
> > 
> > The dmesg entries are generally for human debuggability. I get the
> > desire to make these easier to parse for an AI tool or generated
> > script, but we also don't want to prevent debug related changes for
> > error handling and reporting.
> 
> Also, should we be implementing something like this more generically
> across DRM or even outside of DRM and then having device-specific error
> conditions within a particular range?

I doubt that this will be useful outside of our Intel GPU.
Also, other subsystem and drivers have different needs for this
problem and no good broad idea.

Take a look to the cases Jani pointed out:
https://lore.kernel.org/intel-xe/amqhoFzQaf1HsuFq@intel.com/

> 
> Thanks,
> Stuart
> 
> > 
> > Thanks,
> > Stuart
> > 
> > > 
> > > Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> > > Assisted-by: Copilot:Opus-4.8
> > > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > Co-developed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > > Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > > ---
> > > Cc: Yoni Levitt <yoni.levitt@intel.com>
> > > Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> > > Cc: Raag Jadav <raag.jadav@intel.com>
> > > Cc: Riana Tauro <riana.tauro@intel.com>
> > > ---
> > > v2: CORRECTED is still an error (Michal)
> > >     prepare to decorate dmesg with comp/loc (Michal)
> > > ---
> > >  Documentation/gpu/xe/index.rst        |   1 +
> > >  Documentation/gpu/xe/xe_sigid.rst     |  14 ++
> > >  drivers/gpu/drm/xe/Makefile           |   1 +
> > >  drivers/gpu/drm/xe/abi/xe_sigid_abi.h | 183
> > > ++++++++++++++++++++++++++
> > >  drivers/gpu/drm/xe/xe_log.c           | 135 +++++++++++++++++++
> > >  drivers/gpu/drm/xe/xe_log.h           |  20 +++
> > >  6 files changed, 354 insertions(+)
> > >  create mode 100644 Documentation/gpu/xe/xe_sigid.rst
> > >  create mode 100644 drivers/gpu/drm/xe/abi/xe_sigid_abi.h
> > >  create mode 100644 drivers/gpu/drm/xe/xe_log.c
> > >  create mode 100644 drivers/gpu/drm/xe/xe_log.h
> > > 
> > > diff --git a/Documentation/gpu/xe/index.rst
> > > b/Documentation/gpu/xe/index.rst
> > > index 665c0e93601c..0247a255f7e6 100644
> > > --- a/Documentation/gpu/xe/index.rst
> > > +++ b/Documentation/gpu/xe/index.rst
> > > @@ -35,3 +35,4 @@ The display, or :ref:`drm-kms`, support for
> > > drm/xe
> > > is provided by
> > >     xe-drm-usage-stats.rst
> > >     xe_configfs
> > >     xe_gt_stats
> > > +   xe_sigid
> > > diff --git a/Documentation/gpu/xe/xe_sigid.rst
> > > b/Documentation/gpu/xe/xe_sigid.rst
> > > new file mode 100644
> > > index 000000000000..45d84a62f185
> > > --- /dev/null
> > > +++ b/Documentation/gpu/xe/xe_sigid.rst
> > > @@ -0,0 +1,14 @@
> > > +.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > > +
> > > +========
> > > +Xe SIGID
> > > +========
> > > +
> > > +.. kernel-doc:: drivers/gpu/drm/xe/abi/xe_sigid_abi.h
> > > +   :doc: Xe Error Signatures (SIGID)
> > > +
> > > +Signature Identifiers
> > > +=====================
> > > +
> > > +.. kernel-doc:: drivers/gpu/drm/xe/abi/xe_sigid_abi.h
> > > +   :internal:
> > > diff --git a/drivers/gpu/drm/xe/Makefile
> > > b/drivers/gpu/drm/xe/Makefile
> > > index 67ada1d6c2fb..7ac3954737f9 100644
> > > --- a/drivers/gpu/drm/xe/Makefile
> > > +++ b/drivers/gpu/drm/xe/Makefile
> > > @@ -87,6 +87,7 @@ xe-y += xe_bb.o \
> > >         xe_hw_fence.o \
> > >         xe_irq.o \
> > >         xe_late_bind_fw.o \
> > > +       xe_log.o \
> > >         xe_lrc.o \
> > >         xe_mem_pool.o \
> > >         xe_migrate.o \
> > > diff --git a/drivers/gpu/drm/xe/abi/xe_sigid_abi.h
> > > b/drivers/gpu/drm/xe/abi/xe_sigid_abi.h
> > > new file mode 100644
> > > index 000000000000..99717fdf74a6
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/xe/abi/xe_sigid_abi.h
> > > @@ -0,0 +1,183 @@
> > > +/* SPDX-License-Identifier: MIT */
> > > +/*
> > > + * Copyright © 2026 Intel Corporation
> > > + */
> > > +
> > > +#ifndef _ABI_XE_SIGID_ABI_H_
> > > +#define _ABI_XE_SIGID_ABI_H_
> > > +
> > > +/**
> > > + * DOC: Xe Error Signatures (SIGID)
> > > + *
> > > + * What SIGID stands for
> > > + * ---------------------
> > > + *
> > > + * SIGID is short for *Signature Identifier*. A SIGID is a small,
> > > stable integer
> > > + * that names one *recognised Xe fault situation* -- nothing more.
> > > It is the
> > > + * primary handle used for triage: a SIGID maps to a human
> > > description and a
> > > + * recommended first action. A coarse first-order action is
> > > documented in-tree
> > > + * per SIGID (see "First-order action" below) so the id is
> > > actionable on its
> > > + * own; published end-user documentation refines it with finer,
> > > cross-product
> > > + * detail. The driver's only job is to emit the right SIGID next
> > > to
> > > the usual
> > > + * human-readable text.
> > > + *
> > > + * Why this exists
> > > + * ---------------
> > > + *
> > > + * Today the driver reports faults with ad-hoc ``drm_err()`` /
> > > ``xe_gt_err()``
> > > + * strings that have no stable shape. That is fine for a human
> > > reading dmesg,
> > > + * but it gives fleet tooling nothing durable to match on: the
> > > wording changes
> > > + * between releases, lines can be rate-limited or dropped under an
> > > error storm,
> > > + * and there is no consistent way to ask "which recognised fault
> > > just happened?"
> > > + * A SIGID answers exactly that one question, identically across
> > > driver and
> > > + * firmware versions, and (eventually) across other Intel devices
> > > in
> > > a node.
> > > + *
> > > + * What a SIGID is (and is not)
> > > + * ----------------------------
> > > + *
> > > + * A SIGID names *which situation* is being reported. It
> > > deliberately does not
> > > + * encode the detailed reason or the outcome. Those are carried
> > > alongside it::
> > > + *
> > > + *   SIGID    -> which recognised situation is being reported
> > > + *   severity -> how serious this instance is (see below -- not
> > > fixed per SIGID)
> > > + *   errno    -> the failing operation's error, shown with %pe
> > > + *   message  -> free-form human-readable context
> > > + *
> > > + * Severity is independent of the SIGID. The same situation can be
> > > reported at
> > > + * different severities depending on the instance and the recovery
> > > taken, so a
> > > + * SIGID is never tied to one severity; the reporting site chooses
> > > it by calling
> > > + * the matching xe_log_*() helper (see xe_log.h).
> > > + *
> > > + * How to pick a SIGID (the uniqueness rule)
> > > + * -----------------------------------------
> > > + *
> > > + * Pick per *report site*, not per incident. Each site emits the
> > > single most
> > > + * specific recognised situation *for that site* -- so the
> > > question
> > > is never
> > > + * "classify this whole failure", it is "what does this site
> > > detect?", which has
> > > + * one answer. A single underlying failure therefore legitimately
> > > produces a
> > > + * *chain* of reports from different layers, each with its own
> > > SIGID
> > > -- e.g. a
> > > + * GuC communication failure is reported as %XE_SIGID_RUNTIME_FW
> > > by
> > > the firmware
> > > + * path, the failed recovery as %XE_SIGID_GT_TDR by the reset
> > > path,
> > > and an
> > > + * aborted bind as %XE_SIGID_PROBE by the probe path. That chain
> > > lets triage
> > > + * follow a fault from origin to final effect; it is not a
> > > duplicate.
> > > + *
> > > + * If a site does not match any defined situation, keep using the
> > > ordinary
> > > + * ``xe_err()`` / ``xe_gt_err()`` logging rather than forcing a
> > > SIGID: a wrong
> > > + * or over-broad classification is harder to retire than a missing
> > > one. When a
> > > + * new situation is genuinely worth triaging, add it to the list
> > > below.
> > > + *
> > > + * Scope: software-emitted signatures only
> > > + * ---------------------------------------
> > > + *
> > > + * This header enumerates only the situations that the *driver
> > > itself* detects
> > > + * and reports from software: probe abort, wedged, survivability,
> > > driver-
> > > + * detected firmware failures, engine TDR, memory faults and
> > > IO/bus
> > > faults.
> > > + * These are the only values the driver assigns.
> > > + *
> > > + * Signatures that *originate* in firmware or hardware are a
> > > different thing:
> > > + * they are produced and identified by the firmware or the
> > > hardware
> > > itself
> > > + * (e.g. via their own records or error counters), and the driver
> > > merely logs
> > > + * them as they are given to us. They are deliberately *not*
> > > enumerated here --
> > > + * minting a driver-side id for a firmware/hardware-reported error
> > > would only
> > > + * duplicate an identifier the reporting layer already owns. The
> > > two
> > > + * driver-detected firmware situations below
> > > (%XE_SIGID_RUNTIME_FW,
> > > + * %XE_SIGID_DEVICE_FW) are software signatures: they mark that
> > > *the
> > > driver*
> > > + * observed a firmware problem, not a signature reported by the
> > > firmware.
> > > + *
> > > + * Numbering
> > > + * ---------
> > > + *
> > > + * SIGIDs are a single flat list numbered sequentially within the
> > > assigned range,
> > > + * in the order the situations were introduced. Values are stable:
> > > once assigned
> > > + * they are only ever appended, never renumbered or reused.
> > > + *
> > > + * A retired situation is deprecated in place, never re-purposed.
> > > + *
> > > + * First-order action (resolution buckets)
> > > + * ---------------------------------------
> > > + *
> > > + * So that a SIGID is actionable on its own, each one is tagged
> > > with
> > > a coarse
> > > + * *resolution bucket*: the first thing an operator should do on
> > > seeing it. The
> > > + * bucket is a stable, driver-owned hint; external documentation
> > > may
> > > refine it,
> > > + * but the in-tree value always stands on its own. Every new SIGID
> > > must pick a
> > > + * bucket, which forces the question "what should someone do about
> > > this?" to be
> > > + * answered up front. The buckets are::
> > > + *
> > > + *   COLLECT  -- capture logs and open a bug report
> > > + *   RETRY    -- transient or already recovered; watch for
> > > recurrence
> > > + *   UPDATE   -- a firmware update / flash is required
> > > + *   RECOVER  -- an explicit recovery step is needed (rebind, bus
> > > reset)
> > > + *   IGNORE   -- ignore if the SIGID severity is INFORMATIONAL
> > > + *
> > > + * The bucket is documentation only -- it is recorded per SIGID in
> > > the enum
> > > + * kernel-doc below and is not printed on the (deliberately lean)
> > > dmesg line.
> > > + *
> > > + * When to use SIGID logging
> > > + * -------------------------
> > > + *
> > > + * The xe_log_*() helpers are for these recognised fault
> > > situations
> > > only --
> > > + * important, operator-relevant faults and events. They are not a
> > > replacement
> > > + * for ``xe_info()`` / ``xe_dbg()`` / tracing, nor for one-off
> > > diagnostics;
> > > + * using them for ordinary logging would dilute the fault stream.
> > > Not every
> > > + * ``xe_err()`` needs to become a SIGID report -- only those that
> > > correspond to
> > > + * a published situation.
> > > + *
> > > + * dmesg vs. the machine record
> > > + * ----------------------------
> > > + *
> > > + * The dmesg line stays close to a normal xe error message so it
> > > remains
> > > + * readable for admins; the only stable, machine-matchable token
> > > on
> > > it is
> > > + * ``SIGID=<n>`` (``dmesg | grep SIGID=``). dmesg is not an ABI:
> > > the
> > > surrounding
> > > + * text may change freely, and lines may be dropped. The durable
> > > record for
> > > + * tooling is the CPER record carrying the same SIGID (generation
> > > is
> > > a planned
> > > + * follow-up).
> > > + */
> > > +
> > > +/*
> > > + * Top level Intel Error Signature Identifiers.
> > > + */
> > > +#define INTEL_SIGID_INVALID                    0
> > > +#define INTEL_SIGID_GPU_START                  100
> > > +#define INTEL_SIGID_GPU_END                    999
> > > +
> > > +#define INTEL_SIGID_GPU_XE_START               100
> > > +#define INTEL_SIGID_GPU_XE_END                 299
> > > +
> > > +#define INTEL_SIGID_GPU_XE_SOFTWARE_START      100
> > > +#define INTEL_SIGID_GPU_XE_SOFTWARE_END                199
> > > +#define INTEL_SIGID_GPU_XE_HARDWARE_START      200
> > > +#define INTEL_SIGID_GPU_XE_HARDWARE_END                299
> > > +
> > > +/**
> > > + * enum xe_sigid - Stable Xe Error Signature Identifiers (SIGID).
> > > + * @XE_SIGID_SW: Software component failure. [COLLECT]
> > > + * @XE_SIGID_PROBE: Device probe/bind was aborted. [COLLECT]
> > > + * @XE_SIGID_WEDGED: Device was declared wedged and is no longer
> > > usable. [RECOVER]
> > > + * @XE_SIGID_SURVIVABILITY: Device entered survivability mode.
> > > [UPDATE]
> > > + * @XE_SIGID_RUNTIME_FW: Driver-detected runtime firmware failure,
> > > GuC/HuC/GSC. [RETRY]
> > > + * @XE_SIGID_DEVICE_FW: Driver-detected device firmware failure,
> > > PCODE/sysctrl. [RETRY]
> > > + * @XE_SIGID_GT_TDR: Engine hang / timeout detection and recovery
> > > (reset). [RETRY]
> > > + * @XE_SIGID_MEM_FAULT: VM bind, page fault or GTT fault.
> > > [COLLECT]
> > > + * @XE_SIGID_IO_BUS: Runtime PCIe / IOMMU / MMIO access fault.
> > > [RECOVER]
> > > + *
> > > + * The situations the driver detects and reports in software.
> > > Values
> > > are
> > > + * numbered sequentially, are only ever appended, and are never
> > > renumbered or
> > > + * reused. The tag in brackets is the default resolution bucket
> > > (see
> > > the `Xe
> > > + * Error Signatures (SIGID)`_ section).
> > > + *
> > > + * Firmware- and hardware-originated signatures are not listed
> > > here;
> > > they are
> > > + * logged as reported by those layers.
> > > + */
> > > +enum xe_sigid {
> > > +       XE_SIGID_SW                     =
> > > INTEL_SIGID_GPU_XE_SOFTWARE_START,
> > > +       XE_SIGID_PROBE                  =
> > > INTEL_SIGID_GPU_XE_SOFTWARE_START + 1,
> > > +       XE_SIGID_WEDGED                 =
> > > INTEL_SIGID_GPU_XE_SOFTWARE_START + 2,
> > > +       XE_SIGID_SURVIVABILITY          =
> > > INTEL_SIGID_GPU_XE_SOFTWARE_START + 3,
> > > +       XE_SIGID_RUNTIME_FW             =
> > > INTEL_SIGID_GPU_XE_SOFTWARE_START + 4,
> > > +       XE_SIGID_DEVICE_FW              =
> > > INTEL_SIGID_GPU_XE_SOFTWARE_START + 5,
> > > +       XE_SIGID_GT_TDR                 =
> > > INTEL_SIGID_GPU_XE_SOFTWARE_START + 6,
> > > +       XE_SIGID_MEM_FAULT              =
> > > INTEL_SIGID_GPU_XE_SOFTWARE_START + 7,
> > > +       XE_SIGID_IO_BUS                 =
> > > INTEL_SIGID_GPU_XE_SOFTWARE_START + 8,
> > > +};
> > > +
> > > +#endif
> > > diff --git a/drivers/gpu/drm/xe/xe_log.c
> > > b/drivers/gpu/drm/xe/xe_log.c
> > > new file mode 100644
> > > index 000000000000..70a41bdf1a01
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/xe/xe_log.c
> > > @@ -0,0 +1,135 @@
> > > +// SPDX-License-Identifier: MIT
> > > +/*
> > > + * Copyright © 2026 Intel Corporation
> > > + */
> > > +
> > > +#include "xe_log.h"
> > > +#include "xe_printk.h"
> > > +
> > > +static void log_emit_cper(struct pci_dev *pdev, int cper_sev, enum
> > > xe_sigid sigid,
> > > +                         u32 component, u32 location, const void
> > > *data, size_t len,
> > > +                         struct va_format *vaf)
> > > +{
> > > +       /* TODO */
> > > +}
> > > +
> > > +static bool is_hw_sigid(enum xe_sigid sigid)
> > > +{
> > > +       return (int)sigid >= INTEL_SIGID_GPU_XE_HARDWARE_START;
> > > +}
> > > +
> > > +static bool is_sev_error(int cper_sev)
> > > +{
> > > +       return cper_sev != CPER_SEV_INFORMATIONAL;
> > > +}
> > > +
> > > +static const char *log_hwe_prefix(int cper_sev, enum xe_sigid
> > > sigid)
> > > +{
> > > +       return is_sev_error(cper_sev) && is_hw_sigid(sigid) ?
> > > HW_ERR
> > > : "";
> > > +}
> > > +
> > > +static const char *log_sev_prefix(int cper_sev)
> > > +{
> > > +       switch (cper_sev) {
> > > +       case CPER_SEV_FATAL:
> > > +               return "FATAL ";
> > > +       case CPER_SEV_RECOVERABLE:
> > > +               return "";
> > > +       case CPER_SEV_CORRECTED:
> > > +               return "CORRECTED ";
> > > +       default:
> > > +               return "";
> > > +       }
> > > +}
> > > +
> > > +#define __LOG_DRM_PRINTK_FMT(fmt, args...)     "[drm] " fmt,
> > > ##args
> > > +#define __LOG_DRM_PRINTK_ERR_FMT(fmt,
> > > args...) __LOG_DRM_PRINTK_FMT("*ERROR* " fmt, args)
> > > +
> > > +static void log_dmesg_vprintk(struct pci_dev *pdev, int cper_sev,
> > > struct va_format *vaf)
> > > +{
> > > +       if (cper_sev == CPER_SEV_INFORMATIONAL)
> > > +               pci_info(pdev, __LOG_DRM_PRINTK_FMT("%pV", vaf));
> > > +       else
> > > +               pci_err(pdev, __LOG_DRM_PRINTK_ERR_FMT("%pV",
> > > vaf));
> > > +}
> > > +
> > > +static void log_dmesg_printf(struct pci_dev *pdev, int cper_sev,
> > > const char *fmt, ...)
> > > +{
> > > +       struct va_format vaf;
> > > +       va_list args;
> > > +
> > > +       va_start(args, fmt);
> > > +       vaf.fmt = fmt;
> > > +       vaf.va = &args;
> > > +
> > > +       log_dmesg_vprintk(pdev, cper_sev, &vaf);
> > > +
> > > +       va_end(args);
> > > +}
> > > +
> > > +static void log_emit_dmesg(struct pci_dev *pdev, int cper_sev,
> > > enum
> > > xe_sigid sigid,
> > > +                          u32 component, u32 location, const void
> > > *data, size_t len,
> > > +                          struct va_format *vaf)
> > > +{
> > > +       const char *hwe_prefix = log_hwe_prefix(cper_sev, sigid);
> > > +       const char *sev_prefix = log_sev_prefix(cper_sev);
> > > +
> > > +       /* TODO: add component/location details */
> > > +
> > > +       if (IS_ERR(data))
> > > +               log_dmesg_printf(pdev, cper_sev, "SIGID=%u %s(%pe)
> > > %s%pV",
> > > +                                sigid, sev_prefix, data,
> > > hwe_prefix,
> > > vaf);
> > > +       else if (data && len)
> > > +               log_dmesg_printf(pdev, cper_sev, "SIGID=%u
> > > %s(%*phN)
> > > %s%pV",
> > > +                                sigid, sev_prefix, (int)len, data,
> > > hwe_prefix, vaf);
> > > +       else
> > > +               log_dmesg_printf(pdev, cper_sev, "SIGID=%u
> > > %s%s%pV",
> > > +                                sigid, sev_prefix, hwe_prefix,
> > > vaf);
> > > +}
> > > +
> > > +/**
> > > + * xe_log_emit() - Emit a structured SIGID log entry
> > > + * @pdev: the &pci_dev device
> > > + * @cper_sev: CPER severity (CPER_SEV_FATAL, CPER_SEV_RECOVERABLE,
> > > ...)
> > > + * @sigid: signature identifier, see &enum xe_sigid
> > > + * @component: component identifer
> > > + * @location: location details of the @component
> > > + * @data: pointer to the additional details, or ERR_PTR, or NULL
> > > if
> > > not applicable
> > > + * @len: length of the @data in bytes, or 0 if not applicable
> > > + * @fmt: printf-style format string
> > > + * @...: format arguments
> > > + *
> > > + * Emits a dmesg line that includes a single stable, machine-
> > > matchable token
> > > + * ``SIGID=<n>`` followed by the optional severity token (like
> > > ``FATAL``) and,
> > > + * when @data pointer is set, either the error printed with %pe or
> > > a
> > > packed hex
> > > + * dump of the @data binary blob. The dmesg line will also include
> > > printf-style
> > > + * text message.
> > > + *
> > > + * Note that the full dmesg line, with the free text message, is
> > > only a debugging
> > > + * aid, not an interface! Only the ``SIGID=<n>`` token is stable
> > > there.
> > > + * The durable machine record is the CPER carrying the same SIGID.
> > > + *
> > > + * Note: generation of the CPER record is a planned follow-up.
> > > + *
> > > + * Examples::
> > > + *
> > > + *   <3> xe 0000:03:00.0: [drm] *ERROR* SIGID=104 FATAL (-EPROTO)
> > > Invalid GuC reply
> > > + *   <3> xe 0000:03:00.0: [drm] *ERROR* SIGID=106 (-ETIMEDOUT)
> > > Engine 'rcs0' hung
> > > + *   <6> xe 0000:03:00.0: [drm] *ERROR* SIGID=103 In survivability
> > > mode
> > > + */
> > > +void xe_log_emit(struct pci_dev *pdev, int cper_sev, enum xe_sigid
> > > sigid,
> > > +                u32 component, u32 location, const void *data,
> > > size_t len,
> > > +                const char *fmt, ...)
> > > +{
> > > +       struct va_format vaf;
> > > +       va_list args;
> > > +
> > > +       va_start(args, fmt);
> > > +       vaf.fmt = fmt;
> > > +       vaf.va = &args;
> > > +
> > > +       log_emit_dmesg(pdev, cper_sev, sigid, component, location,
> > > data, len, &vaf);
> > > +       log_emit_cper(pdev, cper_sev, sigid, component, location,
> > > data, len, &vaf);
> > > +
> > > +       va_end(args);
> > > +}
> > > diff --git a/drivers/gpu/drm/xe/xe_log.h
> > > b/drivers/gpu/drm/xe/xe_log.h
> > > new file mode 100644
> > > index 000000000000..d475e816ee0b
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/xe/xe_log.h
> > > @@ -0,0 +1,20 @@
> > > +/* SPDX-License-Identifier: MIT */
> > > +/*
> > > + * Copyright © 2026 Intel Corporation
> > > + */
> > > +
> > > +#ifndef _XE_LOG_H_
> > > +#define _XE_LOG_H_
> > > +
> > > +#include <linux/cper.h>
> > > +
> > > +#include "abi/xe_sigid_abi.h"
> > > +
> > > +struct pci_dev;
> > > +
> > > +__printf(8, 9)
> > > +void xe_log_emit(struct pci_dev *pdev, int cper_sev, enum xe_sigid
> > > sigid,
> > > +                u32 component, u32 location, const void *data,
> > > size_t len,
> > > +                const char *fmt, ...);
> > > +
> > > +#endif
> > 
> 
