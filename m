Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2452CAC5B0
	for <intel-xe@archiver.kernel.org>; Thu,  2 Oct 2025 16:53:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EBCB10E1CA;
	Thu,  2 Oct 2025 16:53:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PoIz30AR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B8E510E1CA
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Oct 2025 16:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759424011; x=1790960011;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=dlQl5ln/a8aMHK3PAyVCAN+Bfu4vW9vkzYcBbzJs7Dc=;
 b=PoIz30ARgvwPmvZU9kdFniEeNnHKv6X/MGG3fmmWvnYhY/P2o0jEdPp3
 dFFH3ZXTOH+N8vSHSWplAVMT4ogB6SrzBX/AVH+ihEV3Or2Y5ixlOt0o5
 61y5Mj4tIahg/3uC0rzpFJkbY9JBmMl+WQferZ7VmkmFi9JjQXajTkJpE
 OQWsohxvRy5az2L7x2y0y6QMJQpbvi+spJDVuIInOzQlAskC0FpMJTtBT
 sguP3Nhycr7FaHvNSrEqH8dFNpIlfYOC8bRa4PXCbxLD68eijuoFh/T7e
 2lMuMtldnWBey+AaePP3dSixvwOWrjVDHy3yLLT1fCyQpHoTDq40unLLp g==;
X-CSE-ConnectionGUID: tvI9xlw6RGOFaQIzVCCgsQ==
X-CSE-MsgGUID: HZofDtEpSuuZIo848BiwVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11570"; a="60751863"
X-IronPort-AV: E=Sophos;i="6.18,310,1751266800"; d="scan'208,217";a="60751863"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 09:53:30 -0700
X-CSE-ConnectionGUID: 3CWJ7vFXTUWEe9UW5GBKvA==
X-CSE-MsgGUID: ia0+8K14Rs6N6dAX98Qdrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,310,1751266800"; 
 d="scan'208,217";a="202829387"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 09:53:30 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 2 Oct 2025 09:53:30 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 2 Oct 2025 09:53:30 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.36) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 2 Oct 2025 09:53:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GhbjU/9S7+o8J8xGiuTDY6hVYIRQSDQl+OcRfWZ33MOReR4vsYbzf1k/sPvFXgETwFXqEWgd9B6hcyp1CXyLYO0I9GmMUDBb1iT37rxPZuj2nDrzSNLr/eTcBcvi+HK88KT1bl26Wns5Rb/JEpoTqHilHj6lR/bPwT4caSqsthsbbRl9Cck6Qc1mJqG0OzdfpNiWWlYFf0G7Rx3V6fzPTD1Rt/gc7n31QHUoeS3wxeCoLgw8NbcQyKipiCH0eEJFyb/Uzy5Fw7DuTOrxMMWGU8WaMkgCqe5jOoo6OUS8B+/TiXbGirt5y+13AMfSdO0QtjDpMTDrln1TAw/88h92HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W7wm77a3zT73Jvnm0CmswSkhUSOK6/ygOuDJNosdMDE=;
 b=ntGzHWPsYm7lg13GnROWSX5f75C6aS9VDMFrRvFZHUR7tiOvi5hH8a56nGKD6RWdx8CiitiYaKnVedJIL1/KUWaiOwUk5BgJPhHsph2rgakOSjJ7KSs7hyW+ABSSRG9dh+GKXPeswK0ygIMjb1aXJdLNChOJLgDFOrOt0JJnVo5jz0lF3ydejs37w7iVEnAPX8mR6t8qCASVv369nhw58IgqtwSSU7rztHsyQpuDybOFdFrFsuFC+3DmExJT+ChwOvsanVe1q0URe7CQdu2wiDcM5iVjZ0zWVlKFHD9swI3BpVsCVs9gQdfYgbsXZqk6zSXUZQ3fVVYQdps9oMiVtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by MN0PR11MB6230.namprd11.prod.outlook.com (2603:10b6:208:3c5::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Thu, 2 Oct
 2025 16:53:23 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87%5]) with mapi id 15.20.9160.014; Thu, 2 Oct 2025
 16:53:23 +0000
Content-Type: multipart/alternative;
 boundary="------------BpJ1CNWAFWBWdTs3XJQpfGHS"
