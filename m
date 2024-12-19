Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7A95E77184
	for <intel-xe@archiver.kernel.org>; Thu, 19 Dec 2024 20:28:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F9B310E092;
	Thu, 19 Dec 2024 20:28:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gEhvNBiD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B309D10E092
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Dec 2024 20:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734640124; x=1766176124;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=YOpROc5nKT8bGQWyZVr09HbD4ieJgsBurKQpJJC5i/k=;
 b=gEhvNBiDsf0ywI7tc94yccLiCrV/CFYB2kEoN+rRfr86jB5innvynGb2
 2qWcZmrlPAn/DUrI6Kutzo5uOcJ6LbGjMOBM5BpHlTIAEZN9aw96vVprV
 taZ4F5Tt6gnSIAjVOMPXGEswplVgm49LKxLK98W9frAQtwHApKbD3D3Jn
 nAmBuBZnMlDzsC8T45QYeD9YN/hO9uFTGXDRWTvMGXrAKYbKngblpFLLa
 zwTelVRwmGvpz2MGWbERJNsFUC13+9idXgWyK4QBZOOE8H1UUYZ8B0/6e
 ObTtMmACwXONiiryiBDjdRR3Nsh9akx4+4BDwTdi5bAYbDwroYfu6G5th A==;
X-CSE-ConnectionGUID: reoXQCrYTHaCFOwoM/izRg==
X-CSE-MsgGUID: FzsL/gdBQYGS4/oqYnxLjQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="38957600"
X-IronPort-AV: E=Sophos;i="6.12,248,1728975600"; d="scan'208";a="38957600"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2024 12:28:44 -0800
X-CSE-ConnectionGUID: AGANU4fkR5Co5g1exCbGJA==
X-CSE-MsgGUID: O+Bm9C+cSnyBzVmwTDotkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,248,1728975600"; d="scan'208";a="98700610"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Dec 2024 12:28:43 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 19 Dec 2024 12:28:42 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 19 Dec 2024 12:28:42 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 19 Dec 2024 12:28:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oWfqtLlGNlC5WRc9zW3S78LUWsoqBayiWqUkGWVuPiWK9G8R0YhhkPMxS5BL1+zwC5Tl9dynBu9ZIxgZ+eq4zYyG3UWiJ8SuFQqxMjLork4c/E69A6T40od4PB45STYw4mFRMdhYk37LYYtPJAqtmAWcKaiiWURIuPja8QqufetFiCIHiU8HmF/6f10iWMht6fPlgyspG0xhVNXPSS4Tfr/yiNIXWKjEyPt6LaTKArMNLHh0iCGkXTUg8QTfy6ZKVnsKxpsJz2FBmV9yIOSpyqyt/SaMi1gNKCVT0DaVe0/yTmx8FzaNB4BF39t3SBJ9f0aYXTphMoQ8Ne/0DeKuIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PPNirXrhcAMYj68RY+NX+bDfL4qTKj6heBiJw3W28vs=;
 b=ifoJgs1EahXaTFEyMEI2YCOuJDsr511AE9GyqEjczX34VmH33CiEqPJv0NT7POS9vMIB41IDKVGxgBJLDE6f8ml2Rk3SIFJJXAPOblH+v87q2SUMLxsB/zDA+K9h3CZYUahiSBNLPrcvGzCgblfR0f1rJKSxwMrjcVYi0GFr1x7MNnpznSCmMainVbnm+pBD2yB8DJlEgOb8ODs9/Lzx2h8+y4iMPgDboUrqpp9sPXIIS2DAcwNvFTG3KEMPO9lZHzEw+fwbwP52V3qaUWWBCix4a/vIbZz8RrRkIr6HTz3DhOaASXVnAWDOqIdVBdpWd5gKYZ7qsj8uW2rDr+AuKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8282.namprd11.prod.outlook.com (2603:10b6:806:269::11)
 by PH7PR11MB5864.namprd11.prod.outlook.com (2603:10b6:510:136::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.14; Thu, 19 Dec
 2024 20:28:25 +0000
Received: from SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72]) by SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72%5]) with mapi id 15.20.8272.013; Thu, 19 Dec 2024
 20:28:25 +0000
Date: Thu, 19 Dec 2024 15:28:21 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 10/13] drm/xe/guc: Introduce the GuC Buffer Cache
Message-ID: <Z2SB5QFkqAPAiH_u@intel.com>
References: <20241212010141.389-1-michal.wajdeczko@intel.com>
 <20241212010141.389-11-michal.wajdeczko@intel.com>
 <Z1pY8LNHWTWFm+4f@lstrano-desk.jf.intel.com>
 <c6578aa3-1449-4469-8e4c-b7231e81529b@intel.com>
 <Z1x/Dd9WaaKTcABC@lstrano-desk.jf.intel.com>
 <Z1yVX8wtuPn_6X9V@intel.com>
 <05d474ac-9d04-4c2e-9f0b-e24eb39fef39@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <05d474ac-9d04-4c2e-9f0b-e24eb39fef39@intel.com>
