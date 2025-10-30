Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAF68CCF9F8
	for <intel-xe@archiver.kernel.org>; Thu, 30 Oct 2025 08:45:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 723CE10E8B3;
	Thu, 30 Oct 2025 08:45:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XhXo9LoM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E581310E8B3
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Oct 2025 08:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761813946; x=1793349946;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=3ayWQySHpsz/BNYPZEeYDpopBcyLRtLv7Mo+0PeOdq8=;
 b=XhXo9LoM67so5J6CvZXeOmPBOfliwZgkpGjrAuO7PRf18QkciUxS3YnA
 cQK+5lXJDBD4PWwIRmIxML1kj4qSkx+mZ7MW5A057YEZedJL1rWfZd0nD
 ThLM015yJICRMToJ0kARptAKyinhONRIyBs/1k9eZOPVATEhKISBvAW5Y
 U7mDywiraLhKvhipoBKEHnaLySDmFYxbkh01vACNR2V4zvhzijCjRb5yO
 PsdaD2TMXfbjOB7JREp71pDi5a24fVKrmq6ar6S50nxB31zvc1bjsaFYy
 epn9j/nk+MpVl66eGchAvqB+CM7+PbQqwX6BbPTXIR8rRzMHIdB+7zWiS g==;
X-CSE-ConnectionGUID: oAQQ12XfQny9LRIwQjqkgg==
X-CSE-MsgGUID: qO2BLPpLQR6n5NhCla2rrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="67601059"
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; d="scan'208";a="67601059"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 01:45:27 -0700
X-CSE-ConnectionGUID: OinZ3+nKSDevAJ/GuuosCg==
X-CSE-MsgGUID: Q4ltasFQRx2Xk5xIvCsk7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; d="scan'208";a="185552717"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 01:45:25 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 01:45:24 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 30 Oct 2025 01:45:24 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.29) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 01:45:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H6dJA54kXgQbYM9kLLTsXsUnwnX6eDV564hHhgAfClG3RHv/+nUlocm/S4qIm9s4K1sNzFISRKespLGZCEIcJVhvCJMTyLmcGSbcH2TtVEB9JB6YJqQIImGWNwmyQoqOQcFYAblXsIOom6ytgbRMi31mYkJoW2p+0AZ+3oHhivQNcytDbjweBve1OMq2y3+3AxNv/6QSwHTT20ax+p6Taz9+AwG4a1g5hOv4EUlkEFIZjLQtxbwTPe8JVyzmfYO55JZb2Kg6xE9sdpDc/Tnq9KKuUTA0jiwud1TT+cHGD8oa+NUxLQqmyAJuItIQnxal+oEzTcpsCfHhXeX/9sUtkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s1msW4dnbzw6mDt/tkRWopwBGItnADsdh89k060qrVE=;
 b=oiC5TpSlMSpqe3MUuDclGF/NdTQjb6/GLfjGlGfwQJS9dCINOhAdUtQ1uBWB2YhXYFvVLY/8qQPEcdMxvHssMo/9RHAbx+lKUfl0W7N+ORAcFdoxnfJhpC09D0x3vAu/wRIsSosDFGW/DQprzf+hM/p1+SylmL8H39hzdbSsMUG2LW9d9Ei0aEybuByG4XwkEPuci6uOCgjSI0gFbJJyJtAduw6jrt+7YIZcHa7VGHiww9jHpIyrXT+a9hj0MgZbj9aJe1kvmnjRblhlN+pfo/uyXfMYSzK4xZPJb5oV+kPfehNEKnIUbs2sMfE8g76oFdZay9l53G/sTSotlOLIqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by SN7PR11MB7540.namprd11.prod.outlook.com (2603:10b6:806:340::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Thu, 30 Oct
 2025 08:45:22 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.9275.013; Thu, 30 Oct 2025
 08:45:22 +0000
Date: Thu, 30 Oct 2025 09:45:20 +0100
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v2 16/17] drm/xe/pf: Allow to stop and reset VF using sysfs
Message-ID: <20251030084520.thrkyg6cnv6gwahb@intel.com>
References: <20251028175832.184534-1-michal.wajdeczko@intel.com>
 <20251028175832.184534-17-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251028175832.184534-17-michal.wajdeczko@intel.com>