Message-ID: <23a6bff4-a2c3-4d5c-8937-f3e97588f422@intel.com>
Date: Thu, 2 Oct 2025 09:53:21 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] drm/xe/gt: Introduce runtime suspend/resume
To: Raag Jadav <raag.jadav@intel.com>
CC: <lucas.demarchi@intel.com>, <rodrigo.vivi@intel.com>,
 <intel-xe@lists.freedesktop.org>, <riana.tauro@intel.com>,
 <matthew.brost@intel.com>, <michal.wajdeczko@intel.com>
References: <20250904091439.2279352-1-raag.jadav@intel.com>
 <20250904091439.2279352-3-raag.jadav@intel.com>
 <6659c13b-666a-4a57-8a31-f123f9ce932c@intel.com>
 <aN6mz1Ongl9uNDwM@black.igk.intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <aN6mz1Ongl9uNDwM@black.igk.intel.com>
X-ClientProxiedBy: WA0P291CA0023.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::10) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|MN0PR11MB6230:EE_
X-MS-Office365-Filtering-Correlation-Id: 7092a0d5-c501-417e-e6ef-08de01d432f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cnJNQXB5MkJWeVdDN0ttcWlJL09vdXlFZnJYS1FDV1lpTlVTeG9uVHZEenNt?=
 =?utf-8?B?RnNzNjBRa2RrMWNUWFUxVWJjV2QzS0ltMnRHRlRoN2xKaER6cXp0RG9jSUFU?=
 =?utf-8?B?b3grYVVMcjNJRVJseHR4cXNqWlhRd2VsNjg3OEw3czI2eGMxOHg0QmRmMXdi?=
 =?utf-8?B?UWhXUDVGVTlodHE4aWxOTjFYSzRaVm9keXZ6ZEF4bEhCMmhHTkEwRmZFejZM?=
 =?utf-8?B?dUtPZWIvVk5mb0ZxcUVCLzRNVnpnOTJmWWVnSW9DbmN0clkyZ0VwY2kzUG9M?=
 =?utf-8?B?UnZpLzZxRnJiT3F4bkRvcEtBQnJUMStDZ1NqNDZlNTdLdXV4M25Vd0FKOGlO?=
 =?utf-8?B?Y284aHN5eE9xSzFvek12dnBOWHhxb3RnTDFtVFMyMkkxTk5PVThpT2praUsv?=
 =?utf-8?B?SHZOeS9OeTlnbDRxWVh5ZThkbFNXMzlBdDVpTGVzT0dYYmN0M01CWWFtV1hX?=
 =?utf-8?B?dUQrY3BPK3JZQURJYi9pQmhza202M0ZKOHF0OUhQSWdDRnYrSFpQZHV0ZmR5?=
 =?utf-8?B?SmtWZU52VUtQUWw0bmticGl1UTRNa1Y0d1hZcitZU21RU2dicC8yZS84Yng3?=
 =?utf-8?B?M0xBS2pxbGlOOXJtcXU5dFNZMGdlRFhrR2ZBVWNVeS91d3VVR291aWFMRDlr?=
 =?utf-8?B?YWhTNzJnUEVCR2MwY0YxVVduZmoyQ0ppd3hBUmY4bEpjZXE0RGhPb1dwQ2VN?=
 =?utf-8?B?VHlQWUlTMis4MjlhUU54RTZmVzllQnBCMVZHK0xneWJ6c3NxQjlLQzlNWHR3?=
 =?utf-8?B?c2dTdFpGamVDb3VKRlF5c2RyRUw4T2VoRi9CNjA5UmsrMXdYQ1ZvS1paajkz?=
 =?utf-8?B?cmp5TXZUY1hrMEVkMWRjaDlsMjZJRU5TQnByWjlKbWdnYTBFeHlSZ1pzbk9P?=
 =?utf-8?B?Z0tJYzlCUWdrMGRBL2lQQjVUU05acUxOckpndlNQeWQ5YlA2MXJraWV6Y3NP?=
 =?utf-8?B?TGltNkN2cndjNCtvQk9zdU0rVWJpYWRSWXQvald4dzJlK25Fa1FmODVWMjcr?=
 =?utf-8?B?RFNJVzBtRFl1UFdzYjZ4dUVhWjBmNGk0YnR2WDBmLy9jc0tHdGtoVHc2UzZG?=
 =?utf-8?B?TXphNWdoQmh2cTZXaVVLM0lBWmo1TUo2TnlkRmk5TEVSN2VYanRieEg2dTRP?=
 =?utf-8?B?QzNjMk03VUxzbzF4VjAxT1QxZzlXN0RuYkI3cGJrMVkvSnRyK20xT1RhTGFn?=
 =?utf-8?B?aWxPVDkyYXBhNHI0bnl1d1B1OWFwaGozRzVtNHEvdTBCaGROZHY5aXh2K3d3?=
 =?utf-8?B?UE92b1BRbk42dkZubU9jZTBIL0lzNGoxckJCb01PZC9FWWpWNjJZNEFLUHBp?=
 =?utf-8?B?Zm5OR2pUOHdDQWZaSU1NYUZZM3VNamRyV1lORUNkNlh0V1ZQSlJqaDVNcUpB?=
 =?utf-8?B?eWx2dFowSHBkdUQwWnNYMmF5S3c2dHNVZjA5LzVnTGs4NFU5UGVjb3BFTE5D?=
 =?utf-8?B?MUdrUTUxM091em1QWk1ZMUVaSkV0QWZIT0RtRUFXbWlYTEtUaGpNYktKMi84?=
 =?utf-8?B?R1ZIZlU5QUFIWUx5dkRWaEw3UFVEUXhVOStPbGN5aWk0QTlRRTRRLzIzSCty?=
 =?utf-8?B?bkFaT3pscmlQMmppakE3YjM5QlpNUXZXY3N2NzUyVGtIajd5blB3WlRRa29P?=
 =?utf-8?B?SHlMdkFJN2FKb2lUM1E0Y2dNT0pZL2k2bEw2Si82clI4OWRvdXEzZHRPS0N2?=
 =?utf-8?B?SmlscGZDZnJaZW9oYUw0S1daRmJzVmY0VHhaamY0WXJOZEtLV2ZDbDBXWjIw?=
 =?utf-8?B?dC80MDN5N0VwVVdVT0NpdmJUQmEzS21wZldGb05iZDd3MlY0dGd0eC9HcXpz?=
 =?utf-8?B?WTI3eEZLZmN1SHpETEF0bEVkVEtlQ0FiQ212WU1SNGZ6VFcraU1CV01xNk9D?=
 =?utf-8?B?UmlLZFhpTnh6Q3I2VUFkK00xWEMveUlkMXVNU3ZYRG9ENk9UdVAzMDFhWmdQ?=
 =?utf-8?Q?0BMdg1UQpruW12O/GSxyraV2FUbyG3ZT?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?elMrWnUvay9nVkdodFRMOHQ5akNPVi9MQnZxRGJHUTFEbHpqNUYrVkhLbG9M?=
 =?utf-8?B?VVp3azFUSDR2SnpucUpoNHJER2VZT0dnUEduL1VEY0kyS1pjeTVQU2tnMitp?=
 =?utf-8?B?cVhjZkhWNGZGOWhzdWozSytQV1lDMUxBZWJ4Uko2RUkrZmRRMTQ0ekJKaENm?=
 =?utf-8?B?NmNTVVRUclRwNU9Lb1E1Ymg4ZHltdFRpakMyZDdZaXVJK0k5MjVmamF3UXdW?=
 =?utf-8?B?ajJKVDlxZFRqM3hqMDZURmNDaUljNE9VdVBvcncwV3BCeDd3cGxYalFZdUd2?=
 =?utf-8?B?OEVJQUhtOTFWVkh3MzI3cks2RFFRdzRJVVduTWNZR2F5TkJ0MGNBTWN4WlRX?=
 =?utf-8?B?dGsrTGpkUjdYU0NRUHV6MnJ2Ump1ODJyM2FrTVRRTkhMVXIzUys3dG4zdCtZ?=
 =?utf-8?B?dWFtTlUyc3B2MC9aK1Znd1lvWUZyUU5vYVRkcFd6TzkvcnVkOTU2bDdEQWo0?=
 =?utf-8?B?cjNNU3dnWVVjNnVyeGMxdmtQSlpIYmtGQVhaTWNXazJwVlVEWFo3UEJVTE5u?=
 =?utf-8?B?R1pxWkQ5SnVqNjFnQ3Bsay9IS3MxTFlaVTdsN2tFU0xnKzFTSDROMUlkcFVC?=
 =?utf-8?B?RSt6N1RkVEJFYTVnKzhaT29vN3ZsZmdJWGpFeEM0R3o5eUEzUFE5OWE4Qk1W?=
 =?utf-8?B?c2ZadjBsTjIyZGdRdUMraGo0TDZMU00xOVNKNm1OSG5uVi9TOC8zSkdac0xw?=
 =?utf-8?B?S3ZiUUFQc2k0WGhaWTE1dWV0TGNMcitVOEIwc1czVVBMc3FqR2RvZ3FMMVRP?=
 =?utf-8?B?OW9VcmtXdXU1YW5YZ3NVVmw3K2pJSEFmRk5vUTZ1TW03eWMrNVVpVGQ3U0lx?=
 =?utf-8?B?aFA4K3EwdzVTdlFaUVY4UzZyTWVFZGZrT0o0enZrM1RLUkVZTWQ3VjJkRWtM?=
 =?utf-8?B?bXFRMVFMNnZGV3l3M2prcjcwMHNCTEhGSndaTXg3eFRpV215MlJ4eWZJK1dv?=
 =?utf-8?B?LzVNTE50R1JiK05kYjlFYXJxUnUveFh4RDROMGZJWC9LMHlnTDBDaVM1TmQw?=
 =?utf-8?B?VnBHa2xFRFNyVjlpM2U1LzI1dm1hMGdQcG1CYy9SS3gyN2p3dWYvejVaZUQw?=
 =?utf-8?B?M2p2L3ZORFl0SXpJalFyMnFmUEJQdjI1ZjZIcWRXZHNIQW43OThKbFJraVAr?=
 =?utf-8?B?WjZhYnhCVWhHRHQxNmVNeEloQVZsTlhoaU5Md2RPaWlFTENmckt4N2NzcmZJ?=
 =?utf-8?B?NndXSVg4YWpsUGV2c2UzSFBuRWw3N1hMQ1E0UWRIT0tiR3NhaWJnYzdEV2Vh?=
 =?utf-8?B?anBISjByQlAvUzl6Tzd2Z2VVZGVYMFBHZDQzNTdYUUQ3azI4dW16cTQvU3pR?=
 =?utf-8?B?b3hRS0g4ajlXejJtMkswZ3JHVE13RkxoSGdKanFjVnRIWXM2ZXhsM1daMXdl?=
 =?utf-8?B?Mit6Z2pyWkZTSy92Y2pjdTlrQXZmVUZDZlcvNCtZQnpuZzRRVkV6TUVybFI2?=
 =?utf-8?B?cmpScktCa0oveHRnS2dkeUpMeXN5NHpNSUkwRGRLLzlzQWI2TU9IQUtjajVQ?=
 =?utf-8?B?Z1lYN2FRV2pSK3JMOGVPcFdQbUpuRDZNbnh6UENDOC9iT2ZmUy82OXc3RFRj?=
 =?utf-8?B?V2ljWHdTbys5WiswWnBuNnQyay9KaWZuNEc2Y0JvNWEvTzRCQTcxdWt4ZDVi?=
 =?utf-8?B?SFF4c0IzWEU5LzJnM1lsVEhONGI4ZGJ4WmxHbUJ2bDhHL3IyNHEwU05iTzYw?=
 =?utf-8?B?eXF2eXFFV3Nud2FBMUFHZlp2TWFBcVRpb0d0Umw0UlFEWUVUWGExMVVLQ0Na?=
 =?utf-8?B?NEpCV3ZkWENTOEEzUlVXbndQdVg1SXBCYWRlejFzUnR3V0p4TWxXWHBMMTVT?=
 =?utf-8?B?SzhXKzNQNStkN1NzbnQxMFhvaUhpU04vVHRUWVJQZC81dDdoaFNYYUNSVDhF?=
 =?utf-8?B?ZktFMTRwVVNBNUw4bldHbytWcVlCYk83T1ZKaS9Tbnd0elBWek5GUWJtZmRV?=
 =?utf-8?B?MGt2VEVGR1FSeTgzaXRpaXJ3OHlnMnBkZGVPcXdqb1d5MXNNUGhrcTIwbGZw?=
 =?utf-8?B?aGlOUU9SNzN3NHc3TGtQOVZaT2k3cGJRTjQ3Y3J0bEJOSmxXc1czUVVZa3B2?=
 =?utf-8?B?ZG1DZzl4WTkwbysrMm5pOVZKeHdjZHo1OW1ENCtUbzR1bG9IMnpxZkVORllB?=
 =?utf-8?B?SGJzeThrdnRnRmxpNE9hbWNTNEtCY00weEl2bWJNK21ZLzVkVnlwOFpJc2Ev?=
 =?utf-8?Q?wg+9EzYg8XwY0F2b94Rr0fU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7092a0d5-c501-417e-e6ef-08de01d432f4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2025 16:53:23.5625 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1fSA63exZreXiNp6+2+QE3zjcY2tRg1u2ja+LAJHJ5GyrT1u9xSfMjpIGdI5cuIdmZVnQEY9gNWEfI0x/A8HCiGPUNkIWzdfssBXKOr8yT0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6230
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

