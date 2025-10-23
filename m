Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A4D4CCD193
	for <intel-xe@archiver.kernel.org>; Thu, 23 Oct 2025 17:18:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 194B310E002;
	Thu, 23 Oct 2025 17:18:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dkAhb1k8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CA6610E002
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Oct 2025 17:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761239889; x=1792775889;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=AAfBzvqgP/rXuKx5GHKD7a6vDU7SFqncyCsaUk0FLDc=;
 b=dkAhb1k8nOLVaWiJHjfCrcxa15dIkpGdwVYMRWY7+JFuhrQNlhYVpURS
 gf9z+oG5INMchZJboWiPBGFL7H0QpgifJanouku5lQPAYBjCBZP0oEss4
 5sxj+po5ydCzOynARw5ZPWpQsDbyJ5CM6s3GjRU3HRwNnIVzkxd++Oqj/
 SmmiWtJUn+PtgmEgze+ZMrTRo6M/BRxefC496zqskcqXg/96e8g4iBqoO
 ANDu2OuPZi66dyXUdg1Elb4rDYDKhEplzEzw2SID/iRAj1yy93lZk6uQh
 slHkYZ+JXYlNYg2HeWR0vNpreGSHuPGgmIA94ZxXwqfbkse/5AfjrADIX g==;
X-CSE-ConnectionGUID: MFpPtFJFReOktejkIR6XpQ==
X-CSE-MsgGUID: l4NQNBINQ8+nxU87KgpAzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63321320"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="63321320"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 10:18:08 -0700
X-CSE-ConnectionGUID: xbTE7IY5TySaPVOWJpt6jQ==
X-CSE-MsgGUID: amDLvlwOSxqZDocFfiCU8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,250,1754982000"; d="scan'208";a="221405789"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 10:18:09 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 23 Oct 2025 10:18:08 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 23 Oct 2025 10:18:08 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.45) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 23 Oct 2025 10:18:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vVXwMrF1qFRiDfstUNkPNIykw0BS2K71BS6x6u0+ENeTxN9sU9T8WYvNjjwY4PRZupepwM6tE/kHAF9TtKxQVq0pHhQFe2c665asssRYWX1F/NS6bUvz7mJB+jb78IPWXrYuOl4bHVJCeD+eLMtJBHk7+Ue/lpqIREv7dctxHjbQ+rknKNrDl/oHHySQQZt54Q4mmj4wndqc38XYf7AgB6mQowYdU3hqbJdCNxOMiLx3Q+C5slGfz4fInxNabF1ckvGxptQ5EO9XA0Df1QhlfKm3vFYgmYk8IzZiZdVXPPJ9fTCwF+SDt86nwDFav73VOXsdSKdOSJz3gSGTBLOiPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AAfBzvqgP/rXuKx5GHKD7a6vDU7SFqncyCsaUk0FLDc=;
 b=yXz3BVI7AxaH8C8va1/exbECI281TNl6aKl4CkRuuI8x1S+tRGp9iQwUX3/ABLuw/aRDzZfjUBUfdRVTMEJpu+lruf5SNyAIc2eoBSjvdBiFY53WKnWwWDT8G5Zoc9QDYj4hgMddAvdg388O3gKi9QNFJ25KC9VKlZqpvV65K3z/0XtKS7Fs2fFSesPIGlUCwNoZQrIROukNB4L6wLmTRx6/RI9e/Sf8iFaT07r2JqYbZjmIAdTnmtbII1P+9u9T5ZBxIvnaIoVULesMc9CJCbBlxYjaGAqYWxZYVw6fhoQICen/8aR1xCRci0t0jkrmLAa/kksx8j7W4XGLG0nlIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 SN7PR11MB6897.namprd11.prod.outlook.com (2603:10b6:806:2a5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Thu, 23 Oct
 2025 17:18:05 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%5]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 17:18:05 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Dong, 
 Zhanjun" <zhanjun.dong@intel.com>, "Lin, Shuicheng"
 <shuicheng.lin@intel.com>, "Vishwanathapura, Niranjana"
 <niranjana.vishwanathapura@intel.com>
