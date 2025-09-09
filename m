Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0110CA0FED
	for <intel-xe@archiver.kernel.org>; Tue,  9 Sep 2025 12:14:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6193210E6EA;
	Tue,  9 Sep 2025 12:14:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KdbAphTd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89DEA10E6EA
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Sep 2025 12:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757420040; x=1788956040;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=U6NHiopTxbcOhFm1/42HUrCh04IuZK+CXTSqIgEHWaw=;
 b=KdbAphTdEqx29sBrDSLSevxkshRsSA2DMtJi90bGio8qsVrpCghNJV7y
 +Afuiaun3Af5mCLF4QsEJQin763GnxckI1kKmK9EaTDgInEBcdlILOuzN
 3c7LKglboP7tbn+Wph6TqhiRYlbrKiLGb/LmpznCcVvtcoUt/VQ1JGAW9
 29fEYCRfjYCbsE+v2D7g1f/kp0L4ptoI5za+gREtaGR7AOoAGYnC4hrNw
 7O9wHKfds/ET9lcADXY9kUPm3ek+jSwxUWd++CoQz7mx6ez0FBjiVUVlz
 p1eTot4GlK9NKKtdxnmjU2DsDoG+t6j2umz6SeC4vTXeURQhC/v5Oh2Lj g==;
X-CSE-ConnectionGUID: IsFQ28JmRuST1IZE5447vg==
X-CSE-MsgGUID: qaZdzSmoT52JoFmGlFEFNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="77312821"
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; d="scan'208";a="77312821"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 05:14:00 -0700
X-CSE-ConnectionGUID: e+/+Go7bQYacSzU5qn4yVQ==
X-CSE-MsgGUID: frkVjqJpSvePYyErvNiyfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; d="scan'208";a="196742239"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 05:14:00 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 9 Sep 2025 05:13:59 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 9 Sep 2025 05:13:59 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.70) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 9 Sep 2025 05:13:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hKdNfWiz1/rcqjWLaOyl+l6vwIqm33y+aBX74EfjH2ULVGJD+AtzxM7vCjxqIlIWT6ZV8n6WH5xlDAKpTckee3B08hAYg5l+yYBUkQYVFu2eM6XwOlXxT0cMAZ+jmH9llLzmflLRY/pYzf+dru6hye6H1AgTEcsnG1inSk4AP6e4Z8IDSwOzn7Yid0KfBbos2+epz7aqspHlF0wsuuPg2VEYNSbM6vInIdMiBlzz9ZfuejiSfX7rmvBkvGhrRCUCwogPt0GQ0kep/fEP6YW789em8WIcAZyhNw0OZmmDO1k4CivCtqeWnx/UIZOP2UqOsWWVCspyyMcq7OATeJUC2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R/fjjcpagSoRNaWboO4Zyib+z3p7qbOWoSSTQREVzTQ=;
 b=zKenvKmZEy5VS9GOpLiFqJCvE8NA/Qi4eo+0OZ4Vo/exLwX/u/YfU5WxhuXFbjniZos18PjAU7qffrPby8Ix7tnj7Gq0/8Z0TvzMIm7VGMfEZaKyX+1eQiUM+d2eDB57Z9Kop5krdRZXSXNYQgzly/4jAGZ2KI6M5mA2R2M1GWSMioZuF2kCXiAhg7ZY0l9upkYZ0Jo38oUuqv65ppQ4Xcz/ajT2qvAerldDVFyocJdpb1iCiOVMuIuNXG7U7Kc36oWlLArfH9TfD6G80ZypONcLEzJgxStEG/PwVyIzz6frWzikRdpxmw7f1Qtsqo7gQEPG+wW6rrbD5JZhD8xCmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by DS4PPFA58A7783B.namprd11.prod.outlook.com (2603:10b6:f:fc02::42)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Tue, 9 Sep
 2025 12:13:57 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%7]) with mapi id 15.20.9094.021; Tue, 9 Sep 2025
 12:13:57 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <175709857376.5916.4353119381649921234@intel.com>
References: <20250905173625.8398-1-michal.wajdeczko@intel.com>
 <175709654211.5916.895894170330275840@intel.com>
 <e3be21e9-cc3c-4646-b7ac-ead4a575565d@intel.com>
 <175709857376.5916.4353119381649921234@intel.com>
