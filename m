Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF59DCCA476
	for <intel-xe@archiver.kernel.org>; Tue,  7 Oct 2025 15:10:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 773C910E6D5;
	Tue,  7 Oct 2025 15:10:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yfc9Q6tw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 642A510E6D6
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Oct 2025 15:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759849803; x=1791385803;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=o6seBRXbCOZpqapjm3Of1H3yCbsQ5e8gMed2whjTZQ4=;
 b=Yfc9Q6twYBuoVgKWijx3QrSdROPKnzZk/VtrtC459yMJy1nOHYIPGGNL
 a7PGcmhQwy/2pp/fiB5tDsalyS1QBeEfmuFPZFFWUk8IJQ5MMheo+Cwwq
 XO0faEqoiXOSJVEaBLOtzbgMlHEjCPWrCD4ynmclRLeHbPSxFHrCAjVMV
 EIacjeQm/Y0ucvH6DOW7ToEx2UWU3jPi4a65F/UfJco+J0RTurCALDh2Z
 zNGAOZGGNtTp0jKmim/HyF6UvkRdHHkOtvASXbXnJnKtek13t4GDujI7J
 7/78LX1pfp1Afy746lhWTie7/6yZq+ZtQ2W9KejvNsto1Px8jwzRlEerg g==;
X-CSE-ConnectionGUID: wH8yhH+yQCSrpV6Y5mADOg==
X-CSE-MsgGUID: zFAGZe8RRPuc6xlcLPN4lQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11575"; a="49589306"
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="49589306"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 08:10:03 -0700
X-CSE-ConnectionGUID: 5tRK7DLURYu6cPuNudsThA==
X-CSE-MsgGUID: 2k4h3yjKQvC/gL+W0n8r+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="180964303"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 08:10:02 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 7 Oct 2025 08:10:01 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 7 Oct 2025 08:10:01 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.38) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 7 Oct 2025 08:10:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n8y4B02Y1/LjPSytFfmLFXz9FupUXDk1ZF4vBqqtpOgmL0gM4Dz3skyRuuhUd6vag0cqMb1lj+s76R2bs2qm2fafZ5TCCObi5PvXDdwqnQvEwJJ8pjQ0qjG0a7AcOqsyf6UgMZLv64I8gMEDPDipaAKqtqOGnyUzBqT7V4shnZaaS7V5NRlhJvF6Fy8BkZ5l+FcNjCvkEDubdbaOxSPXnppvalS2ZRXtox0OLFmEHSrj5XszJrgXmwviH5tQhbTpib8WpizwcOO1ARyXr1X6UiWKKH3Bf+5kNxO014iGjaDTHNWL/KyzwSClPBYYXm+3KBxHIIISMug+q24NZOsRPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kMyTRxmnluCMGshXuoMDSdolYJHrDi64hZXHt6P77LM=;
 b=dQ2SSfO0x7+Exo8bcXP5Feu37bEW6a51WPH8pdZh7HsgtU70DIirB0Ftw/p36DqQb8yKFfhy7049LQxpujIpIBFqO54ZSixLAJFC+jHUqKQUzuixRhb5a8QXfVoQrCZwIFGnLmVdpvAF7SLGMKYIKBeAAls5TevJYJ7iVhBFkcePad3dt4BeNkS+7zw1FUOekya43om5g/fdZVV3bVfm1Wtat5P5HQILcq7wykojybSJkZn/nt9+tpoX15L1EqWz1yPBf1srzQ6WhIyF87rEsVd+RfAOGs7Sb/HjmqSH0ptYBUpXOEkI8KQzNneq2z4lZedtDiSOaoKOeGfFP5PEFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB7550.namprd11.prod.outlook.com (2603:10b6:510:27d::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Tue, 7 Oct
 2025 15:09:54 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9182.017; Tue, 7 Oct 2025
 15:09:54 +0000
Date: Tue, 7 Oct 2025 08:09:51 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Lin, Shuicheng" <shuicheng.lin@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>, "Lis, Tomasz" <tomasz.lis@intel.com>
Subject: Re: [PATCH] drm/xe/guc: Check CT enable state before deregistering
 exec queue
Message-ID: <aOUtP+15UGWK1YaB@lstrano-desk.jf.intel.com>
References: <20251004173033.2511250-2-shuicheng.lin@intel.com>
 <DM4PR11MB5456A079CF5E4276AE13580EEAE0A@DM4PR11MB5456.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DM4PR11MB5456A079CF5E4276AE13580EEAE0A@DM4PR11MB5456.namprd11.prod.outlook.com>
X-ClientProxiedBy: SJ0PR03CA0014.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::19) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB7550:EE_
X-MS-Office365-Filtering-Correlation-Id: 27ede3d9-0bea-474d-0508-08de05b391d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R0VnNkRVSy9ycjJzTFJJaHhIQm1YUUpseVRJYjFFWXRXWVllUHA5K3RPSVJi?=
 =?utf-8?B?bEFHYUM4ZnFDbnVVSWhKU24wcFFIRXpTQU1PdmpBVVYzS1FzdmRkT21rK240?=
 =?utf-8?B?ZHJybklINE5aTEd1d1hMbWlQQ1U5bS94clc1MGhwM2o1enc5Szc5UW5Yajlz?=
 =?utf-8?B?SjVTRHpGaWQ4NXgxekJwNUJ3U2RVUzJPeWkxWjNXbk1KQVBjS3lxUW9UNThy?=
 =?utf-8?B?WHBCN1RvUC9henN0dUhsMUJoZDFUNGlkMktMOGpjeGZWcTVxRFFsT01LdUFU?=
 =?utf-8?B?SDV4UW1OeTV6NFhieFlYbmVFbjRpVGlVb29sRkdDTkRCR3pjaUdpN3J4U0lx?=
 =?utf-8?B?VnNZQWEzMUxUZ1k0OVBYTW1RUkhzcS9MT29QZWNHSjRTdVVsc3VCZmtRYlEy?=
 =?utf-8?B?b3RtY3NzVjc5VEFOV1M3QlFCYm9pYVFoMk1aS1ZRM3lPMnBYcjlCVXhWZUFK?=
 =?utf-8?B?L0RlV2tGK2NBNjE3SDN3cjI3d09EKzZLMWpSTFRjUDJlTndyaU4wQjBtZHFT?=
 =?utf-8?B?N25jM3JsajUwdU9BdCszem5xV1dpQ3VzVE5QaDkrRmxPN0JEay9wVmIwOG9i?=
 =?utf-8?B?KzFsK1dyZDhaTjg2QlFQY01KenVaNHFGMEVPYU5UQ3NMUEhFRGFuaDMweFBv?=
 =?utf-8?B?R2FOc2VKQUVBdzRaYUd3MGhXaW1ic0FuRUZLeWR2Q0xTWnJtVmVCbVlESURh?=
 =?utf-8?B?c1I5VmYrTlg5cnVBWlpxeU5MTTJkLzNHUzNOT0pPOHFHblRaVW41ZTdUYmZn?=
 =?utf-8?B?cTlLSTlKc2s2UVNkcjA5Y1NDZWs0alNqK3pYMGxLV2JZVDJjQm13blFvYTQv?=
 =?utf-8?B?eWdpdmxhQ1lPc09QZDVCT2Q0ZUY3RlgxZ2FIV20yckMzclRsMmFua3VXV3U4?=
 =?utf-8?B?ejh5ZmhHakppd0cyemR1ek1ieEZVT0tEK0wxVnpNZGJSeThOMHpoWUlFUlNr?=
 =?utf-8?B?clRYK0NxbjhoMjJja1FBbUVaTTN1M0ttSXlVUDRoSjhaeUpuY1FQelY2R09x?=
 =?utf-8?B?eUtzdFlHR0VhWXRlN1AyaWxUaXdRbzVYM2JlSVBpbFBDeTI3Wi94aW8vZXNx?=
 =?utf-8?B?L25ydUFvNHI5ZkFZdGhyaENOK3djTG9xcWhsNlRNNzU0OFdINE1aaUwrcURj?=
 =?utf-8?B?Uy91SkdLNERGV2xYTm8zblpOT210R2xPK0gvK1ZGVGJjRS9jc292QjRGZnFv?=
 =?utf-8?B?Z0ZLbmxzTG1CL24vVW9aSFEvSStiT290aVk1WEwvVmNrZmc4VVN4MlJ3QnJu?=
 =?utf-8?B?ZUxLWWZmbVplQ1pjVDZXajNibFFUZjZJQmxSVEFrZjQ0TEJYMnRiMzRuMU5B?=
 =?utf-8?B?dVB2MlAwcTBQN1pVRWtYa3lvMG01UUVhZFM4VERvTnAzOGIrc0R5Wnk2UVp3?=
 =?utf-8?B?MWFUWDFYQUF4WFNmTmR3MUFmTy9VUlduSUZGbDAwU2FQT0hDN005L2hONlRH?=
 =?utf-8?B?WkM1ZzNJLzZXUFhYYW05Rk1IazVvKzJZMC96RmZnQmtXSTRRS2ZNNmJjL1lQ?=
 =?utf-8?B?TWttb21ZalZjVUt0RDc2dTdWdTIvOU1vNXpLZXArUk80d1FYc280cllTZVVT?=
 =?utf-8?B?azdyZytSTmpvMzRBYWM0K2tMR2dBUWNwak1DVXFCbVE5S0ZwblppbDBKY2V3?=
 =?utf-8?B?d2pXQWlIaTh6TCsvZUlDdzFycituZVhvUHFTbnEweDZ0c2Y1NUdPejdBYktV?=
 =?utf-8?B?a0pLaWV5eWlMWVd1VFhrdVJxR1BnNHo4RHZ4L29wZnhYYTFVZWFneFIzUEp2?=
 =?utf-8?B?SzhwSFhnMWZXVW1CaVdkU3daa3lyVkJoSE5HUlJ6aS9CNDBxMnZCZTMyYllj?=
 =?utf-8?B?MDAyY0o0MHhJZHhFb29HTHYrdWdZYWJsQVdPVzNTZlVONTdVSDlRTmlPeEFw?=
 =?utf-8?B?bmJSRDRkUkZWSjhRUWtmR1NmalFXSDJDb1dQdDNSK3FuQ3NNdW8zbm4ydGFo?=
 =?utf-8?Q?2qQWLzHUGBCSqf36RUlVRR9VjqVZdYSu?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VjdNeU5sM0ZJanV3dUd2eVcwdFdTVFc2THVaTEFxdUhxSlA1YjVqOUF1L1RS?=
 =?utf-8?B?Tm1WK0RSdXl4dVJOUWNTYWUzN3pIbjd5ZnIxYVBia01hbHNSN2dxRHFtWDN0?=
 =?utf-8?B?MmNzYW81Y1F2ZHFmZUc4enJwcXlaUDI0cFdHWEorZVgxeG9DU0FaNittOFRw?=
 =?utf-8?B?NXpnbVBZZ1o1aG1SZXBDTEpyaUhqOUtoaHlQZ0FuWE5lTkNNSmZlU29PYzFi?=
 =?utf-8?B?eE1oWUhBUVBPSGpCeUs0RWx2YmZFVW5QdnlOWW00c0NnNk93V1l6Wk9OT0Nk?=
 =?utf-8?B?RnMwMWRXYXltSzBYakltdkQ0TTVCLzhKUkxIa3c3M0hwY1dBSk9GK2J2Yk10?=
 =?utf-8?B?V2hsb2pzL2NKeW1lZkVUM2VielE5R3g0Wi9OUVhJTTZscGR5OEtNOHJjeFNR?=
 =?utf-8?B?NHI1V2VSa3VTRUlzNjN6WEdaeHU0M1Q2a096UG9EK2VEZHFQV2I1SHp4TG5m?=
 =?utf-8?B?Ylp0RXJzeUZ2cjBzNVk1bE5KSFdGQTZ5dXBhT0x1SmlmVVJGVnpTVmNzMm1v?=
 =?utf-8?B?MkQycGdrbi9jKzBBSm81ZkpRZGRnWXZjQzM5YjVDSVZXYjl6bGljYmNmZk5F?=
 =?utf-8?B?QldlTXB6Nk1CUW9vcXc1aysrK1dTNGkwempPMjJSc2lTeTJTTit1ZklMcFh1?=
 =?utf-8?B?V2pLcHgrcGJhM0FEdmFCaXgxbUI0UEdZUVRFcHMrN25VbXU5UUUxSHpIWVNH?=
 =?utf-8?B?VjRiczhWQ1RrMWRvZXl2dGdZYzhtaHBQU3MxOWxwOWs2SzNubHFwRldCL1FJ?=
 =?utf-8?B?SS9NV2UxTmxJSitYOEFUWFRSQVZNQ241bWczRE95a2UwMWs5NStHNmJUM1Ni?=
 =?utf-8?B?K0NBODFiZzY3RFpyenFwQ2tHMG5ZbnAxTVFTSmR0RCtQN2RJMmgxcVQ5NnpL?=
 =?utf-8?B?VXFiVHc5TmdnSGJwQVJEOHFpaGM2VGhEeWttell2cDg1OWhEejdpN04vb2Vk?=
 =?utf-8?B?b3NwdTJGVnR3dG5IUStKZTJYcER2cmRRbEhEQnNWRzR3WEZKL2orZGh1TWhp?=
 =?utf-8?B?Z2thQXBlUGVWaFAzWDFtOFJuUHQ3em04STA5SFpJZUszbklUY0xpL1ZQWlVH?=
 =?utf-8?B?MW5kTkRjK3hqWXBXM0dDR2JXSWd3RUxyekFPQ24rWW44ZGQyL1IvcExoUjN2?=
 =?utf-8?B?ckk3NzRiY2xpYVRPNTAyVFVlWjUwSDN5Q0lYRlBaU01WaWJicm4rRGxvb0h2?=
 =?utf-8?B?UDlpeGk3TFQyWmNhNDZOYk9UR0dmWHRQRVViYU13azJxaDZ1VGp3RHlZSTJF?=
 =?utf-8?B?UFBkTWRCSnpjdmFCOHZXRVhKMnUxY2ZsdmQ1Z29ESzh0SWhuM0Q3SXExUlVG?=
 =?utf-8?B?NW5uS0hMMXFNMkhkNTByOXRWSlVqRmJSdDhqV0k1VkZKMDh6dXBZeCtyMmRv?=
 =?utf-8?B?NjlUTC9YUEswczhSTDBSQUhsRmc2WlVyZXdGR0JENTdqa2RnV21jZnJwRWtk?=
 =?utf-8?B?N3cvcjZVNWNIVkUzMithUDJ2alFteGZrYUtMSHVSTFVITXpmeTMxOGZQeVpV?=
 =?utf-8?B?b1FMN0xZaWRrTVJHckpvMzZ1emVYdUlQenVYZXdzY08yRkIwUnFleXVEbHpk?=
 =?utf-8?B?Z2Q4UUQxZkNoSnR2OE14eTRCd0xTQjMxN3l4RFFUVi9vcXJPcldONG1LaGRC?=
 =?utf-8?B?K3AwcitqM3RUZEZTTjMyeFFiVGExY1lVMXhGME1VeEVDc2QzYjcwR2VLUFk0?=
 =?utf-8?B?V2E0TzZDTEdaS1ZhVmMxTzBKbWlJSkozclIrYk1UcnRaT1phME5Mdjh2Q295?=
 =?utf-8?B?QkFIWGEwR1JNTmY5eVYwQXNQeVc2SEl1QUVWSE5TcTFyWnBMdVgrSW1aMHg5?=
 =?utf-8?B?ZlFjS2RjakcrWUtKY05CV2g5YzcxbWxoTXFaaXNTOFpwSUkzc1ZCaUN5WGFu?=
 =?utf-8?B?aHhkM1RnSUJNbGUwd1RYRG9kUjd3ejF0MWZKMlZPZm9KcmsxWXEyTTYvK3JH?=
 =?utf-8?B?MnVHUFl2UER1QmdSWkRZbUtXazRYc0xIcVM1VzBpd3dHTFpDM3FFM2RPMlNk?=
 =?utf-8?B?cWVMRzU3YUpidGFYUXdVZmFCMERlR2NYLzNRZmg2VUpNYWRpSEN0Z0d1TWVm?=
 =?utf-8?B?VVNWd0l2Vlc3cXE3cGFEUnl4a09QZ2xzR3FlU2RQT3lZUURwK2ZZNzZIWDBJ?=
 =?utf-8?B?VTR6TEZndWJiSGlQR01qaUx0bzBNTktHUXc3eFpqdWZlWTU5bHdLSXlYSTVM?=
 =?utf-8?B?R0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 27ede3d9-0bea-474d-0508-08de05b391d7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2025 15:09:53.9476 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zVZUO8t+856BKqD1n1xYX0qcRD2175f0mIjjgBN2U7NkvN9fj6EsCFcdgB8VIcEulAdahh5d8pNZy+yD/+gU1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7550
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