Subject: Re: [PATCH 5/7] drm/xe: Correct migration VM teardown order
Thread-Topic: [PATCH 5/7] drm/xe: Correct migration VM teardown order
Thread-Index: AQHcQgrkdh8FpK26tkSFJSjNCEKQFbTOoUgAgAFcnQA=
Date: Thu, 23 Oct 2025 17:18:05 +0000
Message-ID: <5229a4a78156e9b694914782fa95d0bc45fc25d0.camel@intel.com>
References: <20251020214529.354365-1-stuart.summers@intel.com>
 <20251020214529.354365-6-stuart.summers@intel.com>
 <aPk+3LWPfFeLmwU9@lstrano-desk.jf.intel.com>
In-Reply-To: <aPk+3LWPfFeLmwU9@lstrano-desk.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|SN7PR11MB6897:EE_
x-ms-office365-filtering-correlation-id: 60eacf22-8de3-4225-c1cf-08de1258213a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?dU5Rbjlma3BrMXVsTVlTeGF2Nys5LzFEU1ZocVZhdVc3WWdDdDNaMUFHMGRV?=
 =?utf-8?B?TkdZYXhaNmNwQU9RSmFzL29LOW4xeDRNeVZIZWY3dXJnbmVUU1pqRWJMUmRI?=
 =?utf-8?B?NDZLN0ZsWGVZMU9Lbnh0aGZ5YmNidSsvSEtYYlhWb21HODFibHM0VkpkSEJr?=
 =?utf-8?B?ZEJDL3RGUEdndWNvbXd6N0VYWUkyVFJIOGUvMVFwQVoxZUhQWThOVHhxWHVL?=
 =?utf-8?B?MFJnK3JTR2lWRmhscUlFY2JRM2RUd05LWWF3UW1yK1J5LzlLb3NGK29GdE1O?=
 =?utf-8?B?VW9ZTzF3T2NDMmhlMFlWWFBVT0FRRHJSOWFhOTkrY1pqaWUwZUlreExzVHlH?=
 =?utf-8?B?aEtOZWwwa0I1U3ZZemJhSVRmM2xnRUh4RTBrZy9jV2grZGFpT081ZUZ3aEEx?=
 =?utf-8?B?TUNSemJuUDNWRVZGNW5wdFpjTVcvdWRPV2prUGJUaWs5VHlPZjRad2FXRHVw?=
 =?utf-8?B?ZVd0ejJvWVBYR0x0MnI3L1loNlY1VmdwSkRqcWhZWmxIeU5WM0ExcUdRbEgw?=
 =?utf-8?B?Q2szRTM2WGhzbzR3dU9zb045N05lbDJzYlFrd3czMEMxUHpJdkg4K3Fhb3FP?=
 =?utf-8?B?aGlMT2lWakF3UTNRaUpkVW9kbkFNKytudk9kM2RIenV3RVRONXFBZVNpVkhr?=
 =?utf-8?B?WTk0eW5aS1Y4SWdsUGRoVE9sTlBETFE2MExhQjNXbWxRYjJ6a25kTVFsMDhW?=
 =?utf-8?B?ZFZ3QzlBVTE0b3hnZXRMbXp3VFprWkNvL2lScGQ5WUpUMkNpT2VyV2JpeXdx?=
 =?utf-8?B?L1YwL1B1R2VSckk3cmU3TjZwWXd0aVRQZkVwekpvWGk1T1pzeGUxVnhzSnJt?=
 =?utf-8?B?eEZla3VXZHV2VzNwdGxCNHBqNUxBckZkaHcyYkRKUUxyOUJXUXVOUXJPRlVq?=
 =?utf-8?B?YXZyYkloL1VGY2lLMXVoVHZiKytUSE9vZmJhbzJXRTdoQ2VvM0hhWkpSTHJy?=
 =?utf-8?B?VGFCV3JGeCs4ZU5Zb1ZueUwxc1VXUUhVb202V0IzYStWK09SYUhXaWJDUWNn?=
 =?utf-8?B?ZUtpaTJETHNROWczdkJaMTNCMU1JdDZiRkFJeG9GWTF4Y3BOQS93OGg1a08w?=
 =?utf-8?B?R21Md3pZV1d4RllESEZRWlh1bE1rNmRYTURhVHhpVUlET1RTbCtlaGw0QjZS?=
 =?utf-8?B?N0ZSdnNwU2pXdzhqZDFSZ3hBOFZRWGtHZGluUWs3QW9nY0JnVEYxMEhzdkdn?=
 =?utf-8?B?eTRsRlcvY3M1bEcxTEpha0poQ1FFWEFHSHA0c1ZTam5CbVI5SnJFZ24rM3N1?=
 =?utf-8?B?QVdTTzc4TnlnV1FDZEFQRVJNejlsdFZsZVYwUUZUMDRpVVh2TTJob1d5cE9X?=
 =?utf-8?B?bWJLaE1kVWpyNnllVkZHTVZjcUJpQlVpcm02NzlPRTY0TmEvT2QySGt4WmVp?=
 =?utf-8?B?aUtIdlBSb2g2NVI2VUoyMzR1SG1tSEh6V1h2Q29mc1p2QUpHRUhDcEtHMDNx?=
 =?utf-8?B?Z0JHdWhOellxOTdzempEcGNhWlBzc3NEUm5OVmJ1azBOQWJvVVRWTDd0c1hs?=
 =?utf-8?B?bCsxdGd2bGdJQzQwZ1FGbDdsTE11aWx4RmE3bDlHaVFxbkdYM0ZVaXEyd1NR?=
 =?utf-8?B?aWtmRmpEdEliY2dpRUxzdWZ5b3ZsR3g5dzlpKzg1NTRXSUpJSnRmd2JmZGtK?=
 =?utf-8?B?NDV1YjIreHo0Qm14ZGtBRWxMYTFvOENub2VFOFRjQitEVVR6dkdJSURXa0V2?=
 =?utf-8?B?bHl1Zi9rOWt0aWdtNjE3VEh1VVNpSnJJaEUwVE1VWHlneVBoemoyRnFDWU1C?=
 =?utf-8?B?ek51a3JWUXYzQnRBVlJuNzV3VlQzKzlyd2xObFcwcFBLQTFMQW1YNm80eUdM?=
 =?utf-8?B?azF2emtQWmhwTHdRZU5SMGxYVXRkcVpRQTRWSHNEWHZxZmpRd1p0VWlxUXRM?=
 =?utf-8?B?elJsSVZjcTZwRW0zdytjMjR4QThjYlZhS2NRNG81OVVxNWxOdFBSWCt1b0hG?=
 =?utf-8?B?YitoeHpJak16QytOaWVMRm1vN21lRVBrQSt4OU5xaGY4UXR6SEo4NXRIaUZp?=
 =?utf-8?B?cEdabEpUTTNnYytqZzkyZDUvK3pCSnJpY2NWaFdRaTZpL0QzSTNEWjNydXJw?=
 =?utf-8?Q?iNBUGK?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aVNCVlVHSGJmMkR5alBCcGpzVkNQZkI4c3d4YUNFOUEzZ2NvVzRUclpKTThs?=
 =?utf-8?B?ZmFTZS9odTFSaWF4clNNcW9UZ3R4aUdWekJpN3hGOGRhQXF2SGZxVjhWQ1FP?=
 =?utf-8?B?QlpYck16VDBhMXFWTXErUC9YUEJHYUVpcUtydkY3THpnWk9GbFRvWUJXV29D?=
 =?utf-8?B?RElZcHVhamdlVzk5UFFWMHlFUFhUMXVud0tra1FhZFpzQzFVUi9FbkFKVU1P?=
 =?utf-8?B?SlBROUxMTlc5Vk83VEhSelBVN1EwaXVTQktkSHhnMGxDTDJ5WEZUbktoV1dU?=
 =?utf-8?B?bk9JdjFIWUU5QmRNbFk2dlN2WjVpc3JuL3VjTytGekFUdnd2WVNSWkFZUU14?=
 =?utf-8?B?a3ZlMkhTQkdLMjhUWGgxdFFETDFWZVYxcnRaczduRmkwVkpZRTIwSXBXTlhx?=
 =?utf-8?B?b0xDak1CWkQ5bng2bVdZVVk5MTRxTkRNeVR5dmdIRjFsUjNOUGg2aEd2Vmpu?=
 =?utf-8?B?VHpsU1NaU1NOMkV1RDR4MFQ3c0htVEU0ZDNzOTQ0TEZsVFlwRUJpTDF0Nmt0?=
 =?utf-8?B?aUdIanlQVG9WbThacEh0TXpyRFNjU0xzcGY0bi93M3UzNjJMRHlGc0ZJRE1m?=
 =?utf-8?B?eG9ud2Q0bmFCUFltZjZSMVFFdDhNaWFxSlpkRFp4dkZKNUpZcjI5YXRkK0Fi?=
 =?utf-8?B?Z0RFV0tNM3dZeTVERHJTc0czcHh4dHdjS0JuTGo1WTFUOCtwanFnMk1ZVnBH?=
 =?utf-8?B?eTl4THZ5N3E0MDNDSURrRVhWRmIrWTh4dGk5VS9OdnRhUUk2dGtmRDdwSUVK?=
 =?utf-8?B?Y3czMktxck9MU2E2cmtBWTdvVmZjNUtrdGg5YkRkY2JKNnFEUVpIVDd0WEZ1?=
 =?utf-8?B?azJyVzlxM3ByZCtmZHM5TGxHWmlVd3Q4SWs5MWxrQ3pUemtOR1pKeXhzUkFJ?=
 =?utf-8?B?bDNId3NrcHhoS21mTzcweVVXa3RFM2ZHWWYyVEw0MWw3UFZXZzJCWDJ0TmRQ?=
 =?utf-8?B?SWNybDRYS3BiVjBuM0hBanVSd2ZZU3RMcXpDelpjODlkK0RKV0tFaFplQjlo?=
 =?utf-8?B?TnpCdENSSlRGNVB1YUhxUjdCMGJBVW4vWkZTTUx6THUrdmpEK3RUOTRRbjZB?=
 =?utf-8?B?MlZoVVZqd2xBMk1lSVFmaitaZkZKNE1OelRURU9rdk5kcHErRjEySjFMbjh1?=
 =?utf-8?B?eWNKRzY0Um5oMS9mdUpyTTNFcUVVMkRka3NDNU1SWDZQQmg1ZFE0ZTJRZlJB?=
 =?utf-8?B?MWllTVJzeDlpM3FHQzVtL1VBbVBMYTVmRWlFc1AyMUVGTGV4WUVvekRBaDR3?=
 =?utf-8?B?NXJuU3N6SDV1bnVtL2pDK3NPZ3RURUVVdkJoWUlzdzE0QTFaMTZTNFVMUjV1?=
 =?utf-8?B?aFo3OXBHUHYrZVkyU0lTMmtrY3ZTRC9oWTI5WHhBQVRrb280Tm1UaDQzTFUy?=
 =?utf-8?B?SDN3bjBqcnBjN2hwN0hUTzZwVDVTajIyNGIvUXJGUEEwL2hBOUFvTVIvbXNl?=
 =?utf-8?B?ZVpFZnJHeXpYd1Z4dm5qS0FkQTZLYUh6aWQ0UEJNWWJ0S1NxSG16dTkwVlNi?=
 =?utf-8?B?ejYyOXFVN21rMG9rWkF3dFFJMUdjYlpRSURsQlQ5em9mRVFFdzIyMEdLeUZ2?=
 =?utf-8?B?UzJCTDBZOHpvVVlySlF3MTJZa2oxNkUzWE9teE10eitxVTFtclpjV2tiWVhZ?=
 =?utf-8?B?M0lJUGJ1L2Y0RURkNWtIWkl3emlkNjJqWnE2alpwejZDM1crY1FJTVVvd1dT?=
 =?utf-8?B?d1ZXVGxtQ2g4SDh6SWdUSU85QlFBMlFsdHpEcUcyclF1d2phT1VvdXlwRmxO?=
 =?utf-8?B?dEdCaDJwZHJCR0ZMMkZSKzdwdmluNytjTmlVNVlWMWZjMFFEUkNaRy9uMytM?=
 =?utf-8?B?K256WnhPTW8vbEFFb0ZsaDRvUS9hRUlIbVgvV0RqdGJ2Qm4yWFRNbnpSV2pN?=
 =?utf-8?B?M2tyditROTV1S0pKWk0rS0FGWkU1dnUxTnFmcGlBZFFBdGhPazNYRTJFV2oz?=
 =?utf-8?B?S3ZBWlhXTHpFOVdnYnlYcmhlOVRyYUljKzh3SXowQWlvajVobEQzeDZCQzRh?=
 =?utf-8?B?RWFWdGU3cVlDbDVraUwwUmpiT3BEWHF4MHc4RzRxb0wrUHpEdDZXcTY2YnVm?=
 =?utf-8?B?ZDV0OGJjTVRnOGVSWEtyQjBTMHlRWlUyK0lZczlWNGdoZEhEMGNlUTFKTmky?=
 =?utf-8?B?em1xR2ZVd0VmYzZFcmR0SjF5SkJlMzhLZ2RjUHB2Z2h4UW5kMW54MlU5SDNS?=
 =?utf-8?B?VEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DB0A740E5CE4AE4E8E2405F8ED128746@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60eacf22-8de3-4225-c1cf-08de1258213a
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2025 17:18:05.6874 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ikum6qDdz7/RMZYSBqtFq4EYsPHo4OpAf/VhhyLuvhW66K4bZxGna4yAM4UaYDhbtY4ZiokGo8TYw3FhxtV/Tw7EiZEksxXYOyFXkB7buo0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6897
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