--------------BpJ1CNWAFWBWdTs3XJQpfGHS
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

<snip>
>>> +	xe_guc_ct_runtime_suspend(&guc->ct);
>>> +}
>>> +
>>> +/**
>>> + * xe_guc_runtime_resume() - GuC runtime resume
>>> + * @guc: The GuC object
>>> + *
>>> + * Runtime resume GuC CT and allow further runs of submission tasks on
>>> + * given GuC.
>>> + */
>>> +void xe_guc_runtime_resume(struct xe_guc *guc)
>>> +{
>>> +	guc_enable_irq(guc);
>> I don't think that this is a valid function to call in a VF (but will leave
>> the final judgement to Michal).
> I think commit 14fcd7361ed1 covers those cases?

I'm not familiar with the PM subsystem, so apologies if this is a dumb 
question, but what is the exact consequence of that patch?

1 - runtime suspend/resume functions for VFs are not called at all for 
VFs, even when the PF runtime suspends.
or
2 - runtime suspend/resume functions for VFs are called only when the PF 
runtime suspends.

If it is #1, are we saying that on VF it is fine to not call 
xe_guc_runtime_suspend/resume? and if so, why is this required on 
native/PF? None of the operations done in those functions are 
PF-specific, apart from the irq stuff.
If it is #2, then you still have the problem of not being able to call 
guc_enable_irq on VFs.

