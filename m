Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D754C282D1
	for <intel-xe@archiver.kernel.org>; Mon,  3 Mar 2025 18:07:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD13310E3C9;
	Mon,  3 Mar 2025 18:07:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X4/AVOMk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A657110E3C9
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Mar 2025 18:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741025222; x=1772561222;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=FLj6QbYktYr7zx6MxkoUBlF2Y5C/kb5fcs9Ypo7jPLs=;
 b=X4/AVOMkGOXRDh9gJ6cXc6wHk+c/m3zXxXZnmEiW+hEb7Z1aBqOOiMpm
 onVt6UMw/fEnDi+MdF2K/YMB15VLkA/ghLJpnAR1dd5zEcsa7Oa259C5c
 sRRWgtwsDiiYbAK/UMKUejHRx/Rqq9BWWtivdZSsCgLI0vfqvs/t3ucMq
 4lWl1wfRjua9XMdLzjR2UWKZVqH+eliHHGf+RrR+WaqNm/uk/CvZ+AIjt
 pdS2jG1Ke6gPmWrVvQdZpXHNGEyVt8CdVw1/gSIkFVGpQLJhKUqHfNzrQ
 22PZqnb2r1/N/LG8NKOtdHEQ8frb1ublTyjBhxDwOEx7WKBsDNW+Dyasr Q==;
X-CSE-ConnectionGUID: MPZ451hxQDyaZzireeTPVg==
X-CSE-MsgGUID: N4LCjoPZSQ2hKxz8hegPCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="41089549"
X-IronPort-AV: E=Sophos;i="6.13,330,1732608000"; d="scan'208";a="41089549"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2025 10:07:00 -0800
X-CSE-ConnectionGUID: CAyozoG7RqK/6mgb0yBBcg==
X-CSE-MsgGUID: HS1Un/sIRSWXYxRCPMIOXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,330,1732608000"; d="scan'208";a="118603056"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Mar 2025 10:07:00 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 3 Mar 2025 10:06:59 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 3 Mar 2025 10:06:59 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.170)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 3 Mar 2025 10:06:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yOQcCMuaISM57hLmG7TRBB14bNmNH/wlUD+VfedhcThfmZAXJANCA0uMJq3sceV29RSLEOr+YjcokD8nUVGzScmjMenV6MBlLh3orWvTzUuqaIuz7+gdOfAzS0gn03gEuYti7bvq6D3K9NiBBYtW4kumrLt/1m2mWpW5NyfK4z9Bbxf0f/N79dSlNRvbL6GgkLEzOafrH1NfwT+iKLWqo3BVpA6qOsRBrPi2Yp3P4laE4AVAONHSrfiB/gaw0zIDhKwK5yK6j6uN2bME6Q266GS6ns9z7D37HuwpcPbVbExa6xi6SQ8KuQOAarCFZ79dzbL08fEfhMGB/yEsKnfoWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ikRvvUhVvCw8M38icQ4gSp/3Dr9mb8589x2siMvkT1c=;
 b=jocnsN/bplR1T3pvy3kceJxdLokmt2d76bptjkOqdBLdcrBA09/WNPMX8yCVZyt5yJJrHS9QbLu+BjMmOBzJ7QEwR1jX8apa4oUca8SYFH+Tt5UNRYwopV5uTIbmrTwuK7t0Wf4qSwa5Rzwu2r+WPBSEsQZFnE7lGHPlFeTn99M+PXPQuOVPPXelCVEDouAcObeo38ASMk3uZNbFJKtgDb1GaDqEAk5B1k+ktRu4BF9eX2o4vG+rrEzxJYh05732IQ6LAT7EmrdB8K9lozp/cllOYk4Bx6/7wWZi+0ipvTa35SBrFgTt9nFujZuKYQ7ucCtXFGLk9WS7rQwBFcBSAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA0PR11MB4767.namprd11.prod.outlook.com (2603:10b6:806:97::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.29; Mon, 3 Mar
 2025 18:06:56 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8489.025; Mon, 3 Mar 2025
 18:06:56 +0000
Date: Mon, 3 Mar 2025 12:06:53 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, =?utf-8?Q?Micha=C5=82?= Winiarski
 <michal.winiarski@intel.com>, Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH 3/5] drm/xe: Avoid reading RMW registers in emit_wa_job