T24gV2VkLCAyMDI1LTEwLTIyIGF0IDEzOjMwIC0wNzAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOg0K
PiBPbiBNb24sIE9jdCAyMCwgMjAyNSBhdCAwOTo0NToyN1BNICswMDAwLCBTdHVhcnQgU3VtbWVy
cyB3cm90ZToNCj4gPiBBZGp1c3QgdGhlIHNlcXVlbmNlIG9mIHRoZSBtaWdyYXRpb24gdGVhcmRv
d24gdG8gbWF0Y2ggd2hhdA0KPiA+IGlzIGhhcHBlbmluZyBpbiB0aGUgaW5pdCgpIGZ1bmN0aW9u
Lg0KPiA+IA0KPiA+IHYyOiBUYWtlIGEgcmVmZXJlbmNlIHRvIHRoZSBtaWdyYXRlIHF1ZXVlIGJl
Zm9yZSBwdXQgKE1hdHQpDQo+ID4gDQo+IA0KPiBZb3UgbmVlZCB0byBzdG9yZSB0aGUgVk0gb24g
dGhlIHN0YWNrLCBub3QgdGhlIHF1ZXVlOw0KPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBTdHVhcnQg
U3VtbWVycyA8c3R1YXJ0LnN1bW1lcnNAaW50ZWwuY29tPg0KPiA+IC0tLQ0KPiA+IMKgZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX21pZ3JhdGUuYyB8IDkgKysrKystLS0tDQo+ID4gwqAxIGZpbGUgY2hh
bmdlZCwgNSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQ0KPiA+IA0KPiA+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfbWlncmF0ZS5jDQo+ID4gYi9kcml2ZXJzL2dwdS9k
cm0veGUveGVfbWlncmF0ZS5jDQo+ID4gaW5kZXggNzM0NWE1YjY1MTY5Li5hZTQyOTE3OTE4ZTUg
MTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX21pZ3JhdGUuYw0KPiA+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9taWdyYXRlLmMNCj4gPiBAQCAtOTEsMTcgKzkxLDE4
IEBAIHN0cnVjdCB4ZV9taWdyYXRlIHsNCj4gPiDCoHN0YXRpYyB2b2lkIHhlX21pZ3JhdGVfZmlu
aSh2b2lkICphcmcpDQo+ID4gwqB7DQo+ID4gwqDCoMKgwqDCoMKgwqDCoHN0cnVjdCB4ZV9taWdy
YXRlICptID0gYXJnOw0KPiA+ICvCoMKgwqDCoMKgwqDCoHN0cnVjdCB4ZV9leGVjX3F1ZXVlICpx
ID0gbS0+cTsNCj4gPiDCoA0KPiA+IC3CoMKgwqDCoMKgwqDCoHhlX3ZtX2xvY2sobS0+cS0+dm0s
IGZhbHNlKTsNCj4gPiArwqDCoMKgwqDCoMKgwqB4ZV92bV9sb2NrKHEtPnZtLCBmYWxzZSk7DQo+
ID4gwqDCoMKgwqDCoMKgwqDCoHhlX2JvX3VucGluKG0tPnB0X2JvKTsNCj4gPiAtwqDCoMKgwqDC
oMKgwqB4ZV92bV91bmxvY2sobS0+cS0+dm0pOw0KPiA+ICvCoMKgwqDCoMKgwqDCoHhlX3ZtX3Vu
bG9jayhxLT52bSk7DQo+ID4gwqANCj4gPiDCoMKgwqDCoMKgwqDCoMKgZG1hX2ZlbmNlX3B1dCht
LT5mZW5jZSk7DQo+ID4gwqDCoMKgwqDCoMKgwqDCoHhlX2JvX3B1dChtLT5wdF9ibyk7DQo+ID4g
wqDCoMKgwqDCoMKgwqDCoGRybV9zdWJhbGxvY19tYW5hZ2VyX2ZpbmkoJm0tPnZtX3VwZGF0ZV9z
YSk7DQo+ID4gwqDCoMKgwqDCoMKgwqDCoG11dGV4X2Rlc3Ryb3koJm0tPmpvYl9tdXRleCk7DQo+
ID4gLcKgwqDCoMKgwqDCoMKgeGVfdm1fY2xvc2VfYW5kX3B1dChtLT5xLT52bSk7DQo+ID4gLcKg
wqDCoMKgwqDCoMKgeGVfZXhlY19xdWV1ZV9wdXQobS0+cSk7DQo+ID4gK8KgwqDCoMKgwqDCoMKg
eGVfZXhlY19xdWV1ZV9wdXQocSk7DQo+IA0KPiBeXl4gVGhpcyBjYW4gZGVzdHJveSB0aGUgJ3En
Lg0KPiANCj4gPiArwqDCoMKgwqDCoMKgwqB4ZV92bV9jbG9zZV9hbmRfcHV0KHEtPnZtKTsNCj4g
DQo+IF5eXiBOb3cgJ3EtPicgY2FuIGRlcmVmZXJlbmNlIGludmFsaWQgbWVtb3J5Lg0KDQpCYWgg
eW91J3JlIHJpZ2h0LCBzb3JyeSBhYm91dCB0aGF0IDooLiBUaGFua3MgZm9yIHRoZSBmZWVkYmFj
ayENCg0KLVN0dWFydA0KDQo+IA0KPiBNYXR0DQo+IA0KPiA+IMKgfQ0KPiA+IMKgDQo+ID4gwqBz
dGF0aWMgdTY0IHhlX21pZ3JhdGVfdm1fYWRkcih1NjQgc2xvdCwgdTMyIGxldmVsKQ0KPiA+IC0t
IA0KPiA+IDIuMzQuMQ0KPiA+IA0KDQo=
