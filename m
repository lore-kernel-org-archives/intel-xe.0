Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E8F7C9830E
	for <intel-xe@archiver.kernel.org>; Mon, 28 Sep 2026 00:06:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2618B10E707;
	Mon, 28 Sep 2026 00:06:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jDHmfEOr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7C0E10E707
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Sep 2026 00:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790554018; x=1822090018;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=HlnG09LTtPHlGR+pKYED92tJPN6VRXGlk/Q6o24WGA4=;
 b=jDHmfEOrARV9KUR13DmrUmznUvdOzbD7owDI6bd/My+mTLt9meY/uhKg
 Zlci/s0vW7mH7tklIqBzS3U3lbh59C6fVhq5TUcBI8XwFawnHjjcbkA5M
 VeHZiNrz6AwYaFgWuu09LTwbnMigaU2Z7nSXFdilpXUuJnfyoyXEi/upw
 8mzNA3Y6dYw2yFY3IEPk4RJXka+BOjU9/23zgRsk3rwIVD2TYOcL7w+IC
 CXUTVF5fr8o6rgnVfqOZqKaQJprosily6GwUVyVtgqYEMDyyE/5T+xrSH
 gYUktERHa17G55q5gZkkdrSPQ4pAwX9xJ5//QHYYSBlFTIJlSdinan8Iq A==;
X-CSE-ConnectionGUID: KXOGZLqTQ/G3eSEE1wKR0Q==
X-CSE-MsgGUID: ikcqcLZSQIid61+ipksMxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11918"; a="102620640"
X-IronPort-AV: E=Sophos;i="6.27,127,1787036400"; d="scan'208";a="102620640"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2026 17:06:57 -0700
X-CSE-ConnectionGUID: dtFinB7rS3GJ8fF4tiodYw==
X-CSE-MsgGUID: GPk8eX2kT4qU+uBMmaudxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,127,1787036400"; d="scan'208";a="274123302"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2026 17:06:57 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sun, 27 Sep 2026 17:06:57 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Sun, 27 Sep 2026 17:06:57 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.32) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sun, 27 Sep 2026 17:06:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SkxA+a2mxuoEjqAkl8xcCA5LTKGO6qn1j2hzYM0PYD5IlAOFo8mmwihszLolWLVp8fxwwhyq2U1BQ3kow436DO9w7M07DyaWSchUZTc3rk/4m2Jw4c+UAW3z6MbUwbcXvuL52pyPzk69Yf0xrEvTVWuCtpvTZ/DQaRQW9Rx7Pws1e92jBSGW4fA7iKToI9G2dNNH3WRszJxX/jjkl8P1tJur96iKxASXM5knT+JYaCYnndmDxFFYnBeURIma1NPGl5vlNWehQtElLL4sO11kPESIgl6m7FO5+WpWIf+wAHOChPbQyrrlWGITavhUFNXoU+0r3Vzpgejxlq1R4ZE+6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NVgJl9sOur95e8AhvFlYzfaC2lQghHAoa2BpTMyUqKc=;
 b=sj3Nq4H2W0ACH0EsEqWfHvLWRN4Iw3a+sH7mytFavv4dJVHNQUaP+ZXvtVYFJbS5ze+UusMWyCfVsSUltUvdtxQIdRIa0sKr/mdsKG9LN+mIeVSSzPQ7gJhDw+BIl4U9L+HQKEqjRcaPCcfZfOnc9VB+FLRTmNsvM7pStLcryb7uHQGD6iwA22zCLn4WfWwR9sg+FFIrZ3lwkErlTNKInAQJYhr0Y6nxEM0jBEIek2aTUrGNIkyLOhu4ncbtT/bfeF6vphbgLt81SMmykufVMCtVLUDiXffAxU7WwTzZWXOQdShvToiqzKZMG0dDt4pap7qoXOhJOXC1gW30GjxWAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7187.namprd11.prod.outlook.com (2603:10b6:208:441::12)
 by DS0PR11MB8207.namprd11.prod.outlook.com (2603:10b6:8:164::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 00:06:49 +0000
Received: from IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565]) by IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565%4]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 00:06:49 +0000
Date: Sun, 27 Sep 2026 20:06:23 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <batarolandkrisztian@gmail.com>
CC: <intel-xe@lists.freedesktop.org>, <karthik.poosa@intel.com>,
 <matthew.brost@intel.com>, <raag.jadav@intel.com>,
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH RFC] drm/xe/hwmon: refresh B70 temperature inputs after
 GT idle