Message-ID: <3vm7izwczds45yaktuljfpges6rwsf27afgn7esuo6mdwontm5@vqtj3zkmnlmp>
References: <20250303173522.1822-1-michal.wajdeczko@intel.com>
 <20250303173522.1822-4-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250303173522.1822-4-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MW4PR03CA0154.namprd03.prod.outlook.com
 (2603:10b6:303:8d::9) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA0PR11MB4767:EE_
X-MS-Office365-Filtering-Correlation-Id: c5561781-8658-4643-82c7-08dd5a7e2f45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WUxnMlJzN0tsd3VlNUpLSGNJejJTdmJKSWI4elkvVU8zVGptS0hLbGZkdkNM?=
 =?utf-8?B?QnJvL2ZKaGk4NnI0aVBIQXFuSkNxazlqUTlCRXBodmlnaktNU05oTkF0dThP?=
 =?utf-8?B?c0l6clNxcCtUbmZnaU1lV09qNjVIcW9tcG5Eb09MbEYzU1ovSlJKTkpIU1ZH?=
 =?utf-8?B?dmlkcXgrMG1rRVQvSG82RTM1R1VmMVRuOEtlNllBTzFaZHc2QzJ2SE1USWxU?=
 =?utf-8?B?T2htbXkxZG92UGt5d1MvaGR2aDE5ejBkUWY2SEpaNXc2MnpuKytXQjlvS1Nq?=
 =?utf-8?B?dGx4dkE0Sm1sZ2M5RU01MDlXTjJ5NTB4N3hib2taS3QxcUxWOS9waDNlaXM2?=
 =?utf-8?B?cS8zZEtyTGJjWlJlcGtHdmgreFlPSnkzdEhlNUU5eVpNdUtDQ0kyWDMxN1Yy?=
 =?utf-8?B?SElaMEgvOTdBRXlLMmhsUDkveDFiOW1KQkZidHA5TFdWSStia0FpK2pTSXNz?=
 =?utf-8?B?eWV1NlVtTUZGZWo0cnQrNVhFdUs0aVZSVFllVGUwQ041V3pQekxqWmQwaG95?=
 =?utf-8?B?cXV5L3lhNmxIcWloWWtyS0N0dUc1YTl4cDk4Z3YrQXJVU2RKeTRmN3NKN08y?=
 =?utf-8?B?anJJMldhcGltZEx0dVlQVXJST1lVZ05pNHYyTmRyeGMycVdmektWcnAxemRS?=
 =?utf-8?B?Y1F2MlUxRlBERUhVempHNWlXWklQZVdNbHNyZTVab2g3SmNxWjJ1ZmV4a3Zp?=
 =?utf-8?B?TW1hcUViaVBoUTViZUVXaG8yWWJWZm1DUmhNcDN3azUvRTBMd3YyL1hpWmYv?=
 =?utf-8?B?RExrbFVUMWVxeTBqWWxIR2hGSFo5WXNJSXd6Yll1OU5uU0wyWFVzeThEbi9S?=
 =?utf-8?B?QndlL1crR3NPRnU1VzVJQVhiNmM5UGhVSjNVTzlzemJLZFo4UnczWkJkRmxT?=
 =?utf-8?B?M2hBSXBRRjdJL1RlL3EySURTNDAvdkkxaC9NZWxLSVNsdytHdVJzbWpDTVpi?=
 =?utf-8?B?ZzRsMjhzaHJzVEc2dkJvdmtVc3BFeDV1clFSWUVzSExFbWZVUU1obUMwZVpC?=
 =?utf-8?B?ckdpZmtJaStDWGRNK1RiVDJ4OG80QkxYenlDNU1rb3R5eUdxR1c5dEw2cDdZ?=
 =?utf-8?B?WVRhVkVrUDVBeExiTis1Z3I2SEhsaFZ2OXg0NUZIQjlXeXkrejljcHpWRTVQ?=
 =?utf-8?B?RE9uZFF0T3lycDI2dUVjQWd0YUhiU1R2WnBNNGo0QmsvUlA1emhFbzF5Y1p5?=
 =?utf-8?B?aFBYSkZXRTBkd3A3Tm05ajE5OUQrL3JYQmI0bnFKNEovRmJUM0lFWEFBUmVS?=
 =?utf-8?B?WDNUMmV3VGsramhaL2pKN2RLNW4zb2Y2M0ZacE5jcWJrK1FXcnE4ZG12bXp4?=
 =?utf-8?B?YW83UjVxNXpiV3BBeGk2RzV1cWs1eU9NYkQzVit3T1dQV0ttdDl2ZUUvVm9r?=
 =?utf-8?B?UTduenlKazNBelpQY1JGZGVtNktlNFc2eXUwQnZPb3lIbjBNaXRTS2xvZW5T?=
 =?utf-8?B?UWF6VWdkQ2hKeHFsbit4YjRpYjZrZXp0a0VXeGNLbElsbWpDc1ZZUm10T0dT?=
 =?utf-8?B?dzdhUFIrYk9EOWpud3BhVHhWQ0ZhMzArcC9MWTNldnRKdmlGUGMyL1dhVUVu?=
 =?utf-8?B?eTdIdFJJQUhZK0EwWSt5YW10OHNxVVRmUlRLWTZwT1AxRGRmR2tsTU82SHZa?=
 =?utf-8?B?RDBiM1hLQXh6ZDdXQ0R3Nkt5Rmdrdlk0VWJKeit1dUo3QzZxMWtjejlRT29K?=
 =?utf-8?B?WGQ0Z0dKVVZIbnVSNWJYVnpRV09BRjcvRU9LMm9ZbVR0VUoxRlM5K3IvaE54?=
 =?utf-8?B?b01oTERhVkpjT2p4a25heUpoQWltL1VRc2tvYmNsUjV3bFNRQWtWS1pyR1dk?=
 =?utf-8?B?bmZoaWxUVkpzQWs5dUFjRzJtRXdmQlg2UVpxRUdPcjlaeVhoczlad2Eybmd2?=
 =?utf-8?Q?ifvZbqvBBGLjM?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b2NmclVTczJiSXZrbmcrS2NraURiTzlpVHF5Z0VseU80RFYvQ0tlMGliS0Z5?=
 =?utf-8?B?eGxoQzhSSHU2aDFLeE5NNUhkamllME5sTkdmNG8rWm01aU9ZcmxJOHdENllq?=
 =?utf-8?B?QmZ3M25DazlIOVpEb0M5UzJodUZCU2hqRlNJT0tEVEhTVUhxdDdJbURHQUJM?=
 =?utf-8?B?N3pkRU1YcGJCU1NCaXlaVk80L1pDNnJjRE1aWEFYcE5UQ3Y0M1lDbkhvUSta?=
 =?utf-8?B?M3p4Z0VRU2lEMlROT1IyMmRvZWpiT0s1Nll3NWZNcHhlbmNMZC9YZE1KWEtC?=
 =?utf-8?B?RUpnSEdUUUNucG81T3dNOHkyYUxSeWhhUFFtdDUvY2J6VXZ2Z29lUG1ZTEkz?=
 =?utf-8?B?eFR2YnBPK0hDYXdQY1p4VUM1Mk16STVKSGQ0eTRVa1o3SUpYTDRWUGhDLzhX?=
 =?utf-8?B?NXZteUJnckE2blJOYTJEdnhyMy9DR1dMNk9MTnNFdVRXNDlENEt6Y0JVQ2pi?=
 =?utf-8?B?N3JyUkR1aEZNYmtGQjIvYlprQktXcTdqaG9ZS1V4WENGUzMwc2s5ZEFiUnBw?=
 =?utf-8?B?M1ZWVmRjdWpIanFRSzlqL3BGbE1jRnZLZlV1Rm1XQTB6WWFUWjFhanBtcmV4?=
 =?utf-8?B?RXplN015U2Y2WWorVWxTRzRTVHgxSkVRZUdNT0h6TklkOVJDMjk5c2VyOXNx?=
 =?utf-8?B?VjBvT0VjdHJhaHRFSmNQZE5VUWtFQ3d5bk9XcUZhM2gxNzRyZDMxdzdVRVBh?=
 =?utf-8?B?dlZhbjNVdG5WYnB5Uk55YjM2WnEwMW1XNUg0eVQrdDArWmw3bVI4RlREK0Vr?=
 =?utf-8?B?L2xHcW9RZnAyYjhWYjdHZHJRSXVyaFozSC83SDRRWFU3NVh2UjR2bDBjbEFF?=
 =?utf-8?B?enBQOGtOcHhJOHY3UW9HTlpUVFU0ejRMdGgxdVlHSXp3VThJWmNVMHhsVmQx?=
 =?utf-8?B?MkRRVTE5V2lTOGdJUmVaNXN0eGtlQTBGMEQ5aGprQ29PYjUvR0NnZnJVdTM1?=
 =?utf-8?B?Y2hwaTQxWWVHZ2lZNGN5dzZWVFBadlUwNk5SYitiN3FBUE1Fc0lZaVNzTTkv?=
 =?utf-8?B?eitHZVNhWjlSNGh1ZkdzVnA0dGZTTFY5Z1JHdnE4Wml6b3FZeUdPTHNKcDZj?=
 =?utf-8?B?OXhUSW8xQVdCdVRNUmdsR3ZOemlKSTNPQWZPeEdGYmV5Tys3TzhTWjM3VkhU?=
 =?utf-8?B?cnBMbVluRVFTbzRIVWVwdGdZSTBJdEV3dlhLUjczUmh5cHk4dGNGTDI3RmV4?=
 =?utf-8?B?enF4ZHVLaEFjRlRCRjBKUFhuM2dYc3J0WTRhM2JIdnNObS9MSlpBL2NaSVJr?=
 =?utf-8?B?SUpBbVBvMkR0OVdYSkRrTnk4bjhORWVqV1hLQ3UxZVRoaloxOEFXeUxaVmRr?=
 =?utf-8?B?K3RIbDA1U2V6V0ZMam1qcjFLc0IyUWNKb3dlYXpvbTVTUTVGbFYzc3RNVFpC?=
 =?utf-8?B?TmxPRThTY1BDRzI3OUk3TU5QTDQ3QVlUTjc3TWpCeDRkWjdBUU5BVDIrdDhF?=
 =?utf-8?B?OXNwQ2l0VFFwS3grNnc3dTdQcTJGbzBaWnFnR255dXZxWkwwOHJvZTJ0K2wx?=
 =?utf-8?B?R21Xb0plNTk3T0hUaFBJM3FwamZvRzkwN2tiYUZJK2VPbGxUbTFmMndINC9R?=
 =?utf-8?B?UlphUnlhMG91VmtlT25NV1lpaVc4VVR2a1JGOWpURU9BdlhmRU8rZm9uZWdl?=
 =?utf-8?B?a2VyQ2dYeGJnbTVKMDNMM2pQdWFvZGpLeTlUa1Q0cFU4QVplMi9oNmR3Y1k3?=
 =?utf-8?B?NDFqczY4N1JTZVhnWWgzeVNhUEZyREVNMCtNcDkwU0NVQkFVellsOHduTit1?=
 =?utf-8?B?Q2xnaFRlajZ0YmpOL2RUaDRXYUx0SWl0NEdCWXVKelJRekp5dzg5SlhHek0v?=
 =?utf-8?B?akp1ZlppdTh3VmpzMExIRXpNSzR4YnZmQjJLTlNaTXFWVE1pMXlnZXB3elRX?=
 =?utf-8?B?dkFtbm9Yc3FJY2hTNFFVemlSUXhaa1AraWhvRS9EcjhzNTVsVXAzQjdIZFY2?=
 =?utf-8?B?NDRYa0hNQk1qdTRncUJpQTJyeURlY2xWZWJnc3dxRndiUW9aZlBwOFJ3TWF2?=
 =?utf-8?B?cG1xY21Ud0FJYkJuNXdmT1lFSHZ0WkV2WWwzRDVhVDkrUkE2UXJKWWQ2dGd2?=
 =?utf-8?B?cUZtL2VJZGgyaG9PeDl1RHh3TzlpanZhZm1nN0tLTm9iRThwd21DWGFFM1lJ?=
 =?utf-8?B?TmRTbmJFbXRaMDRCNUJBTm9ROWM5ZHcvMjBUSkF0bnJ3N0ZmMTBLTmMrZWFB?=
 =?utf-8?B?TVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c5561781-8658-4643-82c7-08dd5a7e2f45
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2025 18:06:56.4630 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aaSeB/V3Qa2XBxaf39MY5LSGYlk65B/jBBQPgKtwFAh11yIk6Cvj2oejdnYWptXPpqywMflxK6yzIdR+Gsq4mMFJQIA6givehdYUqNAGhPU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4767
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