Subject: Re: [PATCH] drm/xe/debugfs: Don't expose dgfx residencies attributes
 on VF
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: Soham Purkait <soham.purkait@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Riana Tauro <riana.tauro@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
Date: Tue, 9 Sep 2025 09:13:52 -0300
Message-ID: <175742003205.1838.9070055212731311535@intel.com>
User-Agent: alot/0.12.dev22+g972188619
X-ClientProxiedBy: BYAPR05CA0085.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::26) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|DS4PPFA58A7783B:EE_
X-MS-Office365-Filtering-Correlation-Id: ab1ca0d8-e2d3-499c-d84e-08ddef9a59e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R1A3bisxQURmSDZUR2VxdVpQRDVudmZ4MUhMKzNFZHYxejZQcW5sdHQ5dWRI?=
 =?utf-8?B?dzNRUzRBM3k3WFo3WWd5Z0lZZ0xCbUlDanVuM1M4dlFZa1NLemtuWlc5SjFO?=
 =?utf-8?B?UDNudW9yblVPQ1k3eFFFZXdRT0NXQmlkanhPbjZhUGl5QU8yd3NDcmkwYjQz?=
 =?utf-8?B?VlVmQitLN3diRE5CMHI5WEtuN3JLUmw3OTlOTHE5YnEvK01VM2czY2RKQks2?=
 =?utf-8?B?R2dUT0JRTDFiUG9FUHkvQk0rR0ZkYTU3U0E2ZFdsRkRMMGFmNmkyWWJuVWFj?=
 =?utf-8?B?aVV5WGZUeENpWEo0enZUeGU2Mnk4N0dETVZJT2hNekVuMVhJYlc0RndjS1VX?=
 =?utf-8?B?bloyOWtKWTg5cnFlUTZrVXNvNTNoT0d5cEMrdzFHYnVYUWUzdUFtNXdMVzN3?=
 =?utf-8?B?L2NWSWJBN3FHRDh5QWUxV3A0dlVtbUlWSHcxVTl5T3h0WjBPd21mSkZMa3Ar?=
 =?utf-8?B?b0hGYzhqYnVpY3d2OXF5ZCtZZ2FobFpYUlJac1lxczNSQUtGbWpJU1NqMmk4?=
 =?utf-8?B?R3VqWENMQVpuZGg1ZHc4QTdYYWlPTXJWNFlPNnFOeHFwNGR4QlBQQmt2UzJG?=
 =?utf-8?B?VmQxS01lQ2YwQW9lNDZlUGV3VWZvMjc0b0ZjSG1ncitoVklYdDNSU1p0ZnpQ?=
 =?utf-8?B?VUxrYUdLbU4zdU16QzlvTTNPWGZwejRHWDFKSTU2ZHFxMmc1bERnaEZUdXR6?=
 =?utf-8?B?UlM1b2U0cnF4QnZ1WkZwZmJ4cUhwN09wYktWZE1SY0NMSkhneWpJVzVFRmxj?=
 =?utf-8?B?Z0poeVIvSzQ4dVpIU25xVjdBNExuMjhHejd1MDkwUDh3Y2F1SWtQSk1lcXlP?=
 =?utf-8?B?b2hEUm01SHkwL1BldFU1YXhOQVBtRzd2c0czUlMxUjE1S3Nqa2s5OWlJanVp?=
 =?utf-8?B?Zjlnb1p6QmNJUVQ0ZmJQOEhKYUtOa0JhdHdHWENjMjMyQndVRExXZ3lZV1Mv?=
 =?utf-8?B?TEQyMDBWVTdrT1RlRGVkb2ZxNkNrSEFzeDFiTFY3K3RPTG82NDFSYkcrcTZX?=
 =?utf-8?B?UDgrdDdtL1hMeUQ2QVRYbXNFUVFBU3VwcUlDdHYxSGh0dVE3akpPaE02RUZK?=
 =?utf-8?B?MFQ5N2wrSmZTNnplYzNBakNmbTczMmw4alZnMFBXaHJLWmZIeUxCZTFPeFY2?=
 =?utf-8?B?WmFVWGlLUWoxblh1SU8xb3lCaGlGbnUrVStoQUlUSCtFRHU2c2pyMjhWa1lC?=
 =?utf-8?B?b0VIRzVWK3hkNGs2RHJQditaclVIUy9wL3E3K1BTSTVvWTFOV1BMbHJCcytX?=
 =?utf-8?B?Nk9ST3V5bkxTTDlCalRTbHI4U0xHZHcxMFhBQjNXcE54bjVaUnhHN0hCSW5P?=
 =?utf-8?B?SDlNWFMrc1FaVmZjNU54NlNIbHhYeXl2SG5zeHVXbXRHQkd1c2laUUFaZHht?=
 =?utf-8?B?aTFhYWJMam8wWGxPV0QxdjFVbXh5ZUNRM3lia1V5R1hqdTJPQ2xpaTM4alJr?=
 =?utf-8?B?a3BnUU9FZzZRdlVwNnB1dThSY2dhRWQ2bDB1N3VQTHhHSWhiRDNIcDAxQzRn?=
 =?utf-8?B?N0k2SGtJMUZXdGJ4bmVIQTRVMHpadXVtVWRJQXZMYnR1SGYveTliUHhJYTBZ?=
 =?utf-8?B?T1BDdVI0c3BWbjJHbmsyNkNWSnNPN0JxLzFwQ2Y4RHRYQld4dVp5V05VL0pn?=
 =?utf-8?B?N2hrYU1DQWhCK0FwVFhIMUlBWkZ3ZU9OZzNrNFBlRHVxRVFsUUxJVVJJTTlo?=
 =?utf-8?B?S1p1OU4xcG1WY3VMT0xlb0l4bG8wTyt0RFVlTEc2UHhCakdTdW1sNmJPKzcy?=
 =?utf-8?B?cXVjVUd6TEhKZ0E5QXhueGxVUTFHTEJsWWkwOGJqMHBCWlg4NlpCZkE5N3pJ?=
 =?utf-8?B?MjQxT09ONlkvekdleHFaaG5wUTZDbGd2bU10VlM2TVBaMnRqeTl0b1h3LzNo?=
 =?utf-8?B?YWZCL2RvQ1J4b05rRk85L1NrdlBKSGlwa1JKKzZYZmZEV25JVGpwYVJxaXgv?=
 =?utf-8?Q?StyXNwWtM8w=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YkNiTTBWemtWczBIdkNEQWRUTmJleUVBUEM3Zk5vSTBMbTNsTzZsRFNqMlZS?=
 =?utf-8?B?c3U0VnE3eFhVWStrLzV0cE16aEFrN1JvLzJ5eXVDdU9NbndQN1QwMnJGRUt5?=
 =?utf-8?B?cDFwZ0Mxa0thOWEyOUZpbXlHV1kxUTdPR1Zra2ZXWFEzRGcwTTBkRVFOYzVC?=
 =?utf-8?B?eTN3b2doUXBySjhiL3ovWThQcDkzWURGV3FXaUhtbkx1SjdRNGU3dGsvMEtw?=
 =?utf-8?B?U1BHcjFTRGx1ZnMrdGd4NldSckdqd0NPeWV6Wldwb3A0WTZaS2JVbFA3dUlI?=
 =?utf-8?B?VTdhNWdibGE1bDlGbUZ4UDI0bDZIb3AvaU5HQmtPZitlQU9sU1F3RzBCTlhJ?=
 =?utf-8?B?cGJ6TlhXVEtYcmRHSHVteXZJZlVUOWx2bEZ2ZzdTTElBV0grN1pleGRYWmpw?=
 =?utf-8?B?Vm1FQk5jZjN1WTVBN2MvMEJJMDhXM01OazFZTTkvRW1NN3dEeE9kNWN1S2tk?=
 =?utf-8?B?RzloNVVsbEU3SUlYbHlmMktJdUNXcHp6UXZ0dlRISDF4QUVMVWxucU81MUtz?=
 =?utf-8?B?dWsxSUgxSVk3WEpaL2lZb1IxbDZDOGwrMzNnOWFYRHFkWUVSL3NGdkx4RXN2?=
 =?utf-8?B?NCtZWkJIdjU4ZGRaMy9mRERoQnR4ZGxaWkF6V0IvdFJqVXM2L1pNbHk1elRx?=
 =?utf-8?B?UUc4bG5YYnFsSmMrSGpVcCtDbHM4VitDOVYvNmd1dkk2dTFBMTh0dk1sWTNz?=
 =?utf-8?B?L1MwN2RXZC9JbGxlUGI4U3EvSmhQRFhZQ1FScmY4NVAyMTcwYkhjNG4xRVZo?=
 =?utf-8?B?Q3R2RjYvRjdZMHppOXZtWmovN2VNWkFjOXA0ZWhmOXRBbndZWXNBY1JHQ05V?=
 =?utf-8?B?bnNyTTQwemg0Zk9zSVNFc0M1V3VPYXp3VnkzU3hLd01rQ2UwV0lRSWRXTkZW?=
 =?utf-8?B?U2F2ZGtORnUyWFNEcGp1VHFmUXpxdFkyMlV5K0g4NXMwN215aW9KN3hlN0w5?=
 =?utf-8?B?SGk2U0FhK0d3NU5YTlVOWnpaajJxOGU1bGc5dmVkZXdCQnZKbnlpMW10UXlX?=
 =?utf-8?B?UXo2VWZ1YStRQWsrQUpENEpVU2JUMnpudTZmczNYN28zYVdVZzF1MUlzdy92?=
 =?utf-8?B?WHNLMTA0TW5aY1FHaGZoMkNIRnlMemVHdGxMbFpZY1cxL3NSWUZkYTlhTFB4?=
 =?utf-8?B?Tms5Z3MrRmdmNTNKWlBBZ0cwOWEzSjVGSDlsR1U2Nk0xU3lsZ2pBVzhNRmJP?=
 =?utf-8?B?VEMwVjhvd3VMVHlkSWU0NEZuVFQxdzc4ZldPSURIMGxGcWx4Y1BaTkNEckRI?=
 =?utf-8?B?ZkovWHpqY2JFWFhVVFdsdW03VnhrLzZnWFlnUkF3WTRnM2E1dm5CWVk2R2JJ?=
 =?utf-8?B?SEVxUTZjWGJoRHFKMXk2YnlPT1V0NjNWOGtKbGY3Rm90bndlVC9pL0diQnZR?=
 =?utf-8?B?KzlpWFowVW9Bc2E5aEp0L0ZSbk0yclNNOFk0SVAzZkU1UVhMQjU3Z3JHbzJE?=
 =?utf-8?B?Q0Y0RExhb1VrbytTYTVQc0NlbjRDNW9FaWVRQUpUWmpsdm5MazgxaXd3QWxp?=
 =?utf-8?B?aW5SNG9hTEVWdksxVkU0dUovWmgwV1hWZDhQZVl5WmRHZWlGcHNVYzJQT2hZ?=
 =?utf-8?B?NVk5TzlRcVRac0RCUllJNW14UkxUTkR0MnFhVnFadUFSTnpZRHdadG5CUHcr?=
 =?utf-8?B?OW5YdnI5VmFUU21UMGdaVDlYaGd5dnliSkhPcDlrOThQcHFONnJJTzU2cGlv?=
 =?utf-8?B?ekFIeVc3TFZsbWlHR1liWEhvWXhaMUEwb1k0SnRSNXJ1UDgzdzFNUElFa1ho?=
 =?utf-8?B?dWFUS3FwR2VWMGRac0tlQzRaMmNkQy93UGhKYmhGRlA4cVd3OWx6ekx5dUtS?=
 =?utf-8?B?cEhWT1pCeFF4N1V2MUhNTEMrNjhCUTVVTkVwUVlPR1gwUE1HRkREbjRnU2xt?=
 =?utf-8?B?L3ZvMW4wejBkY1dLSWI0WUZFeUFmaEp5ZEQzMVdVUHFwcVVOUFJqb0Y3WFFW?=
 =?utf-8?B?aUx0RjY5R3QwUGFlZmpRWWQrODF1M3VyUzFyWE9YZW52cUVpdXlhaXhhSkZS?=
 =?utf-8?B?NWdJdm5HSWE2OFJTSWxVWEpsTzRBcEZUVDZPSW9DdW9OekRobTJvRjFFOVVW?=
 =?utf-8?B?eGJRNzYxUk9PU2tDaXlaZGdISmMwQzhEQkh0L2JFQmZOSGd0RExpbm1RdDFF?=
 =?utf-8?B?dEc1ZHJUOGRVQ3EwazhyY29vS3ZjZHo2dDJNUDJoMmtIb205cldzRXZWZlpU?=
 =?utf-8?B?NWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ab1ca0d8-e2d3-499c-d84e-08ddef9a59e3
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2025 12:13:57.0228 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wmLGVKQ37MykfMI9UVoJcHX7Bzff5F6+bkPnaapiHDmgmV2i5kI6oqcSgpH2CXRF7P267V82dVYVnphkev1kyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFA58A7783B
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