On Tue, Oct 07, 2025 at 08:59:25AM -0600, Lin, Shuicheng wrote:
> Hi all,
> Could you please help me review it? Thanks in advance.
> 
> Best Regards
> Shuicheng
> 
> On Sat, Oct 4, 2025 10:31 AM Shuicheng Lin wrote:
> > In normal operation, a registered exec queue is disabled and deregistered
> > through the GuC, and freed only after the GuC confirms completion. However,
> > if the driver is forced to unbind while the exec queue is still running, the user
> > may call exec_destroy() after the GuC has already been stopped and CT
> > communication disabled.
> > 
> > In this case, the driver cannot receive a response from the GuC, preventing
> > proper cleanup of exec queue resources. Fix this by directly releasing the
> > resources when CT is disabled.
> > 
> > Here is the failure dmesg log:
> > "
> > [  468.089581] ---[ end trace 0000000000000000 ]--- [  468.089608] pci
> > 0000:03:00.0: [drm] *ERROR* GT0: GUC ID manager unclean (1/65535)
> > [  468.090558] pci 0000:03:00.0: [drm] GT0:     total 65535
> > [  468.090562] pci 0000:03:00.0: [drm] GT0:     used 1
> > [  468.090564] pci 0000:03:00.0: [drm] GT0:     range 1..1 (1)
> > [  468.092716] ------------[ cut here ]------------ [  468.092719] WARNING:
> > CPU: 14 PID: 4775 at drivers/gpu/drm/xe/xe_ttm_vram_mgr.c:298
> > ttm_vram_mgr_fini+0xf8/0x130 [xe] "
> > 
> > Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_guc_submit.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c
> > b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index 53024eb5670b..9d33f63d972b 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -1489,7 +1489,7 @@ static void
> > __guc_exec_queue_process_msg_cleanup(struct xe_sched_msg *msg)
> >  	xe_gt_assert(guc_to_gt(guc), !(q->flags &
> > EXEC_QUEUE_FLAG_PERMANENT));
> >  	trace_xe_exec_queue_cleanup_entity(q);
> > 
> > -	if (exec_queue_registered(q))
> > +	if (exec_queue_registered(q) && xe_guc_ct_enabled(&guc->ct))

Checking the CT here is not the correct approach — this is a state that
can change at any time. For example, the CT may go down and come back
during VF migration. If you race with that state change, the GuC will
hold references to the queue, and things will quickly go sideways.

I think what you need here is a driver unbinding check. Do we wedge the
device during unbind? If so, you could do something like:

if (exec_queue_registered(q) && !xe_device_wedged(xe))

Show more lines If we don’t wedge the device, we’ll need some
xe_device-level function to indicate that the driver is being unbound.

Matt

> >  		disable_scheduling_deregister(guc, q);
> >  	else
> >  		__guc_exec_queue_destroy(guc, q);
> > --
> > 2.49.0
> 