On Mon, Mar 03, 2025 at 06:35:20PM +0100, Michal Wajdeczko wrote:
>To allow VFs properly handle LRC WAs, we should postpone doing
>all RMW register operations and let them be run by the engine
>itself, since attempt to perform read registers from within the
>driver will fail on the VF. Use MI_MATH and ALU for that.
>
>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>Cc: Michał Winiarski <michal.winiarski@intel.com>
>Cc: Matt Roper <matthew.d.roper@intel.com>
>---
> drivers/gpu/drm/xe/xe_gt.c | 84 ++++++++++++++++++++++++++++----------
> 1 file changed, 63 insertions(+), 21 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>index 10a9e3c72b36..8068b4bc0a09 100644
>--- a/drivers/gpu/drm/xe/xe_gt.c
>+++ b/drivers/gpu/drm/xe/xe_gt.c
>@@ -12,8 +12,10 @@
>
> #include <generated/xe_wa_oob.h>
>
>+#include "instructions/xe_alu_commands.h"
> #include "instructions/xe_gfxpipe_commands.h"
> #include "instructions/xe_mi_commands.h"
>+#include "regs/xe_engine_regs.h"
> #include "regs/xe_gt_regs.h"
> #include "xe_assert.h"
> #include "xe_bb.h"
>@@ -176,15 +178,6 @@ static int emit_nop_job(struct xe_gt *gt, struct xe_exec_queue *q)
> 	return 0;
> }
>
>-/*
>- * Convert back from encoded value to type-safe, only to be used when reg.mcr
>- * is true
>- */
>-static struct xe_reg_mcr to_xe_reg_mcr(const struct xe_reg reg)
>-{
>-	return (const struct xe_reg_mcr){.__reg.raw = reg.raw };
>-}
>-
> static int emit_wa_job(struct xe_gt *gt, struct xe_exec_queue *q)
> {
> 	struct xe_reg_sr *sr = &q->hwe->reg_lrc;
>@@ -194,6 +187,7 @@ static int emit_wa_job(struct xe_gt *gt, struct xe_exec_queue *q)
> 	struct xe_bb *bb;
> 	struct dma_fence *fence;
> 	long timeout;
>+	int count_rmw = 0;
> 	int count = 0;
>
> 	if (q->hwe->class == XE_ENGINE_CLASS_RENDER)
>@@ -206,30 +200,32 @@ static int emit_wa_job(struct xe_gt *gt, struct xe_exec_queue *q)
> 	if (IS_ERR(bb))
> 		return PTR_ERR(bb);
>
>-	xa_for_each(&sr->xa, idx, entry)
>-		++count;
>+	/* count RMW registers as those will be handled separately */
>+	xa_for_each(&sr->xa, idx, entry) {
>+		if (entry->reg.masked || entry->clr_bits == ~0)
>+			++count;
>+		else
>+			++count_rmw;
>+	}
>
>-	if (count) {
>+	if (count || count_rmw)
> 		xe_gt_dbg(gt, "LRC WA %s save-restore batch\n", sr->name);
>
>+	if (count) {
>+		/* emit single LRI with all non RMW regs */
>+
> 		bb->cs[bb->len++] = MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(count);
>
> 		xa_for_each(&sr->xa, idx, entry) {
> 			struct xe_reg reg = entry->reg;
>-			struct xe_reg_mcr reg_mcr = to_xe_reg_mcr(reg);
> 			u32 val;
>
>-			/*
>-			 * Skip reading the register if it's not really needed
>-			 */
> 			if (reg.masked)
> 				val = entry->clr_bits << 16;
>-			else if (entry->clr_bits + 1)
>-				val = (reg.mcr ?
>-				       xe_gt_mcr_unicast_read_any(gt, reg_mcr) :
>-				       xe_mmio_read32(&gt->mmio, reg)) & (~entry->clr_bits);
>-			else
>+			else if (entry->clr_bits == ~0)
> 				val = 0;
>+			else
>+				continue;
>
> 			val |= entry->set_bits;
>
>@@ -239,6 +235,52 @@ static int emit_wa_job(struct xe_gt *gt, struct xe_exec_queue *q)
> 		}
> 	}
>
>+	if (count_rmw) {
>+		/* emit MI_MATH for each RMW reg */
>+
>+		xa_for_each(&sr->xa, idx, entry) {
>+			if (entry->reg.masked || entry->clr_bits == ~0)
>+				continue;

why can't we handle the normal writes here as well and avoid having some
written from the CPU side and some from the GPU side?

Lucas De Marchi
