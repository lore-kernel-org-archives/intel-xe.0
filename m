Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74F25F8FA9E
	for <intel-xe@archiver.kernel.org>; Tue, 21 Apr 2026 17:24:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 381CD10E8E2;
	Tue, 21 Apr 2026 17:24:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YdoCqZXd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68A1F10E908
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Apr 2026 17:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776792250; x=1808328250;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=cqj0oUEbUaFaVeQuS5HkBKajLi9H4lOl8Ax1u6a2OA4=;
 b=YdoCqZXdYoxJl37M93V+gwtnFMlb/2y11JiL9WtUAINGokoR1UnIsgme
 djk9yc777kTjvzvBAWclC1sIlS9XOLBXTGWCwaD7AIQLx1wKunWI3fFx7
 CzcaaoEX5XRu0ZNeBYOnYnVW++bQC15VXt1q+2uyAHh+vQcf0KQQEDndA
 1PFYrWyyhQEb69vA976RKEc2hnXE88+qRl4aadif3SNPtRCEIB2Qt77kA
 Eni8XlEypMmFZC1slKUgYCjUJPw6O8EcplvnabY48ab8ex2Bm5ifhgXmU
 zPMa/zczoPi2sHARfPcHfwPnp3MJq534znIFnDWhFIa36ys1Kqv/Kr7M0 Q==;
X-CSE-ConnectionGUID: unCSIwIIQki5otwnXkg8mw==
X-CSE-MsgGUID: OydfYO8ATeST7AxfCfk7HA==
X-IronPort-AV: E=McAfee;i="6800,10657,11763"; a="81347389"
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; d="scan'208";a="81347389"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2026 10:24:10 -0700
X-CSE-ConnectionGUID: 1yxw1f/HTkazLaH3h22+EA==
X-CSE-MsgGUID: H9GO0eIHTrqoGlASzQxelw==
X-ExtLoop1: 1
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2026 10:24:10 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 21 Apr 2026 10:24:09 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 21 Apr 2026 10:24:09 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.35) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 21 Apr 2026 10:24:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j4z6zl5ONHSHPYnCDo95lKxsq+Lw4Clv9PdxDLeG4lOCIUUMOe1SGTMa75ZCAT30IUFo3hKETq6IYZCxe7gqCmMlQdtMImPA+fo80rjZ/fEbnuJ12+5BFlHthmhVWC4WlT1azf5OfekIR6CizFUjjjXN7elYc50c3Bp1H09trwo/uheQldsXglx208lgEHqyLPzNc19XoQ8Sqh0JYwLZVc80aMTc9GW2miDV9SbVeXwOLOVpo6xQwiyy68nn+b9EpE24gv4Db4J9uufxa2SiBGyG56vCjaf/0CXXBfSI1tvrIS0v3OApEn9r23ca9X7SW3U/pF0vo8SO+OA5qnWtcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=syEIussnsfEt2s3Dlqzgxfvi+U3q8lowd80hhU1Rycg=;
 b=Rnuh5WeAl02lbXV3HThXCFjPEVrlbk+npQKkbPQqow/GCMLgythrDmSxMPQIQ15EivZo947UYh5kRpAxw/ta+0hGutkL2zhgb6Rew6c8BI7BpOKF01Pbuk1TBI2WKzFgkgqwBRUexDxuXaOvtTgglwQ8Y8BZIkwi3xGlCRd7CVJun4dOUMfakEFLRvh3RBwALNWZTdwkAEEoVwbhGuSt0h4UkfJcdWrz+NsBhbbyIRR4UI5AzsHhFqvI9H55txi7T1ZAKa5GvCt1z2u4txNzMmfJuWxaWszOJFZ4Db7ncRUqG5eaFRJEg31qIPQAndl9NHixXI68AKIMyDwZQvm+hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by BL3PR11MB6481.namprd11.prod.outlook.com (2603:10b6:208:3bc::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.16; Tue, 21 Apr
 2026 17:23:57 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%3]) with mapi id 15.20.9846.016; Tue, 21 Apr 2026
 17:23:57 +0000
Message-ID: <71fb777f-1cd7-42ed-95df-08b6fd75f947@intel.com>
Date: Tue, 21 Apr 2026 19:23:51 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/guc: suppress GuC error logs when device is wedged
To: "Anirban, Sk" <sk.anirban@intel.com>, "Summers, Stuart"
 <stuart.summers@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>