X-ClientProxiedBy: MW4PR04CA0264.namprd04.prod.outlook.com
 (2603:10b6:303:88::29) To SN7PR11MB8282.namprd11.prod.outlook.com
 (2603:10b6:806:269::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8282:EE_|PH7PR11MB5864:EE_
X-MS-Office365-Filtering-Correlation-Id: 24bba05a-4c71-405f-d46e-08dd206bb075
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?XhzMi4gtLvfvCeGo8Vu1v2KrelpJUqTSo80JRiqxogSQh11TWhFcPgVxgr?=
 =?iso-8859-1?Q?eDfGIaOFECiyZYCmNiEFsu1xZfJCWceIZy6E+LSf1QUV2Y9T+1xi9a/UZK?=
 =?iso-8859-1?Q?CQTP3a2nWqq0jpyO/hTVqu00RtVdRxiymFgpHT2jRm3jiFCX6W4RTG5PqK?=
 =?iso-8859-1?Q?T0/Oss6XCgqcfQQDQadBcvkpP6CHNlcJfIkiiBkOBLnAtWWM198BotRNwA?=
 =?iso-8859-1?Q?8zki8tagrWUPHLCzzPg0k8Vl77c6a6Rm71uicgg6B2uP1/f3nxPm8Hjxcf?=
 =?iso-8859-1?Q?0L6qz8ZND1FIijYIJ6/AJuf7LDaeu8b+9uHe/BRYiOtaSg7bmDmjVAq8m0?=
 =?iso-8859-1?Q?KMOxyPVYXXEKcByYBpTyNAFtqpeVttYQ2JBIDgEYddsiLuUL2/5Bl9AsBw?=
 =?iso-8859-1?Q?M2vZQAmULbw9KU1+rOZ0sD9h8Zor0BSaXNOmSAWVKeCnBonmX0cribAJ5n?=
 =?iso-8859-1?Q?+p8odcOr/+cJ7hDyPzDsQMzf1fB5baLk2Zjtt7SVsg9Cz4s+V6zV1ljgRL?=
 =?iso-8859-1?Q?NpS90qun8FhFy7LzWWAEKgEPeIaAKprdkfghUg2q+CLpqeZG+Gz3rxJzb1?=
 =?iso-8859-1?Q?yrxuBIhr5uJrO8WYkK3Yme6JUDcAjFEhgmXb0FpGjM3NNZqSk+osZ27pKV?=
 =?iso-8859-1?Q?9PU515bgH349ng9q8xgwEJCZ+LrgOE8IWUHwwbaZBNi5jOVM3AXgAjXjaQ?=
 =?iso-8859-1?Q?kKPAuu6nEAw5AZKpuW0w35eZVAzPKxGnav6KAL9EvMlRu47t/YSebG0/wy?=
 =?iso-8859-1?Q?fVdYmXIT4YpCl7JniBJhV6X7A+vHK5Ng4JZBNgcAbWXAbMYmhffl/TVl5k?=
 =?iso-8859-1?Q?UIoy5HpHLe5RDptWLBra/Pjz+HmcABiwatCHaMPFXXwuyWr2Bt8WGL2I0y?=
 =?iso-8859-1?Q?duIB7SGDaK4naljb/K4sD5ZL9lLsRCuNiCATr95jjGbN9NBOG9gKtkcnd3?=
 =?iso-8859-1?Q?QJB1hmQ2GKUe+N3bkdpJEdC26RS2+ftyy2xGnRgeh8WCR572lwF0jseBGV?=
 =?iso-8859-1?Q?kvMnK8h/nVSkgSaSkDoYXdlBt5RTBsUXYKcVPfOxEiWTTBnwxy7RomK3PN?=
 =?iso-8859-1?Q?7W7Z46vFOy5jUdTzjocKOrTa0GCAid7ORctqA8xR7OqwVu/wnkXxoZAwek?=
 =?iso-8859-1?Q?fedXgclkG3/nYOwhDvY7J4nd5Z5uKrTfwSXzoo7C8JfauIOgXgwJ+qTTkK?=
 =?iso-8859-1?Q?s97KUYGS7NxWrFpV8FJ1kRSWZjk+IUofKu0RUx+Flo/he6YSum/mb/eo0T?=
 =?iso-8859-1?Q?xATD38BsP9mOfWy0hWclEUZ/LkdNEjF0E4vQuXNCCiTPnCblUEpz2Mqfg8?=
 =?iso-8859-1?Q?Q4SqP0BZwrqtDkCJW5C+8HoQSQ//mwHtovSNR4AUOfHiq9pNxVXMizX+2K?=
 =?iso-8859-1?Q?8wBxH1v1awZ2qObyV/xeAbS8tMEa4ROGjdLoBIoyKWs6hIPcv72Sqcz9By?=
 =?iso-8859-1?Q?NWIF3DNEn1KyD3bF?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB8282.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?tDMG0g4IAttobiv3eIB4yr7uXqU2BEQJSZPR7f/rIdkcimP9i1/yTmy9jm?=
 =?iso-8859-1?Q?GG1bGW7+amgTRt8AutA4LBqr6Sb70ianTcz6goVa7y+UpStyIgn6dAEwKV?=
 =?iso-8859-1?Q?UaHU0saHP5oJLubHnbIEdmNW39woT4Ww0m/vMeU/80PEewL7Vvn3CUB+X5?=
 =?iso-8859-1?Q?HqUM5qy7xQO1+UwKsAAX1/Z9b5PWiwt8bEOD6cdQDIxce6XoL0d9X5lVAg?=
 =?iso-8859-1?Q?UrEeRN5/SLjf2fJzbtXr1EZMCnHBXGtb1tzrH2kCIOzLTH23ixQByGyEr4?=
 =?iso-8859-1?Q?wGApJo1hC6fPlcsO6Jr9mNblb68NLjvU7+ONX32lrvwOg3FNKKlgiMfbcu?=
 =?iso-8859-1?Q?w74BBV0xFzGOUzgXb97JTVErQmB0A6Db5VzqJyQ4XxWBR36L9EsgnpCNlj?=
 =?iso-8859-1?Q?FpiIpDv2T1VQoks8/e1gecAbGi2kQKgmFRdPfIKftZyNyhPmrbaqbEgO8e?=
 =?iso-8859-1?Q?L8IwA7t8pG/qwBRuI6oWTqMJe/AzPqT1l8tP48Wv5WeoBTbuldwOdh26ha?=
 =?iso-8859-1?Q?aOZWUjnR4zip2bWljMw7RufeKwMS1zs9g/Gdw+ARpugLzgeq26ZZdcShua?=
 =?iso-8859-1?Q?4BNWejfuG6xtjV8pdpc89frprpnoqunRIRf/AsLITOUlNcv3asOF/RxVka?=
 =?iso-8859-1?Q?t2m/5k2FKGGGvDfbolU7HnYrFW1Y+qL/heh4AqyHpqvXhvcgBXJClIwDNB?=
 =?iso-8859-1?Q?yNsWBm+7fYk7wh87WQkG2diRecwl+XNo3i0sHPiPLGIWlTojrLPFGiufhb?=
 =?iso-8859-1?Q?XbpGYWrqaVe3IRAqStdBS2ijOXJflnJ4RfXmrtTzCOznuyeKVqzxMJWFMj?=
 =?iso-8859-1?Q?hya822Fqm1naQNkosT3YRy8Fmd1Xg8LmQdIFj3PaLqf2sScywugE4+QWfm?=
 =?iso-8859-1?Q?VBrBGIz4tQLDH1jlBJzzBjVsGYpxAv7u4ri0CmT3oJMTuq0Oceyb1JRrOQ?=
 =?iso-8859-1?Q?WdYw/lY+xt6o2aZDIFWL+Nxe8t7RLX0BoosdDHkosccoJNWueercWS1QSd?=
 =?iso-8859-1?Q?vxBGT9I2EdRaItDI84BJzOkc4RIsytZJNPLMUMISCdh2K1+kuBGdqUoRI2?=
 =?iso-8859-1?Q?w6fNZr/sHBmosAmw2bldlNDhYZrbSmqRZuSFTRoIspSby37pSkg+mUiB8i?=
 =?iso-8859-1?Q?dGB5+rZHMhQ6aSIP7ue20wFC9vE7fQTJuVX7VtoUcEujjfoqEZr5sOP/nI?=
 =?iso-8859-1?Q?YyJ3rk+pFWXQuiOS4sAQOBGsYW8pma1VOfMFzb0Nm9dhU21QHcLDNYMpk7?=
 =?iso-8859-1?Q?vwJSjUyc7lc2U7E8/Wh+vtA0T7sRKeh6uPJv5lawdET+FiVky+lSgM6fUm?=
 =?iso-8859-1?Q?NVSiGzRyQsqu0g8TFl+CaiKOGOyqV437a+VhMHeZqByjVVjGxOy8lFEhJU?=
 =?iso-8859-1?Q?bAO2L32RaOASc/VhY00qDXPnJaNrOBZQZ97WMe0gj7766swNGgG5QOXaPv?=
 =?iso-8859-1?Q?K28vBbF6+XZYMrhCCo38wx9dZGZP2CNMsNee0edzRUn2zbCCiCKjj+rPwc?=
 =?iso-8859-1?Q?ezGE27iSvMlUZDRgLbV4LtzDfyclGuXjf9e/VoDDuRB8JEF6AvtjOri91H?=
 =?iso-8859-1?Q?RLllXmZY4Y/flCUBFVexOMOYg5CsBQxGplmJ9XfvFDyZqMYlFjB6t8owXV?=
 =?iso-8859-1?Q?1b43spd4YEbjVyt1cRx1sA4BEeIL9aocT+T2691xJzy8H5e5IzM5A/Gg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 24bba05a-4c71-405f-d46e-08dd206bb075
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8282.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 20:28:25.3701 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rj4307DyKom1Ep/FwAG8pAqJBiGXN5oNO35DYzWarmuYeDdFRmGciLurR9dVHsYvYOr/LvCmoO/fiKeiWKdSeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5864
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

On Wed, Dec 18, 2024 at 10:03:51PM +0100, Michal Wajdeczko wrote:
> 
> 
> On 13.12.2024 21:13, Rodrigo Vivi wrote:
> > On Fri, Dec 13, 2024 at 10:38:05AM -0800, Matthew Brost wrote:
> >> On Thu, Dec 12, 2024 at 10:48:34PM +0100, Michal Wajdeczko wrote:
> >>>
> >>>
> >>> On 12.12.2024 04:30, Matthew Brost wrote:
> >>>> On Thu, Dec 12, 2024 at 02:01:38AM +0100, Michal Wajdeczko wrote:
> >>>
> >>> ...
> >>>
> >>>>> diff --git a/drivers/gpu/drm/xe/xe_guc_buf_types.h b/drivers/gpu/drm/xe/xe_guc_buf_types.h
> >>>>> new file mode 100644
> >>>>> index 000000000000..9e123d71c064
> >>>>> --- /dev/null
> >>>>> +++ b/drivers/gpu/drm/xe/xe_guc_buf_types.h
> >>>>> @@ -0,0 +1,28 @@
> >>>>> +/* SPDX-License-Identifier: MIT */
> >>>>> +/*
> >>>>> + * Copyright © 2024 Intel Corporation
> >>>>> + */
> >>>>> +
> >>>>> +#ifndef _XE_GUC_BUF_TYPES_H_
> >>>>> +#define _XE_GUC_BUF_TYPES_H_
> >>>>> +
> >>>>> +struct drm_suballoc;
> >>>>> +struct xe_sa_manager;
> >>>>> +
> >>>>> +/**
> >>>>> + * struct xe_guc_buf_cache - GuC Data Buffer Cache.
> >>>>> + */
> >>>>> +struct xe_guc_buf_cache {
> >>>>> +	/* private: internal sub-allocation manager */
> >>>>
> >>>> I think this generate kerenl doc complaints.
> >>>>
> >>>
> >>> or maybe not, see [1] which says:
> >>>
> >>> "Inside a struct or union description, you can use the private: and
> >>> public: comment tags. Structure fields that are inside a private: area
> >>> are not listed in the generated output documentation."
> >>>
> >>> and CI.hooks is also fine with it
> >>>
> >>> [1] https://www.kernel.org/doc/html/latest/doc-guide/kernel-doc.html#members
> >>>
> >>
> >> Ah, ok. However AFIAK we don't use this style anywhere in Xe so maybe
> >> double check with the maintainers on there preference.
> > 
> > As long as it is in-line member doc comment we should be okay.
> > 
> > But do you intend to expand these 2 structs later? It is kind of strange
> 
> no, they are just simple wrappers around SA types, but allows strict
> type checks to avoid mismatch with ordinary SA objects
> 
> > that they are exported in a _types.h with only 'private' members. In
> > the current way it doesn't look like we need this _types.h at all and
> > only static struct in .h or .c itself....
> 
> can't be static in .c since we need full definition externally
> 
> and IMO we shouldn't define them in .h either as our "rule" is to keep
> all type definitions in _types.h, since some types, xe_guc_buf_cache,
> will be referenced directly by other _types.h files (guc_types.h)

fair enough...

Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> > 
> >>
> >> Matt 
> >>
> >>>> i.e. Should be:
> >>>>
> >>>> /* @sam: private - internal sub-allocation manager */
> >>>>
> >>>>> +	struct xe_sa_manager *sam;
> >>>>> +};
> >>>>> +
> >>>>> +/**
> >>>>> + * struct xe_guc_buf - GuC Data Buffer Reference.
> >>>>> + */
> >>>>> +struct xe_guc_buf {
> >>>>> +	/* private: internal sub-allocation reference */
> >>>>
> >>>> Same here.
> >>>>
> >>>> Matt
> >>>>
> >>>>> +	struct drm_suballoc *sa;
> >>>>> +};
> >>>>> +
> >>>>> +#endif
> 