X-ClientProxiedBy: DU6P191CA0020.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:540::27) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|SN7PR11MB7540:EE_
X-MS-Office365-Filtering-Correlation-Id: b98f3ff1-e8d3-4c17-23fd-08de1790a9d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UlZHVFVhQkUyZlpabGtWeUp6eW9nT2VTMTBYQmJMUTdoeWRVQVVTblk4cXpH?=
 =?utf-8?B?c2drQzFxT2VTUEtqbHpBdklGbXFWVFZLcDFjQ0RIZlBDdkpCNjhBeFd5QnBX?=
 =?utf-8?B?Qk9oYmdJUEZ2WHpzVEpDWWV4bEVSSS9iYVkyOG5rcWpLVHREMXk0WG9Calc3?=
 =?utf-8?B?K1UwYmRqN1BieFhGLzNFekk1UWpnWk1vejd6WWo3ZjhUSndkT3BYaGdwYmNK?=
 =?utf-8?B?eEVXUlRxQ1ZzdVBuKzRZbUx2Vnl3N2IvNEhScjQ0UVAvOWhwdUdDVSt6eW9j?=
 =?utf-8?B?YlZBMGJ0dHVRMEtQTjd0YlEweVBmVms4cTJhN0FDN1BtREJXUWozTlhmdUQx?=
 =?utf-8?B?RGgzMFlmZld2OG9PaFlxV3d1MW1acm1MRHhXVFJncklGUXRpUE1FK1ROZTNJ?=
 =?utf-8?B?dHk4ZmNKMnpEblpaSDFqSWEzNUh2Vk0vWEVvSm81NVdqYy9CSm12MndpUTVV?=
 =?utf-8?B?ZUNYMS9GcGk3Z3JlUnRjZDFEcVptMXJsTWVObnFMTVdKRVhudUdodzFmaXNN?=
 =?utf-8?B?bDU2SFZLVWVYaEZxalJrYlB1aU53ZTl0T08xNEVKV3BPcXQ0NXZKUys4L3lC?=
 =?utf-8?B?L3Frb2ZTVkkwQnNxNWxCTFlsVzV5dE5NSU1kSUVtdVRVYmJrNjlKNjMzenR5?=
 =?utf-8?B?MFJBVkx0YmxrR2FHdkoxNmZTVEd2TVZ4Tm8yc2pPS0FvYzVucXhDMHdLOUlN?=
 =?utf-8?B?R1Z0OFB4WmR4TTl2aFUzdnpRVDNUWWo4Wk1lWlB0bkN6QkxuNTFaTnIzZzdi?=
 =?utf-8?B?ejFISklFdWhhQlBleGxZMElMblVtb0ZqOFFyNk40Q05yQzdCOVRpakJxRXVS?=
 =?utf-8?B?akY4OGR3dVRncFE5V2o2SUp2TnRWbFJrUTliMXptZ3hGa1ZBdWttTHg3NVNJ?=
 =?utf-8?B?TzB5SHNkbUdoSTVaSmltbmZOSk5LYThUbTVDbzNyWjRhM24vMUhsa3pTL0RD?=
 =?utf-8?B?eUNYQU5NaUYwZ2t5WGhIMStKeWt0SzMvMW53akxhdkFQRE1UVHVQVUs4a3lk?=
 =?utf-8?B?ckxmU0trVUpmOGdESGV2SUJpWVRNT1RXVWRrNU9jZTdDY2UrZkVmTzhkUGpE?=
 =?utf-8?B?eENHZVBLM0R2c0FGS0RUWW8vMDRrWHY4OUE3OWo1NUlCV05aUytBcFpnS1la?=
 =?utf-8?B?R0tsRCs3YjFvVVE2TkEwdWF4TFJHbUtpRytmazhzbjZmY05KZGtEUU5IWjFo?=
 =?utf-8?B?czVhY25xOW45ei9QSnJaTjI5TUM0eE1OWGNVNE9BUUVNUHFvV2Z6TGZGZUhW?=
 =?utf-8?B?V2FKVlJJN0RYd3N0TEpzcjcwczNIM3owdTUydmpTNDIzUmxqOHcrQlVEV2I1?=
 =?utf-8?B?VUVQN0RNbGtVUGRiQ3BPbkNyQ1loaVZGOFNJa25weUtxMWRUMTltUWVscGdL?=
 =?utf-8?B?VHhmemcwTWdacURSRkE3dDZvbktyRmJiemRPNTE5N2pqK1BkQ0JsMFhPSWZX?=
 =?utf-8?B?Q29VTzZtWG4rRWdMN1JvZS9Mc2NmcW9LMzNmTXpnczhwTEcxOHV2cmEzb1lr?=
 =?utf-8?B?Y1FwU0hqNjNTazIxWi93Q0p6VkFXd1llQ3pjUUtDSnI3TTB4V0NOTnh5amNp?=
 =?utf-8?B?ckI2eWZ0VHlWMDlGV3lVbmNKQ2Q0eTRoeXphb0VwMHBmK0s0NTBXaFhIY256?=
 =?utf-8?B?OW80UWNaMEd2N0RhcUIvR1ZmbENMZHZGZ2VmMG9HcGk5emxXQ2xZUkQvMjBv?=
 =?utf-8?B?SU9HdU1SaW01OTlRcXJHdjlYOW1XR1ZQeWlIQWpiNDZGaGcvZi9ScXlWM0py?=
 =?utf-8?B?a3l4WVMwTURkVTZqRjdkY2FqaVE5djl5WVBvWWJHMDFuMnJBVmpvY0VER2NL?=
 =?utf-8?B?S0hFS3NsMTMySm44b2Y2K3B6K2daUjVjbnpSMU9tcVNuZC9nSmNtajVwN2ZJ?=
 =?utf-8?B?OE51SFNweUhKdzQ2RkVSNS9GVGNGYi9Nc0ZzcUlPUmM2UzVhcG50b3JncEFn?=
 =?utf-8?Q?lib64uGkw4ALI0dF1HsZhF67kdsl//5F?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WFQ5Wi9Rc3doYjZoZExSMUhYbDl3Qjhsek8wUUFxemJBZHIvTlJSczlTNEND?=
 =?utf-8?B?UEJ6N0pldWF0WEZYcjEyNEVQSkVDVjNNUHJCdjhuN2YwVVZvOElYcGFrOWY1?=
 =?utf-8?B?ZjdCNlc0ajV4WXdnSVA3U1lHUmx1UFIxekZDcjNpN0FOSkhhby8vQmhjcGpV?=
 =?utf-8?B?d2xVTjY3dEdMcU9RcW5qQTlIMEd0dElYT2NFM3RPT3BzUVNibitDSktuTzVr?=
 =?utf-8?B?WmNLWVZIRzFHQVJaMG1kb0luRC9QV09ZaVE1V2EvcjZvNXpqdy9aU3dGRzNB?=
 =?utf-8?B?RlJOUHduZDRWMVRGdnFqVGxVcVppY2hZYnd5Sjhqd292eEV2TGN1S3FvZkYr?=
 =?utf-8?B?TjhlSnJEUnFIeVBiZDlMQXpXZzJKbzZxblQrNkcvRUkwRzZ1ZzIrWVNxdi92?=
 =?utf-8?B?c00rWHdoUG0vaGdhSDJMUkZIZ2JtZ1lhZDBqcU9vcmdmUS9VQ2JIYzZFbm9Y?=
 =?utf-8?B?Y2hzYklhMTFzS05EajZZNVBYOWk4ZnFKV3VCcnpWOVYrL29hbEJtVUMwQTdx?=
 =?utf-8?B?WUhoeEdRRWljejRyOE5HY0daMUhQZk93a2JqN3lnSkRtSm56RTl5cmdMNEFr?=
 =?utf-8?B?cjZsM1Y5eGVZZ1lkUVZUbXVoZjNOMlU1NldCckI5UFJiK3N1emphM2s0ZFRi?=
 =?utf-8?B?MHBGQWwwdDNYNUtKNndpOTdoVk42WXlMUkt6WksxMDVSTjM5dlpKbnNmOUpH?=
 =?utf-8?B?czg4blBNWWxIbGtRNnVrdEpzaGtEYlRkK3FoVDVTSHJJalZnc3lSemF0dEJB?=
 =?utf-8?B?K01XNW1mRGZlemx6aGEycldiUUE4QlFXanRjV0pvSVFkcFpZQW05c1RxbXVX?=
 =?utf-8?B?Ujk3ZDNvUndtU0QyVGtMUS80dG95RGRDQ2xQRmpPK3QwSkdReDI2UTFpTUhR?=
 =?utf-8?B?cGdpWnJJV0FwQ0tjMHYxb3JSN1pYS0VmT1Fic2hWNVlFd0Q1T3pXN2twMlNw?=
 =?utf-8?B?R25DbjZGM0tpM2lZY3BWd0hvUmtCa3djS29YQVRrcy9XZjBJc25jb3V4dGZG?=
 =?utf-8?B?TGdkbUtaeXp2bk1PUDFZdlppY0h4d1ZESkpFempuY3hNaUVBdWR2T0oxbElZ?=
 =?utf-8?B?UkZ0RzZMZm5PWlhSWHN5d282YkpSQkx0MExFY3FxM1NQa0RZckRIMU9uS2Nx?=
 =?utf-8?B?MktiVzlHRWY5Q1FVNVVJMVdsczBwUG1Cb1FkZklucU9VZjdpV3hnaE50VS93?=
 =?utf-8?B?R2Q0M3pQSWlIMEFMMkNCQVpOREdiYlkvWUxEeFEydmVKMmNXanNBMENzSkk1?=
 =?utf-8?B?TEdVYmZucUtzSVF4eVBONW1MK0tCTUV6eDN0NGJBRDJrVldNdnh6bGFxUldk?=
 =?utf-8?B?WmRxcUFIOVFKaDBnVnl4UjZ2cTlhaE0xNWxZK2pKZGpQQUxwYkZrOStMNkhz?=
 =?utf-8?B?UkM5b2tsQUFDb1pJTytZMlU2eUpTOGg1aVdTb1pGRjU2cHVrN2Y0SXlxZ3pt?=
 =?utf-8?B?K2lVdWhWN2laaFVKMlN5N1ZLTEJSWGhaeUZNcHNPUHlpeVQvdWliNEdtT3lo?=
 =?utf-8?B?WEJ2VHFQcXRGMmYrN0ZNSC96TEVyYlozc3RMUUNzVTRzTG9sSlYxNXluMzJS?=
 =?utf-8?B?WTFDbC83Ni9vV1VvYlhIR2NIQTlOV3prM1BnTmpXbnpIM3pSV21Ec3M3MFVD?=
 =?utf-8?B?dlV6bStLUktVRnRqTFZRbFBhMGFhMHo2dU1jN3FQTEtsak1wVkFVUmkxUUR6?=
 =?utf-8?B?cnRnL3p3bHFlRjNtT2U1NHF1OTQ5NUgwbUhRQkVwUUxHRy9MUXFZSG1hOVZN?=
 =?utf-8?B?TmRWbW1Sd1BsTWVYakJqYktRdTMzQTRISE1YQnQ5UjRMSjkxTWU3WFhjZUVF?=
 =?utf-8?B?L29iWlpZVUhEdVJEbm55bWFZYXNRZ3JDYTNHTGxmMnoxM0l4dWltUnRZdnZQ?=
 =?utf-8?B?bHZHNjRYZk16U0pQbWtBdzRQc2RDVDE2eUpxOUZoVWdOcTZVanhrcEtlbjFi?=
 =?utf-8?B?aWNaUm5Jd3JGandLeVZUVVdqeVU2djdRSFFVNE5uK0RQUUVUcVJVVGdjY0FN?=
 =?utf-8?B?cHVSZnRpM0Vsa0F3UXJEUEJMNjJ4NndGMVpTT1dlVzRNR09VaU1YQnJiaU5N?=
 =?utf-8?B?VFlkUFFIUmZsTkQyTUdpbDBHSEtnOEwwQVlZUUdhdUE3cytGa3Y4Z0hrMEhs?=
 =?utf-8?B?eXhpZWlTelRQb2ZHZ2FEaHV2cjN4VGlmUmU4WkxXc0xSejBIMDd2WkVwZSta?=
 =?utf-8?B?Qnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b98f3ff1-e8d3-4c17-23fd-08de1790a9d4
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 08:45:22.6873 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V5mesZIVyDlGEeLq35i5kIp1YpmsytdnVGf2ZlfUQ2frBzIFuqHE53OLFlYvgQBerZRLJpcpOW2fCo44VY4XOwqeiUQgX8tnYuj3qb5qEN4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7540
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on wto [2025-paź-28 18:58:30 +0100]:

