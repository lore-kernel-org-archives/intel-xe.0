Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C5A3EE3682
	for <intel-xe@archiver.kernel.org>; Thu, 12 Feb 2026 13:36:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B703D10E20E;
	Thu, 12 Feb 2026 13:36:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cRuVv3uY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 501CB10E20E
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Feb 2026 13:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770903394; x=1802439394;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+4eVGaUA/IuHR9njWR/6msndnsRc7MT/PtjoVcm8SYU=;
 b=cRuVv3uY0mF1iVRzhDaz4OOwwMRjsbyy1IJJcYE3s6tShmYUopYjHFA1
 cASbChTDUAvICp+1C2lOj4xK32Vg0UmEyGO7OilixRrFOC0GWbcBcrQQV
 SlVzWYXKi6yIhWRECRv1uazwBPMcHmJMZLGxqcy9off0wkIuKm83X06Vf
 zMp/FI41MmmkAp3WSuwnaq1Gsr45Iy0Qsp0iucRCpgER8nDitgVJdooWZ
 Ha8TMCwH5b7Ta94sCttu053rGGnR72hdHbdmzaYUjCWgvqCkqDTNLURmh
 0NTe8uR6K7eVqSWozCfl8qX1PKFUna2GKBtoiUhnalrQ91CvEdiSYlbdd A==;