CC: "Jadav, Raag" <raag.jadav@intel.com>, "Belgaumkar, Vinay"
 <vinay.belgaumkar@intel.com>, "Koujalagi, Mallesh"
 <mallesh.koujalagi@intel.com>, "Purkait, Soham" <soham.purkait@intel.com>,
 "Tauro, Riana" <riana.tauro@intel.com>, "Nilawar, Badal"
 <badal.nilawar@intel.com>, "Poosa, Karthik" <karthik.poosa@intel.com>,
 "Gupta, Anshuman" <anshuman.gupta@intel.com>
References: <20260420112925.1379274-2-sk.anirban@intel.com>
 <ced90e9252d7bed413b9c61d2f8495af72941bf7.camel@intel.com>
 <9bc30d5a-06ac-45db-a797-68f2b9c96722@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <9bc30d5a-06ac-45db-a797-68f2b9c96722@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DU6P191CA0062.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:53e::11) To LV2PR11MB6024.namprd11.prod.outlook.com
 (2603:10b6:408:17a::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|BL3PR11MB6481:EE_
X-MS-Office365-Filtering-Correlation-Id: 0234b782-366c-4189-f267-08de9fcac4a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|56012099003|18002099003|22082099003; 
X-Microsoft-Antispam-Message-Info: t5etkxFt/EWVE9xuV+SV9GBr87SVaZzUB6aEv/FMhNvIx903xwJO+eccp8pkbQviOPBThbRsF5VGqwsK7xgxNQebaHwb/EukSZyDUYIh1hxkmg1bl5m8+kNNY9S3opcQyA/B+w05ZI65PLvcelEjCfMxLXJCnplMJEqZEnZfT4Q3xmUqr7XIOe5PqhYnaPn90Ts+EVHnkSjyleHXgkL8hpn1gPnJkDUCVHVzZdQYSbn2WPOEAVkkWhZ9SJ1R6ttG3jKc0iLimylDjOJj3qwRLrlAce9P31/RhR/1U/zRN5QASmwWp40nMMJf5O4dyR23eBgqvfzRXpihObbCCTTzILBL9q8WknTUsMd7iA7iF/Fk7MYlH4JjDTE/Kt2F7JF2jUCyKSknQB8I4UCeo6jmQz7kYvTgYrIpcf5JhqxDLmtC5TNCzqkM25735B/0huGBjtsEcIDuxKeB5B+bK5YMEcgsdQFWHyQfSh8FshWOLQxYlY3Jqw/03Gi2CLGldSGu4vE2r4Jk9AovTC8GpIREWuwT9tkCcGtqPJOf2r23PdpKXPNLVuixFlZH5x8qBqp+GjMTkcSq5rc1XAAK5wQPh2RXC9EA4/3LFLilnQx3Pn7ZtOCepAlhoQmPWJEEwPu6bQqb2aP/RRM3zv+eKeWsdWeDxkgZb0dZ6q3AUnxj3WdECB1CuuFdJ0MWU2E1lHxWuMfaRywxSAKbg9oGBW5ZgPTPJbEs14dLrejzZjQBmEQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T0k1KzRzV3o5RWkwR0drQ3BPT0dBL21yYTdzcnNQUUgwci9hWndmQ0EyamJt?=
 =?utf-8?B?ZHVPcXFacjNRWFRkNkZkenZ2R2dBTDJCdTExOTBPNW9SUkN6MUdWc0ttTGdQ?=
 =?utf-8?B?aXArSlRNdWVNZGF2cktxeEY3Zk9saEFZRytJWjBUSDlsdi9YMU5ldTg0OEpq?=
 =?utf-8?B?U2dyNGk3Q0t6dWtwU0xTdXVpWk43anFPcVdGMGsxTVFiL1ZGQ2o2cUI5a1Fp?=
 =?utf-8?B?OVhpN1RmWWFsM09TdUZkNlA4eXBiTlJlRjlqOW5MSGFjcUEvajl6N1ROb2Vs?=
 =?utf-8?B?d2RHcE9SSzVrMlpoOHYvN3FVb1NNNW1oQXJ3dWdsV3BuOXF6N041T0RXOEt0?=
 =?utf-8?B?ZkNOOXFDU2V4aHhxeFJiL2wyU2swcS9mSzFiVldSZHJWOWQ5VzFocjV0cTFF?=
 =?utf-8?B?eEthTk5QYUNLZlMyVlE0N0FLMitGazVEdjBQRjVWck1mZDhGaFNINmtDaTZt?=
 =?utf-8?B?bmF4Vk8yTWQvdGRaQVFrbHpMRXlZQzZDd2dxNG1NTlo4eWpzUDgyK01WTFhS?=
 =?utf-8?B?eUpSRXczOWF2MmJPZ1hrZ2lMMG43TFUwTExocXlsWExodVgvTGNyNDZUdlVu?=
 =?utf-8?B?Y1E0MnFvWlJHYnIrSUplSjNTRmJRaEg4ckNocUlNUmtTSkhVSTF1a3haYjIy?=
 =?utf-8?B?ZlJ4VTVOejdDQzg4ZzFTSmoxbisvdlRWdGR6NTJ0d0tyYkhOci9IckVUc3dL?=
 =?utf-8?B?dGY1YjZFOTBESExhM3BiN3B1Tzlia0I2djdxdnk4c1lOV0xpNmwwZ053OXo0?=
 =?utf-8?B?TS9hV0F4aWlWKytIRmRzYXRZemVNRnVhTjVIK252L0REMHY1NEVIaVhodG5P?=
 =?utf-8?B?VnBZdEVVQW9DZ0tuZW9QOExVR0hLeVdNMTlXYnhvRGZCOEVaN09kYmJzRktp?=
 =?utf-8?B?VWs1aERtb25aaitIZFNOdmI3MDM3eEo1SUhibk9oSDhFSFQ5S0VhVGxqaHI2?=
 =?utf-8?B?TUpMbGI4cXN3VGhZclphcnVjYkRHSlVGNEwvclBqRFVXK2kzSVpoVkZTWnQz?=
 =?utf-8?B?bml3OEhTbWV2U0RVKzh6UDVMOXNzSWwrc0pYK2w3RE9wRE1yclhiYXNVK2dy?=
 =?utf-8?B?aFBjN1hIWk1aYVErK0QyVDNlWGMvQURUS2FjRzJyRFF6WjZKbFpsNDloY24r?=
 =?utf-8?B?TFFIdHU4clNHSUZJVlE1dUYrVkE2eldENmNpRzZOS2szN0RIcWNndkdDS3FH?=
 =?utf-8?B?b2JXcDBkbFNCZm8walI5dVdBendFQmpXOU5tSzJiKzdqMVVsMjhyUHpzUjJG?=
 =?utf-8?B?OTVVaFJXUzRESjhET2U0RGxCUnYyU3VrbDJJcWljc0VDMzYwWVBGRTVEVE1o?=
 =?utf-8?B?WHFRT3lqcUtCTTRoOWZHZmZNbVp1SzZGY2l3OVpNMVRkV0JnSGxrVHRlZlI2?=
 =?utf-8?B?K3Z3Yk81MGxrVk52QVpaV0dhVTZ4K2NaeWFGdGJnelJpd2Q2S01kV2lNRHlt?=
 =?utf-8?B?N003VGhKTk5CU0JJQjN1VXdxTU5taWljNCtHWURJekNpTm5wdFBEeFNkdXhE?=
 =?utf-8?B?U0ZZd3FPTmkrMkROY1kyWDloZ2JRS0hqWTZvTzhyRXRTdzI0MGJjMEhZQ0ph?=
 =?utf-8?B?NUEzTVlITWpsNFRPb01HRXMyZW8vSGNHTXVkVWdKekNSRE82MXNKV2xaVVpZ?=
 =?utf-8?B?OFAxWERNdUhsL2Z1czN3STczRjBaemsyYmpoTmlVVmhsQm9Rd28vUUtQclUz?=
 =?utf-8?B?M08rTGJodGdYTXFWSVFpd1dzOVcyYUIvT2pUaXJjcEVUU0Y1R2FoZmtqOXh2?=
 =?utf-8?B?RDRYa0Jsb3hCem5tTDAvdG1WSEJNNjBUZ0dkWVFGNHBIWWR6N1RMNVdSOTJY?=
 =?utf-8?B?a29aeUhYV3crK0ZVSnNWRE0rY3drY293eGp3TDJxMGRDT1UvY1JkRnVNeEw5?=
 =?utf-8?B?bFcrbzIrK05zdDRpOG9DS0NPL2dXbVFPVTMzVVF6U1dybDFHYUNnQ1RMN1B5?=
 =?utf-8?B?Y2NHcFh4ai92YmdkeEwrOTc3cS9XWStLOGNLbWx4dlJsNHZLZUJxS0F0eVMx?=
 =?utf-8?B?Q1JSZ3dJZnhwVUxJUjRBTk9MbWc5eVBsZjVtaWh3VGJXd0ZtT1p3VExsQUtv?=
 =?utf-8?B?blM2dWpObjZpYUJXMTk3NW9ZMjlLb0srOWhHODhXUzVMNXpmbERsUEtNVDBh?=
 =?utf-8?B?dndLZlphQmZzaVFJK3EyMmR6bUxGZXdDdW1WNDlvODZqSGdBVHRrK0FMa2J2?=
 =?utf-8?B?S3gyZ0I1bHRrNmFOcWhzdmxJdFhJZTRJdEZ0RHRzM1BFKy9tZVVKcW5PdDhL?=
 =?utf-8?B?WjRrVXN6UFcwNzZBNDVpRG5OdktvVThBbUZoUTZEV0xzN2Y0V0M2NGhMTWJi?=
 =?utf-8?B?UWFmdmh3TlpPU2hmaGoyRjdsOGQ5c2lYN2dPMng5ejdxVE5HMWNxbG1PVlg0?=
 =?utf-8?Q?K6U3GHuUuFisSgIw=3D?=
X-Exchange-RoutingPolicyChecked: NxU77SnANFXNaz2o22LafHU4IFB2FEb6KJbhBOOTAY4ozndtkOvkqRZ+gttZBTgCGa3CHMkUHFBAKBFTq0xqNlvYWxGoRIzd208IxGaN98nq37a8Z391vWeCM7Nhp/tkLaQMKFaGF43jMQszdNpKG7mZrumotDaP98ImBIvI4v35T2KOtgBXcQFNHRWmJ8arkzM0ztuCUmNYx4LPi5n5qbKFvddch8WYUKfkX7JykWFlKmJ7gKsjypv52m4c/UT/Bq6B0Q/Gvj7IIp4RUECQbkFoXwqBjotoCN+J5/qT7lejYPO8gKDvQoXqSNdE8sDRmpAgHyNc/g3XFL6v4uA8jA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0234b782-366c-4189-f267-08de9fcac4a2
X-MS-Exchange-CrossTenant-AuthSource: LV2PR11MB6024.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2026 17:23:57.0075 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XcDWIbHmw3+AptX0JkvMDaiG7NJkutjUP+ED+YAlCZ0AQus92iEc0pkr2K5BtjHq8AxD46uc4FmrF12SZgRQ29B6KfqQtHBQWLoi+x6FbxM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6481
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

+ Matt

On 4/21/2026 5:44 PM, Anirban, Sk wrote:
> Hi,
> 
> On 21-04-2026 01:21 am, Summers, Stuart wrote:
>> On Mon, 2026-04-20 at 16:59 +0530, Sk Anirban wrote:
>>> When the device is wedged, GuC CT sends return -ECANCELED. This is

not 100% true

GuC CT returns -ECANCELED when CT is stopped
GUC CT is stopped also during GT reset
When device is wedged, CT is stopped

>>> expected behavior, not an actionable error. Avoid logging these as
>>> errors in the engine activity and power profile code paths.
>>>
>>> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_guc_engine_activity.c | 8 +++++---
>>>   drivers/gpu/drm/xe/xe_guc_engine_activity.h | 2 +-
>>>   drivers/gpu/drm/xe/xe_guc_pc.c              | 4 ++--
>>>   drivers/gpu/drm/xe/xe_uc.c                  | 5 ++++-
>>>   4 files changed, 12 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_guc_engine_activity.c
>>> b/drivers/gpu/drm/xe/xe_guc_engine_activity.c
>>> index 2b99c1ebdd58..700f3464fb63 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc_engine_activity.c
>>> +++ b/drivers/gpu/drm/xe/xe_guc_engine_activity.c
>>> @@ -464,18 +464,20 @@ int
>>> xe_guc_engine_activity_function_stats(struct xe_guc *guc, int
>>> num_vfs, bool
>>>    *
>>>    * Enable engine activity stats and set initial timestamps
>>>    */
>>> -void xe_guc_engine_activity_enable_stats(struct xe_guc *guc)
>>> +int xe_guc_engine_activity_enable_stats(struct xe_guc *guc)
>>>   {
>>>          int ret;
>>>            if (!xe_guc_engine_activity_supported(guc))
>>> -               return;
>>> +               return 0;
>>>            ret = enable_engine_activity_stats(guc);
>>> -       if (ret)
>>> +       if (ret && !(xe_device_wedged(guc_to_xe(guc)) && ret == -
>>> ECANCELED))
>> Is there a reason we don't handle all of the cases described in
>> __guc_ct_send_locked()? It looks like before we do the ct->state ==
>> STOPPED check (which is where we'd return -ECANCELED), we also check if
>> the CT is broken (i.e. we got some bad return value from GuC and marked
>> CT as "dead", hence returning -EPIPE here) or disabled (and return -
>> ENODEV).
>>
>> Same question for the other cases you have below.
>>
>> Thanks,
>> Stuart
> -ECANCELED is the specific error returned when the CT is stopped & device is wedged.

to be clear: -ECANCELED was introduced only to indicate that H2Gs
are lost due to CT being stopped, usually as part of the GT reset
see dc75d03716fe and 94de94d24ea8

and it doesn't mean that device was wedged - hence extra checks...

> Other errors may indicate different fault conditions and imo should be useful to log those.

> 
> This follows the same pattern as pc_action_reset.

but that pattern doesn't look great either

maybe we should add that wedged check at the CT layer and then use
different error code, like -ENOTRECOVERABLE, to avoid duplicating
the same condition by the all callers?

OTOH, if we expect that there is no point in reporting errors
after we declare WEDGED state, maybe the same rule should apply
to the errors after GT reset? so we can just look for -ECANCELED?

btw, IMO we should rather focus on avoiding going to wedged state
than trying to silence any follow-up error messages (that to some
extend proves that driver either correctly noticed the fault or
that we missed to perform some explicit cleanups and driver still
continues to do something that shouldn't be doing after wedged)

> 
> Thanks,
> 
> Anirban
> 
>>
>>>                  xe_gt_err(guc_to_gt(guc), "failed to enable activity
>>> stats%d\n", ret);
>>>          else
>>>                  engine_activity_set_cpu_ts(guc, 0);
>>> +
>>> +       return ret;
>>>   }
>>>     static void engine_activity_fini(void *arg)
>>> diff --git a/drivers/gpu/drm/xe/xe_guc_engine_activity.h
>>> b/drivers/gpu/drm/xe/xe_guc_engine_activity.h
>>> index b32926c2d208..188f325a462d 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc_engine_activity.h
>>> +++ b/drivers/gpu/drm/xe/xe_guc_engine_activity.h
>>> @@ -13,7 +13,7 @@ struct xe_guc;
>>>     int xe_guc_engine_activity_init(struct xe_guc *guc);
>>>   bool xe_guc_engine_activity_supported(struct xe_guc *guc);
>>> -void xe_guc_engine_activity_enable_stats(struct xe_guc *guc);
>>> +int xe_guc_engine_activity_enable_stats(struct xe_guc *guc);
>>>   int xe_guc_engine_activity_function_stats(struct xe_guc *guc, int
>>> num_vfs, bool enable);
>>>   u64 xe_guc_engine_activity_active_ticks(struct xe_guc *guc, struct
>>> xe_hw_engine *hwe,
>>>                                          unsigned int fn_id);
>>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c
>>> b/drivers/gpu/drm/xe/xe_guc_pc.c
>>> index 7ecd91ad6192..efcd432ef6ef 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
>>> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
>>> @@ -1202,7 +1202,7 @@ int xe_guc_pc_set_power_profile(struct
>>> xe_guc_pc *pc, const char *buf)
>>>          ret = pc_action_set_param(pc,
>>>                                    SLPC_PARAM_POWER_PROFILE,
>>>                                    val);
>>> -       if (ret)
>>> +       if (ret && !(xe_device_wedged(pc_to_xe(pc)) && ret == -
>>> ECANCELED))
>>>                  xe_gt_err_once(pc_to_gt(pc), "Failed to set power
>>> profile to %d: %pe\n",
>>>                                 val, ERR_PTR(ret));
>>>          else
>>> @@ -1306,7 +1306,7 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
>>>            /* Set cached value of power_profile */
>>>          ret = xe_guc_pc_set_power_profile(pc,
>>> power_profile_to_string(pc));
>>> -       if (unlikely(ret))
>>> +       if (ret && !(xe_device_wedged(xe) && ret == -ECANCELED))
>>>                  xe_gt_err(gt, "Failed to set SLPC power profile:
>>> %pe\n", ERR_PTR(ret));
>>>            return ret;
>>> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
>>> index 75091bde0d50..b440cf8c431d 100644
>>> --- a/drivers/gpu/drm/xe/xe_uc.c
>>> +++ b/drivers/gpu/drm/xe/xe_uc.c
>>> @@ -215,7 +215,10 @@ int xe_uc_load_hw(struct xe_uc *uc)
>>>          if (ret)
>>>                  return ret;
>>>   -       xe_guc_engine_activity_enable_stats(&uc->guc);
>>> +       ret = xe_guc_engine_activity_enable_stats(&uc->guc);
>>> +
>>> +       if (xe_device_wedged(guc_to_xe(&uc->guc)) && ret == -
>>> ECANCELED)
>>> +               return ret;
>>>            /* We don't fail the driver load if HuC fails to auth */
>>>          ret = xe_huc_auth(&uc->huc, XE_HUC_AUTH_VIA_GUC);