Quoting Gustavo Sousa (2025-09-05 15:56:13-03:00)
>Quoting Michal Wajdeczko (2025-09-05 15:40:14-03:00)
>>
>>
>>On 9/5/2025 8:22 PM, Gustavo Sousa wrote:
>>> Quoting Michal Wajdeczko (2025-09-05 14:36:25-03:00)
>>>> In addition of checking if we are running on the BATTLEMAGE,
>>>> we should also check for not being a VF driver, as VFs can't
>>>> access necessary registers, and doing so leads to:
>>>>
>>>> | .. [drm] GT0: VF is trying to read an inaccessible register 0x35b004=
+0x0
>>>> | RIP: 0010:xe_gt_sriov_vf_read32+0x5e2/0x8a0 [xe]
>>>> | Call Trace:
>>>> |  xe_mmio_read32+0x110/0x280 [xe]
>>>> |  read_residency_counter+0x42/0xd0 [xe]
>>>> |  dgfx_pkg_residencies_show+0x115/0x190 [xe]
>>>> | .. [drm] Package G2 counter failed to read, ret -19
>>>>
>>>> or
>>>>
>>>> | .. [drm] GT0: VF is trying to read an inaccessible register 0x35b004=
+0x0
>>>> | RIP: 0010:xe_gt_sriov_vf_read32+0x5e2/0x8a0 [xe]
>>>> | Call Trace:
>>>> |  xe_mmio_read32+0x110/0x280 [xe]
>>>> |  read_residency_counter+0x42/0xd0 [xe]
>>>> |  dgfx_pcie_link_residencies_show+0xe7/0x160 [xe]
>>>> | .. [drm] PCIE LINK L0 RESIDENCY counter failed to read, ret -19
>>>>
>>>> Similarly, there is no point to expose inject_csc_hw_error on VFs,
>>>> as HW errors support is already disabled for VFs.
>>>>
>>>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>>> Cc: Soham Purkait <soham.purkait@intel.com>
>>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>> Cc: Riana Tauro <riana.tauro@intel.com>
>>>=20
>>> I posted a very similar patch[1] ~1 month ago.
>>
>>oops
>
>But I think we can go ahead with this one, since it also covers skipping
>inject_csc_hw_error.
>
>>
>>>=20
>>> There was a spec-related question from Rodrigo, for which I could not
>>> find the answer.
>>
>>I guess the answer in indirect - there is only small set of registers
>>that VFs can read directly, and above one 0x35b004 is not on this list.
>>
>>Bspec: 53221
>
>Ah, thanks!