X-CSE-ConnectionGUID: vCRnSMFXTA2RCP5EeWXwRQ==
X-CSE-MsgGUID: tq5pxlNZTmGtaqjqEKORSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="72119595"
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; d="scan'208";a="72119595"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2026 05:36:33 -0800
X-CSE-ConnectionGUID: p0s6GSK/SWu+iGKe2w6CIQ==
X-CSE-MsgGUID: nP9IfG+lRlqvh2beS4CPzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; d="scan'208";a="212430378"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2026 05:36:33 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 12 Feb 2026 05:36:33 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 12 Feb 2026 05:36:33 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.50) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 12 Feb 2026 05:36:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TnNj6x59txtDO4DsJNxxKI34EQbU3w7fajN1UQiFm83sWoJhjSTe4ZtNj/iF/cdm+fpxx2ltnyWZGxRFanr6aLZl5mmvjP9H6K8H6PSLkmIHR+hOOP39adpmLz4JoCViY/4yM0D9KjVCEFVotWnhdveVpd/1lBh4eM9TegQWjj1/R9HBPh4dKssAw0VBR9RZRY1ZN0vyX9veWmL0P4nskxTNwLoUW9Ph84qIt8mEq7z2O9ZULvw+5Uv9nxry5LHG0iIkdS9CkTFDum/O+BOl+7YIuaOB7jeSZoj+huVQB37dV5M4zuY8YOIbz6LzsaGbzczqHOt3jZk80gHSbNjJXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5zjSDHUh+reu1n0QTXVXscK8yT7wZBaw2XfBEkU47N8=;
 b=kZC9jXt2/mP9GQFp6oGtaecmiWKZqidaH7AMqOGaqepLXLbUgxTVZE2csrbxHMx2znbf1fVXWsgNz8DE5nci+Apf4p5r7Yw3VvsPTSmXa8JBnwG9JAdMITmbimr4tvnlzSGPMUjKljzdeYoqa/KwuXbbRaaIHwebsIqIB8nt7cbZ8q1xoihC+pG8SveDUqKAoawQuAOpRsBSck3zFq/RAaoRwOC251ggwW7vVTfuD0cN5ZG0B1Q1iohIAV3FVqXx/jk1nIwgEx1aWdLRUwriVIzvuOw8WlP20XeYmIROW/8hHwmeJsj7sdHnLk4zTRUnNwxEzpx9NtqS0kBlL6lZhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6266.namprd11.prod.outlook.com (2603:10b6:208:3e6::12)
 by CO1PR11MB4996.namprd11.prod.outlook.com (2603:10b6:303:90::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 13:36:31 +0000
Received: from IA1PR11MB6266.namprd11.prod.outlook.com
 ([fe80::eda2:e570:4314:8720]) by IA1PR11MB6266.namprd11.prod.outlook.com
 ([fe80::eda2:e570:4314:8720%5]) with mapi id 15.20.9611.012; Thu, 12 Feb 2026
 13:36:31 +0000
From: "Bhadane, Dnyaneshwar" <dnyaneshwar.bhadane@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Roper, Matthew D" <matthew.d.roper@intel.com>
Subject: RE: [PATCH] drm/xe: Stop applying Wa_16018737384 from Xe3 onward
Thread-Topic: [PATCH] drm/xe: Stop applying Wa_16018737384 from Xe3 onward
Thread-Index: AQHcm7DYBYOtjXJef0OY8VMaUDt8GLV/EVwA
Date: Thu, 12 Feb 2026 13:36:31 +0000
Message-ID: <IA1PR11MB6266C00703A6D6E692D50268E260A@IA1PR11MB6266.namprd11.prod.outlook.com>
References: <20260211234735.620087-2-matthew.d.roper@intel.com>
In-Reply-To: <20260211234735.620087-2-matthew.d.roper@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6266:EE_|CO1PR11MB4996:EE_
x-ms-office365-filtering-correlation-id: 84730563-6847-4880-e0e7-08de6a3bbb5f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?A4jt86VJLhNx+m4irnFcUawmxkUrSWS3qXqkcsu1YM1vO9PNM5oBsrA/y7ui?=
 =?us-ascii?Q?f2QwwMR1AS7QD/QjvKtZqe8eLowba4oRvrFftOWJkNDmmjNS4l16r1UPbVcx?=
 =?us-ascii?Q?cMpD1b/nAboABcqhR+T0ZWKcihChNyHJLAEAufh46wSvYMUcQG4UG6af+OKC?=
 =?us-ascii?Q?8/SSk3t5T6YYXcufKv+kG+ASiR9cUs9Dc+8iXMqRc3n1/7N5EK9v4w+zWz2q?=
 =?us-ascii?Q?+Mf3IUeiKmLPfkpUkYbT0gi+6bNVfyh4KFTQs9dLHKJUP5nF6rItufBZQWbl?=
 =?us-ascii?Q?cO5ZxUpxogJcnis8N9FqrIUma7GocHavy1qWPepGz3ONo6Ut6aIkJ3w6p9bq?=
 =?us-ascii?Q?Zr236LgmxzZTyTdzaxaNLAvhHTAxjn8y9+N++UigTlvmhaEb8+6OHy9TsNMD?=
 =?us-ascii?Q?52yN0kwbKFk+oeJY6uJCDDoLYbmRkrQi94ENon8drYhl8OJe7D49XbDc3AGb?=
 =?us-ascii?Q?fMZmpnBVktTz8XDCR8iRImxN13C+CabgHio/OWnVrdmPF8v+SA0pOiRIAWzW?=
 =?us-ascii?Q?l54kEjUMlwJ0MucNIpp7IJW4i2j01/p6EtdfMZEclV9tKQyLxeMDpW0O405j?=
 =?us-ascii?Q?Cxmgr2vBym37Cjt2h6gYSabLYWmGDG3IBHTam7vTH2AZpu3kvKy4BKCPE6uT?=
 =?us-ascii?Q?rJ24Tx6Pts9PsPnJbwXov367E6MXjpZ9SZyzCS/R0YWcoEPNXpMyloqkH6jL?=
 =?us-ascii?Q?fhL0NgIHIgYeejQQVn7TrA3XawZfsr5tx0sdpLDZ2kNSf5iLBoiCsMbyI9rw?=
 =?us-ascii?Q?9Jqqedv9b3xlGi9xU62IyjhqjNCVo1cd+X3VKq9wFs2hhlpFUjNfTnOsHghU?=
 =?us-ascii?Q?jBIqRv4V9nfCDgaHIa2PxPONAc0aGGweW/B/UD+qXP/pBSwq3ZQ0Sv7Hwn/u?=
 =?us-ascii?Q?0x/FgLgmIuEskkTY49o0yUBFnL+uHJ03xCMw1/MV7OUT3JSawlfLE2XXm9V8?=
 =?us-ascii?Q?q8HPRLW7JO5+OooFOn1MYZNebMkKVlLSmjiVxrh8bu+woOFrfLc3lWOPolOo?=
 =?us-ascii?Q?vGtCr3ZARZXTHVwzjTlolxhzIPuhcs5sVK5JE21/JzUHYpvdJm5Hj+7Jx2MG?=
 =?us-ascii?Q?VZ9N4rxH1LnORk7hc2ZTjmneBO/a2oMO97R6QAtKxlt+3ZGWPg4ySKLM3HMu?=
 =?us-ascii?Q?pvQpCBqClkryf2Yci+ASm4J/97K9uhoJ4a4IkB62ECL6CI18A03urHmdcHB9?=
 =?us-ascii?Q?TaVO0V77gLIibv4vsIlAWErD1QKtW7JN+iVCc3JxBncvEHw3BxUU14tEEzf5?=
 =?us-ascii?Q?QR5gnceOQlIVfDzD5clBU0Qmu+NKVLlfxZrCHFCc64z9ACsPaVK/tTrAW8BV?=
 =?us-ascii?Q?NC2V4cIryx3Qb4jktvxMAXuwpv+c6S4HQKRKqRfKLwzN/4EEPCDGWYq58oiR?=
 =?us-ascii?Q?Gk5vEJZP1CzxFdH3flormhXzWRPjp1TqHth40YMwx7PXqUsCbtvemYAiRwKY?=
 =?us-ascii?Q?5WGn6beJbX1PfO22FZKdURE/DD7A25fMxyJ014yCOQR6MpSUJU088nCEgmJg?=
 =?us-ascii?Q?6/XaCOmSUtPVQX9qzag/HCdaUU5sMoGBMcU5aswRt0eHoMj+TiAKxfdDGY+A?=
 =?us-ascii?Q?cuLXwosveUr1aFzEEMngIUI5S4R1ldYsvUdGFR1CTJkcVr/OZqMwS91g0RBp?=
 =?us-ascii?Q?jsqKF9epjaBwgjc0uGandEs=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6266.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?AygVKEGIa/fX3ZfkC+5Q65q7u2CkP5dv0u8TiqWmp2iAk6ol7piHw7d7RfHo?=
 =?us-ascii?Q?zyZ9d5z+Hirg27MTgXgMyZTDd4ISdVIH7FFC3fyQ1eWJ6sapzmBqOicT2WO4?=
 =?us-ascii?Q?H/npnusn7MK693d5aYDYQGOzO96RIOgEaNuA2NP+5wkwTioQvdgKL2BoHuCp?=
 =?us-ascii?Q?6kLULvZwnUNzl4190/Ju1HNg+FxyXr39n3pVqXuTLu5ssZzHc1SFgufu3pMF?=
 =?us-ascii?Q?h1YTEC/pbIe9+w7piUdHWsXDP45jdNZE99R2Lr1Xlu85/Vt/QX3ukkYhKSL0?=
 =?us-ascii?Q?B9wk2ApWatKp30XLQtBGrRneu0jo2a7w8ZeRJba5qDm7vkmq7piQ7VZa8I3t?=
 =?us-ascii?Q?TuPamjlMtzGfT+vydBAr8Der5Lge1oA7ifalAi6tn+Tjvxqw8of5zrOYZajO?=
 =?us-ascii?Q?j1Kr46ew7B1wmL1QhfGjFqVxnf0F37KD1KqArzartC9QI+IMoe0M+vkEKnYZ?=
 =?us-ascii?Q?4+6n32+J7k8Z2kAGIaBPmO7pJNP5tLeTaoEseZY6hGrM4ciYvaGGCrm1NmhG?=
 =?us-ascii?Q?f4ArzMwEIlxjwIRoENRIEvMS3r1CHpr1lS2SCdEZPuNai1nePsy4wAWIsXFN?=
 =?us-ascii?Q?p6qidmAEbzivxl0FmmGiJmJZbn/kPtMZ45FyhFmkwytfXCfKoi/HTLZ8Hd7/?=
 =?us-ascii?Q?vhnIi3MU4RfKSV/roIh4lINqYKgYiw8g6TahhHmCSi7NgjZXqV4TwTro7lEJ?=
 =?us-ascii?Q?QouNG0bCFDiTZSqnM5afUsT2it+vooRo4lQO3yktv0yimEOCN7nYOccvytFO?=
 =?us-ascii?Q?S7wREcEWTp5DE+pXPEwLzxpfLIz6Oi1NSOgeRIO7AXUz55xqe2hDsmGI5h2X?=
 =?us-ascii?Q?lljjmhwKUeYR94nZigtrJsItiUIvHsL/QmDM+iYrplPsQhccsrxWJxfaSKFL?=
 =?us-ascii?Q?Cx289is8egQ0weHZE7h+xo3e+zS/9X+yzj5Kk+X2LqGQFlJc1Q6cwrU+9KmH?=
 =?us-ascii?Q?4TGGkTDxs+L7LlM7sf+GUvL2EFlgOn9eIh8iSfE/v9P/Cok8Joq+3YbIccwx?=
 =?us-ascii?Q?+ZHQwK0HV0ePhzqHP7xjHUu+2rJGpuCEKW1/jh4CCcZ1eFPERSp2UwW5wqnr?=
 =?us-ascii?Q?/0XlhTmEwvCAidChZV88RnpMgAoXzA25DGrHiStVOrVm7iF8aOtCooBMRIny?=
 =?us-ascii?Q?zPkbkKLqTccOtJ40NwNn+fuihBUfGVlCk5nNJ7ONnDg9O3nhQGb+MKVwN4QG?=
 =?us-ascii?Q?6o9anCMtcMWxcWWTf5zx32iwRrkFodXlFhJreOoeZQ7O7Aj9i4qGslruO1JI?=
 =?us-ascii?Q?RHrFGLfEg3WJeVw+dWIhz7S90EC7889cN07lBZK4XNsQkCHOKzQqEHTb1Svy?=
 =?us-ascii?Q?EDPfFWY2xnqNO7nm1RoKeb33cOZad6B4wIcsAvS0SGE4qQotRmfCajuv6O5L?=
 =?us-ascii?Q?VYdkCrMhRYwr7SnhYw2+vjUJnAF9tocOpnDatdPuiTBY/rS3eJJ8GExy+n+g?=
 =?us-ascii?Q?5Oz8GziilpTOWLJtqtCBffL67hjz5dpkloixEJDBTWVs1fGMaxYZ+iegyFYJ?=
 =?us-ascii?Q?P891w8GgVyk64MtMmSbjmJ15jtB4nTi+J+IjhzVaRevx0AqLTILNm/Q4SyUI?=
 =?us-ascii?Q?1RL/ICn4DIvyJ9AidDBgMEZx5PO3mMu7uTj0bir5PosLNjsgTuRlp2H9MksU?=
 =?us-ascii?Q?fC+yUDPyZMbxtDccareljtuIaxSaksOef/wwM1mlLs65SR1/QO3otTgYD/wd?=
 =?us-ascii?Q?xSo+wfCakMGTHsP/DAx33nIPHWE8je7U2Fiw3anK26WVX04YcC61J4NOk8de?=
 =?us-ascii?Q?TP9/3v2F4A=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6266.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84730563-6847-4880-e0e7-08de6a3bbb5f
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Feb 2026 13:36:31.1935 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yHNSxD/exub0g8C4W0hjIQp1AN5Pl7Iv9lXFBjwZmx7CBmaY0LfAoQCzpIvEXSDd1OQohFuH0dOVqytUj60H/QhgIgf3vghM+1yMADTNOxU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4996
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



> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Matt
> Roper
> Sent: Thursday, February 12, 2026 5:18 AM
> To: intel-xe@lists.freedesktop.org
> Cc: Roper, Matthew D <matthew.d.roper@intel.com>
> Subject: [PATCH] drm/xe: Stop applying Wa_16018737384 from Xe3 onward
>=20
> Wa_16018737384 is one of the rare cases where the hardware teams mark a
> workaround as "driver change required" rather than "permanent/temporary
> workaround" in the internal workaround database, signifying that the
> implementation details of the workaround should just be considered standa=
rd
> programming instructions on all platforms going forward.  Cases like this=
 are
> the only time that using XE_RTP_END_VERSION_UNDEFINED as an upper
> bound for a workaround's IP range is warranted and correct.
>=20
> However in this specific case, the register bit in question (0xE4F0[1]) s=
imply no
> longer exists in hardware from Xe3 onward.  Trying to write to that bit o=
n Xe3
> or Xe3p platforms is harmless and just doesn't have any effect, but it's =
possible
> that the register bit could get repurposed to control something else down=
 the
> road on future platforms.  To avoid any surprises in the future we should
> replace the unbounded upper bound in our RTP table with a value that
> accurately reflects that Wa_16018737384 can only apply to Xe2 platforms.
>=20
> Bspec: 56849
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_wa.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c inde=
x
> 843ce9fe7aab..61c4187dc0ae 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -588,7 +588,7 @@ static const struct xe_rtp_entry_sr engine_was[] =3D =
{
>  	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0_UDW,
> XE2_ALLOC_DPA_STARVE_FIX_DIS))
>  	},
>  	{ XE_RTP_NAME("16018737384"),
> -	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001,
> XE_RTP_END_VERSION_UNDEFINED),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2999),
Looks good to me.
Reviewed-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
>  		       FUNC(xe_rtp_match_first_render_or_compute)),
>  	  XE_RTP_ACTIONS(SET(ROW_CHICKEN, EARLY_EOT_DIS))
>  	},
> --
> 2.53.0