Or am I misunderstanding something?

Thanks,
Daniele

>
>>> +	xe_guc_ct_runtime_resume(&guc->ct);
>>> +	guc->submission_state.enabled = true;
>>
--------------BpJ1CNWAFWBWdTs3XJQpfGHS
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    &lt;snip&gt;<br>
    <blockquote type="cite" cite="mid:aN6mz1Ongl9uNDwM@black.igk.intel.com">
      <blockquote type="cite">
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">+	xe_guc_ct_runtime_suspend(&amp;guc-&gt;ct);
+}
+
+/**
+ * xe_guc_runtime_resume() - GuC runtime resume
+ * @guc: The GuC object
+ *
+ * Runtime resume GuC CT and allow further runs of submission tasks on
+ * given GuC.
+ */
+void xe_guc_runtime_resume(struct xe_guc *guc)
+{
+	guc_enable_irq(guc);
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
I don't think that this is a valid function to call in a VF (but will leave
the final judgement to Michal).
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I think commit 14fcd7361ed1 covers those cases?</pre>
    </blockquote>
    <br>
    I'm not familiar with the PM subsystem, so apologies if this is a
    dumb question, but what is the exact consequence of that patch?<br>
    <br>
    1 - runtime suspend/resume functions for VFs are not called at all
    for VFs, even when the PF runtime suspends.<br>
    or<br>
    2 - runtime suspend/resume functions for VFs are called only when
    the PF runtime suspends.<br>
    <br>
    If it is #1, are we saying that on VF it is fine to not call
    xe_guc_runtime_suspend/resume? and if so, why is this required on
    native/PF? None of the operations done in those functions are
    PF-specific, apart from the irq stuff.<br>
    If it is #2, then you still have the problem of not being able to
    call guc_enable_irq on VFs.<br>
    <br>
    Or am I misunderstanding something?<br>
    <br>
    Thanks,<br>
    Daniele<br>
    <br>
    <blockquote type="cite" cite="mid:aN6mz1Ongl9uNDwM@black.igk.intel.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">+	xe_guc_ct_runtime_resume(&amp;guc-&gt;ct);
+	guc-&gt;submission_state.enabled = true;
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">

</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------BpJ1CNWAFWBWdTs3XJQpfGHS--