drm/xe/pf: Allow to stop and reset VF using sysfs

When you removed the reset in v2, is the commit name still valid?

> It is expected that VFs activity will be monitored and in some
> cases admin might want to silence specific VF without killing
> the VM where it was attached.
> 
> Add write-only attribute to stop GuC scheduling at VFs level.
> 
>   /sys/bus/pci/drivers/xe/BDF/
>   ├── sriov_admin/
>       ├── vf1/
>       │   └── stop		[WO] bool
>       ├── vf2/
>       │   └── stop		[WO] bool
> 
> Writing "1" or "y" (or whatever is recognized by the strtobool()
> function) to this file will trigger the change of the VF state
> to STOP (GuC will stop servicing the VF). To go back to a READY
> state (to allow GuC to service this VF again) the VF FLR must be
> triggered (which can be done by writing 1 to device/reset file).
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
> v2: drop reset file (Rodrigo, Lucas)
> ---
>  drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c | 49 ++++++++++++++++++++++++++
>  1 file changed, 49 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c b/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c
> index 360b0ffd9cb4..3a8c488d183c 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c
> @@ -13,6 +13,7 @@
>  #include "xe_pm.h"
>  #include "xe_sriov.h"
>  #include "xe_sriov_pf.h"
> +#include "xe_sriov_pf_control.h"
>  #include "xe_sriov_pf_helpers.h"
>  #include "xe_sriov_pf_provision.h"
>  #include "xe_sriov_pf_sysfs.h"
> @@ -52,6 +53,7 @@ static int emit_choice(char *buf, int choice, const char * const *array, size_t
>   *     ├── vf1/
>   *     │   ├── ...
>   *     │   ├── device -> ../../../BDF.1
> + *     │   ├── stop
>   *     │   └── profile
>   *     │       ├── exec_quantum_ms
>   *     │       ├── preempt_timeout_us
> @@ -291,8 +293,55 @@ static const struct attribute_group profile_vf_attr_group = {
>  	.is_visible = profile_vf_attr_is_visible,
>  };
>  
> +#define DEFINE_SIMPLE_CONTROL_SRIOV_VF_ATTR(NAME)					\
> +											\
> +static ssize_t xe_sriov_vf_attr_##NAME##_store(struct xe_device *xe, unsigned int vfid,	\
> +					       const char *buf, size_t count)		\
> +{											\
> +	bool yes;									\
> +	int err;									\
> +											\
> +	if (!vfid)									\
> +		return -EPERM;								\
> +											\
> +	err = kstrtobool(buf, &yes);							\
> +	if (err)									\
> +		return err;								\
> +	if (!yes)									\
> +		return count;								\
> +											\
> +	err = xe_sriov_pf_control_##NAME##_vf(xe, vfid);				\
> +	return err ?: count;								\
> +}											\
> +											\
> +static XE_SRIOV_VF_ATTR_WO(NAME)
> +
> +DEFINE_SIMPLE_CONTROL_SRIOV_VF_ATTR(stop);
> +
> +static struct attribute *control_vf_attrs[] = {
> +	&xe_sriov_vf_attr_stop.attr,
> +	NULL
> +};
> +
> +static umode_t control_vf_attr_is_visible(struct kobject *kobj,
> +					  struct attribute *attr, int index)
> +{
> +	struct xe_sriov_kobj *vkobj = to_xe_sriov_kobj(kobj);
> +
> +	if (vkobj->vfid == PFID)
> +		return 0;
> +
> +	return attr->mode;
> +}
> +
> +static const struct attribute_group control_vf_attr_group = {
> +	.attrs = control_vf_attrs,
> +	.is_visible = control_vf_attr_is_visible,
> +};
> +
>  static const struct attribute_group *xe_sriov_vf_attr_groups[] = {
>  	&profile_vf_attr_group,
> +	&control_vf_attr_group,
>  	NULL
>  };
>  
One comment about the patch name
besides, it looks good:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

> -- 
> 2.47.1
> 

-- 