With the Bspec reference above,

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

>
>--
>Gustavo Sousa
>
>>
>>>=20
>>> [1] https://lore.kernel.org/all/20250729-skip-residency-debugfs-for-vfs=
-v1-1-3c5edec08c8b@intel.com/
>>>=20
>>> --
>>> Gustavo Sousa
>>>=20
>>>> ---
>>>> drivers/gpu/drm/xe/xe_debugfs.c | 2 +-
>>>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_d=
ebugfs.c
>>>> index 4b71570529a6..8be8304cb05c 100644
>>>> --- a/drivers/gpu/drm/xe/xe_debugfs.c
>>>> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
>>>> @@ -346,7 +346,7 @@ void xe_debugfs_register(struct xe_device *xe)
>>>>                                  ARRAY_SIZE(debugfs_list),
>>>>                                  root, minor);
>>>>
>>>> -        if (xe->info.platform =3D=3D XE_BATTLEMAGE) {
>>>> +        if (xe->info.platform =3D=3D XE_BATTLEMAGE && !IS_SRIOV_VF(xe=
)) {
>>>>                 drm_debugfs_create_files(debugfs_residencies,
>>>>                                          ARRAY_SIZE(debugfs_residencie=
s),
>>>>                                          root, minor);
>>>> --=20
>>>> 2.47.1
>>>>
>>