Message-ID: <armvfxjttsjTVWk-@intel.com>
References: <179041811564.526373.13204522833274380927.b70-hwmon-rfc@gmail.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <179041811564.526373.13204522833274380927.b70-hwmon-rfc@gmail.com>
X-ClientProxiedBy: SI1PR02CA0022.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::16) To IA0PR11MB7187.namprd11.prod.outlook.com
 (2603:10b6:208:441::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7187:EE_|DS0PR11MB8207:EE_
X-MS-Office365-Filtering-Correlation-Id: 5aae278b-0e40-40bd-f2f1-08df1cf46352
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|5023799004|11063799006|56012099006|10067099003|22082099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: dz1MIrimAvkboBm0mHRjWmDwcf0PxcmcsOMckiN/EKvJE9XHAk5b5hNgGYVB5uSJYiTORllKuWSNVIrKKveoqmGpKCIDQVFQuBDrpbLtyxKmhMxZ3L6fwNwAr03BMUsKp8L5Gs2MoK5AIRf4+iZ5eYVze+i89pECfpkkuULVoDixoy+2rRq9BNM3EIKWCmZbimWzASxpGnlpSRzpyvkL1lx9VUgIEXM8YWvwxeET/edthXK+nzj2FC5HnIcpKS6JkdOnausQrRhSu3hCcAzsILDjLfJhGvfUEv/E5rxtJpcDuEwdDcbmDS2XVFo1Q7zf1WiH4+AYOEGXzSoFnS9y1NEqZ8aKiGRLCpyoYRD0nkMU/yFZUOXy5AKiv2GJhWXMQJB61tXUl9/ndBifwy2OMK5Y7WCKhflvUeARX/iTKyhpBJ254LT4se5++mF1r/9LtkjnaQrXGz+HmseE7DR/y3Yt8Vv3qcvkHqlw/hHOWFP9JFTjKrNVYkL9JGY/+Lo7EA40wNu2lrPasfBrX+gCa8dllhNclZZp7hqm/K5TdR+UiaP7C8M5LmlZ49mupQfaiZr1e8PYBJSBun6wqkgXsPgivckzdPkdZ50DjUaP9S3/6G2j0vOzJtXrAbfLnBJD
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7187.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(5023799004)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003)(6133799003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?1rlTMzJ7rvAotm8df7ID7soOvY0yiOPIQ4nM8+py1E3kwpP6bB7waTxbwF?=
 =?iso-8859-1?Q?ZkU/scDJEFvme/kbIk5G+bmS4yt7i8MFKBpqeVmyZ0UkTTr7ssdNVtrPTY?=
 =?iso-8859-1?Q?Ikghje6ql34Pe6dSF3gvz+tX4mHm/uXyh2yOLbm2FG7900I5ngc7p8wYGK?=
 =?iso-8859-1?Q?Xzqjrj8YHW482U8uwhxdN16dNjCCZbK3dLIostTh4pUK4SCpdDjjyP8RWS?=
 =?iso-8859-1?Q?oJ2eccDnycCsb1ApxYMFIluQXQXlkP1KYR8CZ2CIQWhhgYBEzHoRJyf+7q?=
 =?iso-8859-1?Q?PXuJu2f/ryR4mls5SLXdPANAOpfgxpu8ITWWecUOqmu/oNr8UipkQl7PI3?=
 =?iso-8859-1?Q?LVAA5Z26uqhXMtRQfHSxmSZ1qFebil9pY8xKc1VUUg/HYBU4IAMECYuGSJ?=
 =?iso-8859-1?Q?TiKxzoHisBwJwl0/bks5pXtUPoTZbB00IGHW43hwjFjnVbLhV2iyMOWmRN?=
 =?iso-8859-1?Q?rqgC1B2FWKoA+PkWLqzRPi4OBkwoA1eEci1oXdl6mwtFAwjNrg+hzsdkbf?=
 =?iso-8859-1?Q?Zm6kqpmZJOryrhWVk30P2xO0UyahlI2HF746zF+ip8NQNrFGnrg4sPQajg?=
 =?iso-8859-1?Q?vk32XMHoA8XN7CbXtn6/pr4GTR63UyLvhiAXgSnCz0zeiSjTL9CqrAvkaX?=
 =?iso-8859-1?Q?rjFGDh0jRLMhJPscJqPgmYI42mDi2ZqwCvX1jH9sdLhkdJOzuxYynAyYvv?=
 =?iso-8859-1?Q?jpds2aEXkRzm1FNbcng0UBispN1VpiZs9/o8OaUBhQrmrwiQg4WIdsgfZ5?=
 =?iso-8859-1?Q?4k8QvlXk/w3JZ8h8ce9f4tSMU3rCkR6KXdVpsf9vc0djQM9t/gHtiAXctv?=
 =?iso-8859-1?Q?geuu206XUz5F3yI0VJD/gYqSWOZof9wOSV/RRBX8Cq5UmR7Znf1JBN/mB5?=
 =?iso-8859-1?Q?f5vMcxjjhGjZTQZFhNapR/KyBC1QPySDT75Ftw+h4U74RX5vphh09t7MMH?=
 =?iso-8859-1?Q?gnBsyWCPI6M0jMs+vHSJWJ1pWezFsWiVxXMMDnkNZLsaQbwj4A9cMjsZXw?=
 =?iso-8859-1?Q?DYKc3VwscUAToDyKQ8ygjOyth4yOVaE2XNFTKu2gsxQ3o3diYQpkKOLQLv?=
 =?iso-8859-1?Q?DIle6ICTIPnAdiGYWBJ4DJzgbhh45fRAWTtvM28J9qpiWdMxhTkZ9oE9p4?=
 =?iso-8859-1?Q?OQ3RAb7B3LG8AxBEy3r9aMt0yXYMxvwnzBz022TkyZjLQaEFr9H90Ruvta?=
 =?iso-8859-1?Q?hNBvlGkQELaWSXNm8N3IdPQFUtKhqQ2EQ2rtIkm9lOKQRm3sqfLCgucg0x?=
 =?iso-8859-1?Q?ilw/8W1t+cbdUuXVYfJxphm1//571yeHSX6RF41moKY1OZ3JiREoK+Zhd/?=
 =?iso-8859-1?Q?KyR7h5LenD6I/nx8LQCQlnLjti0sPcGp6faOl9xaCy2nvHeN06xrqgl2b9?=
 =?iso-8859-1?Q?11HU6szJCVvelxffdcvsK4KX65Q0QHRZfqFkdl7vuywFgaDle3e7VfyGlW?=
 =?iso-8859-1?Q?oGo6ACNcH6i9CYYsjzvmM+20c3NbZpdOqOS2WyM+Es7wuzFw8aaK7MqKLa?=
 =?iso-8859-1?Q?l16WfpZXpFuFG2mXpjg2wJCY20HnQczuBJ1/B1DArbi7KFqngYte02FtZZ?=
 =?iso-8859-1?Q?om5K+Zerhz7tqnA4GumQEouKWJWO9+a5TKTD44SVXgghrFP11Zlc6BOoZh?=
 =?iso-8859-1?Q?MnZD3/BRDva3w3cyZVgv5glqBsBFmZmpRVqfI3DKFSbmpN1FNIC9/g1nMR?=
 =?iso-8859-1?Q?bYZh2qH09/IH6aAefMYYH1uG3i7lywDWt7r6KOSajbZOXdCFL0WtbfSZIc?=
 =?iso-8859-1?Q?4NVcCsNRg4cxckKO5D+m6Fu0e/lc19MtHsMp7azLeLAxeKzDUT9fiH2CU0?=
 =?iso-8859-1?Q?aHN1a5JTMk+TCnJmU5V1hWorMSeYvtk=3D?=
X-Exchange-RoutingPolicyChecked: bZleDjVX/Uh0yKKHEO8B+0H2ZSmDQt0ipdR1XXxmIaIW1MU+g4GKxoBynPG7O0KVhR8TdiIGFGXSoeHPxwyaMDdztO4GTAmGCtP28n591WN03OFIgXOkl4rGSRHxc9yldm6u8R7ZaAB1lphHJ6QsiieWLdgV8oHNck32yMyCmsOkCdw7aphgzCXgFmzl4QP/trpXM78FyJawf8QWt5xGM/sVVxLPMuqFvqN0TV4ry9RBNIQIbrRW5fOAV6PRunbieeR8WVYmOshCgKjgQnZ9H6rnFLxYufpDY5PVuJABPo2bzSDWR9viey7pCnUOtyesdFBKwBRW7G6qi7+ynUHHig==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5aae278b-0e40-40bd-f2f1-08df1cf46352
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7187.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 00:06:49.1751 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z8gi8ra50EZrQHWuo/sOZL7TGYhr9OXVC4kIV2cW/sevSsmPe6jFPqclumWALQnwJiW2Pltarz0BNqHikrB6pg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8207
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

On Sat, Sep 26, 2026 at 12:21:55PM +0200, Bata Roland Krisztián via B4 Relay wrote:
> From: Bata Roland Krisztián <batarolandkrisztian@gmail.com>
> 
> Two Arc Pro B70 devices (8086:e223) retain their package temperature
> after compute workloads despite both GTs returning to C6. A device
> runtime PM reference does not refresh the sample while power/control
> is already on.
> 
> With GuC 70.72.1 on Fedora kernel 7.1.10, a 60-second OpenCL workload
> followed by 45 seconds of idle left package temperature at 55 C on both
> cards. Acquiring all GT forcewake references still returned 55 C in
> the first read, about 57 us after open completed. At about 1053 us the
> reported value became 34 C on both cards. A brief GT-only pulse from
> reading cur_freq did not refresh the package value.
> 
> As an RFC, acquire forcewake references for the temperature input read,
> allow time for a new sample, then release the references on both the
> success and partial-acquisition failure paths. Limit the experiment to
> the measured PCI ID and leave labels, limits and other hwmon types on
> their existing paths.
> 
> The 2 ms interval and use of all domains are empirical, not a hardware
> specification guarantee. This needs review of the sensor conversion
> time, minimum wake domains and alternatives such as a PCODE refresh or
> readiness indication before it can become a production fix.
> 
> Compile-tested xe_hwmon.o on current drm-tip with W=1 and Xe display both
> disabled and enabled. The wake/wait/read sequence was measured through
> debugfs on two B70s; the modified kernel has not been boot-tested.
> 
> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/7805
> Assisted-by: OpenAI:gpt-6-astra
> Signed-off-by: Bata Roland Krisztián <batarolandkrisztian@gmail.com>
> ---
> RFC: proposed direction for issue 7805, not a claim of a production-ready fix.

The fundamental question here is, do we want to burn power in order to check
for the power?
If so, is grabbing the debugfs/forcewake_all an option before reading this?

But if we decide that this is what we want, we need a generic solution,
not only for this part...

> 
> Hi Xe maintainers,
> 
> I am following up on my B70 stale-temperature report with a smaller
> reproduction, timing measurements, and a prototype read-side change.
> 
> Questions before turning this into v1:
> 
> 1. Is there a PCODE operation or freshness/conversion-ready indication that
>    should be used instead of a fixed settling interval? The first MMIO read
>    after successful forcewake still returned the old temperature.
> 2. Which wake domains are actually required? A GT0 hw_engines read, which
>    holds all domains for that GT while dumping registers, also refreshed
>    package/mctrl/PCIe readings. The conservative prototype mirrors the
>    device forcewake_all sequence used for the controlled timing experiment.
> 3. Should a refresh cover/cache several temperature channels together? The
>    prototype wakes per input read. The power measurements below are for one
>    batch per device every two seconds, not for reading every hwmon channel
>    at high frequency and not measurements of this compiled patch.
> 4. Is this a known firmware issue with a preferred fix? Should the eventual
>    driver handling apply to other Battlemage IDs? This RFC only opts in the
>    tested 8086:e223 devices.
> 
> Hardware and reproduction
> -------------------------
> Two Intel Arc Pro B70s, PCI ID 8086:e223, on an ASRock X870E Taichi / Ryzen
> 5 9600X. Fedora CoreOS 44.20260829.3.1, kernel 7.1.10-200.fc44.x86_64,
> GuC 70.72.1, HuC 8.2.10. power/control=on was kept throughout; it is an
> existing workaround for noisy PCI runtime suspend/resume cycling.
> 
> A bounded 60-second OpenCL workload used a private 1 MiB output buffer per
> device, followed by 45 seconds without GPU submissions. Both GTs reached
> C6, actual frequency was zero, and idle residency continued advancing.
> Package readings stayed at 55 C on both cards. A short GT0 cur_freq read
> (itself a GT-only forcewake pulse) did not correct the package reading.
> 
> Opening forcewake_all, then reading temperatures while holding the fd:
> 
>                     B70 A                  B70 B
> before              55 C                   55 C
> first read          55 C at 57.769 us       55 C at 56.119 us
> first correction    34 C at 1053.529 us     34 C at 1053.039 us
> 
> Times are measured from completion of open, not the initial wake request.
> The 2, 5, 10 ms and later samples were also refreshed. These two observations
> are not a guaranteed maximum sensor-conversion latency.
> 
> In a separate 30-second observation / short-pulse / observation sequence,
> 16 two-millisecond holds at two-second intervals returned approximately
> 24 C and 22-23 C. The complete open/wait/read/close scope was about 3.06 ms
> and 3.07 ms median. GT idle residency during the pulse phase exceeded 99.7%.
> 
> Energy-counter-derived card power, W:
>                     before       pulses       after
> B70 A               5.30         5.51         4.87
> B70 B               4.31         4.48         4.39
> 
> These are short observations with normal background system activity; they
> are not a general power-regression benchmark. Holding all domains for two
> seconds during the timing experiment cost about 81 W per card at the
> retained 2800 MHz request and caused self-heating. A permanent forcewake is
> therefore unsuitable. References were released and both GTs returned to C6
> after every completed experiment. No reset, rebind or PM-policy change was
> used for these measurements.
> 
> Source/build checks
> -------------------
> The BMG temperature read path is unchanged between v7.1.10, v7.2.5 and the
> current drm-tip version examined here. The newer Fedora 20260910 firmware
> collection contains byte-identical BMG GuC/HuC files to 20260810.
> 
> Base: drm-tip 666d2f09d9045fc8f72cc1f71528a04acbaf5229
>       2026-09-26 04:44:20 UTC integration manifest
> Checked: checkpatch --strict, zero errors/warnings/checks for the patch;
>          xe_hwmon.o compile with W=1, Xe display disabled and enabled.
> Not yet tested: booted patched kernel, IGT/CI, suspend/resume, hardware
>                acquisition-error paths, other GPU variants, high-rate
>                multi-channel reads.
> 
> The attached change is deliberately an RFC. I would appreciate guidance on
> the correct hardware handshake and domain scope, and can test a revised
> approach on these two cards.
> 
> A later smoke test of the standalone reproducer below also changed a
> previously low reading upward (26 to 44 C on one card). I therefore do not
> use an unchanged/high-value heuristic to declare a value stale, or replace
> readings with an inferred idle temperature. The observations concern the
> reported values; independent physical thermometry was not performed.
> 
> Standalone reproduction aid
> ---------------------------
> After a GPU workload and idle interval, save this as repro.py and run:
>   sudo python3 repro.py 0000:03:00.0 0000:08:00.0
> Use your cards' PCI addresses. This script itself starts no workload.
> 
> #!/usr/bin/env python3
> # SPDX-License-Identifier: MIT
> """Measure B70 temperature refresh after forcewake; run after workload/idle.
> 
> No workload, PM-policy/frequency write, reset or driver rebind is performed.
> Only the requested 8086:e223 Xe devices are read. Each wake lasts about 10 ms;
> readings are printed after the descriptor has been closed.
> """
> import argparse
> import json
> import os
> from pathlib import Path
> import re
> import signal
> import time
> 
> 
> def text(path):
>     return path.read_text().strip()
> 
> 
> def card(bdf, debugfs):
>     if not re.fullmatch(r"[0-9a-f]{4}:[0-9a-f]{2}:[0-9a-f]{2}\.[0-7]", bdf):
>         raise ValueError("Expected a full lowercase PCI address")
>     pci = Path("/sys/bus/pci/devices") / bdf
>     if (text(pci / "vendor"), text(pci / "device")) != ("0x8086", "0xe223"):
>         raise ValueError(f"Not the tested B70 PCI ID: {bdf}")
>     if (pci / "driver").resolve() != Path("/sys/bus/pci/drivers/xe"):
>         raise ValueError(f"Not bound to xe: {bdf}")
>     hw = list((pci / "hwmon").glob("hwmon*"))
>     if len(hw) != 1 or text(hw[0] / "name") != "xe":
>         raise ValueError(f"Ambiguous hwmon: {bdf}")
>     labels = {text(p): p.with_name(p.name.replace("_label", "_input"))
>               for p in hw[0].glob("temp*_label")}
>     if "pkg" not in labels:
>         raise ValueError(f"Missing package sensor: {bdf}")
>     paths = {label: labels[label] for label in ("pkg", "vram", "mctrl", "pcie")
>              if label in labels}
>     return bdf, pci, paths, debugfs / bdf / "forcewake_all"
> 
> 
> def snapshot(pci, paths):
>     start = time.monotonic_ns()
>     values = {label: int(text(path)) for label, path in paths.items()}
>     return {"temp_read_start_ns": start, "temp_read_end_ns": time.monotonic_ns(),
>             "millidegrees": values,
>             "gt_idle": [text(pci / "tile0" / f"gt{n}" / "gtidle/idle_status")
>                         for n in (0, 1)]}
> 
> 
> def interrupted(signum, _frame):
>     raise SystemExit(f"Interrupted by signal {signum}; descriptors will close")
> 
> 
> def main():
>     parser = argparse.ArgumentParser(description=__doc__)
>     parser.add_argument("--debugfs-root", type=Path, default=Path("/sys/kernel/debug/dri"))
>     parser.add_argument("devices", nargs="+")
>     args = parser.parse_args()
>     if os.geteuid() != 0:
>         parser.error("Run with sudo for debugfs access")
>     if len(args.devices) > 8 or len(set(args.devices)) != len(args.devices):
>         parser.error("Select at most eight distinct devices")
>     cards = [card(bdf, args.debugfs_root) for bdf in args.devices]
>     signal.signal(signal.SIGTERM, interrupted)
>     signal.signal(signal.SIGALRM, interrupted)
>     signal.alarm(30)
>     for bdf, pci, paths, wake in cards:
>         before = snapshot(pci, paths)
>         if before["gt_idle"] != ["gt-c6", "gt-c6"]:
>             print(json.dumps({"bdf": bdf, "skipped": "GT is active", "before": before}))
>             continue
>         samples = []
>         opened_at = time.monotonic_ns()
>         with wake.open("rb"):
>             open_returned_at = time.monotonic_ns()
>             for target_us in (0, 1000, 2000, 5000, 10000):
>                 remaining_ns = open_returned_at + target_us * 1000 - time.monotonic_ns()
>                 if remaining_ns > 0:
>                     time.sleep(remaining_ns / 1e9)
>                 value = snapshot(pci, paths)
>                 samples.append({"target_us": target_us,
>                                 "since_open_us": (value["temp_read_start_ns"] - open_returned_at) / 1000,
>                                 **value})
>         closed_at = time.monotonic_ns()
>         time.sleep(1)
>         print(json.dumps({"bdf": bdf, "kernel": os.uname().release,
>                           "power_control": text(pci / "power/control"),
>                           "before": before, "samples": samples,
>                           "open_us": (open_returned_at - opened_at) / 1000,
>                           "total_scope_us": (closed_at - opened_at) / 1000,
>                           "after_close": snapshot(pci, paths)}), flush=True)
> 
> 
> if __name__ == "__main__":
>     main()
> 
>  drivers/gpu/drm/xe/xe_hwmon.c | 38 +++++++++++++++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index 5edeac96..2bb5bca2 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -3,6 +3,7 @@
>   * Copyright © 2023 Intel Corporation
>   */
>  
> +#include <linux/delay.h>
>  #include <linux/hwmon-sysfs.h>
>  #include <linux/hwmon.h>
>  #include <linux/jiffies.h>
> @@ -14,6 +15,8 @@
>  #include "regs/xe_mchbar_regs.h"
>  #include "regs/xe_pcode_regs.h"
>  #include "xe_device.h"
> +#include "xe_force_wake.h"
> +#include "xe_gt.h"
>  #include "xe_hwmon.h"
>  #include "xe_mmio.h"
>  #include "xe_pcode.h"
> @@ -1096,6 +1099,35 @@ xe_hwmon_temp_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
>  	}
>  }
>  
> +static int xe_hwmon_b70_temp_read(struct xe_hwmon *hwmon, u32 attr,
> +				  int channel, long *val)
> +{
> +	unsigned int refs[XE_MAX_TILES_PER_DEVICE * XE_MAX_GT_PER_TILE] = {};
> +	struct xe_device *xe = hwmon->xe;
> +	struct xe_gt *gt;
> +	int ret = -ETIMEDOUT;
> +	u8 id;
> +
> +	for_each_gt(gt, xe, id) {
> +		refs[id] = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> +		if (!xe_force_wake_ref_has_domain(refs[id], XE_FORCEWAKE_ALL))
> +			goto out;
> +	}
> +
> +	/*
> +	 * A forcewake acknowledgment does not imply a fresh thermal sample.
> +	 * RFC: this interval is empirical on 8086:e223; the conversion time
> +	 * and minimum required wake domains need hardware-spec confirmation.
> +	 */
> +	usleep_range(2000, 2500);
> +	ret = xe_hwmon_temp_read(hwmon, attr, channel, val);
> +out:
> +	for_each_gt(gt, xe, id)
> +		xe_force_wake_put(gt_to_fw(gt), refs[id]);
> +
> +	return ret;
> +}
> +
>  static umode_t
>  xe_hwmon_power_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>  {
> @@ -1408,6 +1440,12 @@ xe_hwmon_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
>  
>  	switch (type) {
>  	case hwmon_temp:
> +		/* Limit the RFC workaround to the PCI ID measured in issue 7805. */
> +		if (attr == hwmon_temp_input &&
> +		    hwmon->xe->info.platform == XE_BATTLEMAGE &&
> +		    hwmon->xe->info.devid == 0xe223)
> +			return xe_hwmon_b70_temp_read(hwmon, attr, channel, val);
> +
>  		return xe_hwmon_temp_read(hwmon, attr, channel, val);
>  	case hwmon_power:
>  		return xe_hwmon_power_read(hwmon, attr, channel, val);
> 
> base-commit: 666d2f09d9045fc8f72cc1f71528a04acbaf5229
> -- 
> 2.55.0
> 
> 
