Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E0D4CD98E2
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jun 2026 18:49:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1338310EAEA;
	Wed, 17 Jun 2026 18:49:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eCQrF8ot";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ECFF10EAEA
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jun 2026 18:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781722153; x=1813258153;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=5ynuXH7WFDRJG5ZWSPj/LFBQKvGzJDubWauVp5VAvb8=;
 b=eCQrF8otj2HNctyEPD3p/bNJSRaFYAoxGFQBO7e5iwitsyuJNYgXHSjB
 wJSDs6UgMi1LE8bYENQpS8lwBVN97XWYkPwXZHKZwTWGpOCK0IDzKGG6u
 LpiA9kCxnAxTC2mMo2xWVF9oqK5pRIwQBlroRSHFQybA6273V9f9Il0Nq
 fbRKL06gh4qrE8p4WVczymLQSaP747xrCG2fkZx+Qbq4jvKd20Fo2x/o6
 kH5NL5gQSDKDWd7yPGku9CHglAIjkNhYhnSaL6/1mRAoduf79BsD7dKxj
 H9xA2J0f6k7VmkGBfEkepzciXHFmzmvd0LCRSned6yMI+bVRAW7ByCuDM w==;
X-CSE-ConnectionGUID: LZPgqb8+TLWsgynCUXbcbA==
X-CSE-MsgGUID: JRSdUXLTR+yrYy/nDeed7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11820"; a="93191998"
X-IronPort-AV: E=Sophos;i="6.24,210,1774335600"; d="scan'208";a="93191998"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 11:49:12 -0700
X-CSE-ConnectionGUID: mWUnbRIjSSS2aNW3zMNFVg==
X-CSE-MsgGUID: OkWyKMOKTBCKOObI3bMGXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,210,1774335600"; d="scan'208";a="252451390"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 11:49:13 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 17 Jun 2026 11:49:12 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 17 Jun 2026 11:49:12 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.52) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 17 Jun 2026 11:49:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JvsBI0xe2sF2vj2RdJj7KgowkH3IFj1Abs/yQUxkBwWDs0mRWGcRiqV6BtBZ0XY80myoLC/AgYqlvVNMRvDJm3Nlb3v6oI5IpmfIIWwBoTS+L6AvUenZKApYNRsZ4Av3l2nVCn1d6DJgAfRbBKSbndCxUN/QW/s9nCPSzHY3+Fekq9OtaYr5VsVrqKTxY7lj1nQzkkAqfmSWrxe/sP0d8IU2kcRu+pfM+cYXEINylVTY5JtTUe6Zsz+fF0/y9poVLQmaGfHxm3k8PmQlkDHxxfJmtaUSQbdriucpTXMsy891oIzOP3LXzs51AL0XYGqVrwC7F2AHLWHIobVjGyFXXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6s3bzVMp2UVRAA24kvQH1Qa1BYeqdC+yoTGGg1EAQAM=;
 b=jHl7iV/TUL0bmuYS3LUyvSnL9xAhzrPyd1tkf10h0YgP2u0MbZ3EBcYFAinqKe6BpMPM6FnjZCQ8cRTDMH5msgrAqUat4CcDA9Km4wdJdr/Rrd1Y29YJ6FSAKFpBahqaJAfJ4VRJnpcEBHv5J2z15lL0SnyLXuw6rX4HQVw3qw7uL75iSeLSBbFbaIqXI0DuCM+MFUwEwvnl8Dw+llOZC55WO/lkP/TM6CqgNIivCzUb5nLKkcpoDTFDgns6AOBrc9CMx7FUecj9pTZSVqyahhMP4EiyU8db9m5bZq/SXvAFbJdKIfsIS14zpjFg+rWRvgVQMy0XnqkKvUywKFbmAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8706.namprd11.prod.outlook.com (2603:10b6:610:1d1::22)
 by PH8PR11MB6563.namprd11.prod.outlook.com (2603:10b6:510:1c2::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Wed, 17 Jun
 2026 18:49:07 +0000
Received: from CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::e419:ae5c:91ec:1e9d]) by CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::e419:ae5c:91ec:1e9d%6]) with mapi id 15.21.0139.009; Wed, 17 Jun 2026
 18:49:06 +0000
Message-ID: <7cef02f0-059f-46d5-923c-04a61e0ce720@intel.com>
Date: Thu, 18 Jun 2026 00:18:56 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/1] drm/xe/xe_ras: Add RAS GPU health indicator
To: "Nilawar, Badal" <badal.nilawar@intel.com>,
 <intel-xe@lists.freedesktop.org>, <riana.tauro@intel.com>,
 <anshuman.gupta@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <raag.jadav@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <mallesh.koujalagi@intel.com>, <andi.shyti@intel.com>,
 <rodrigo.vivi@intel.com>
CC: <anoop.c.vijay@intel.com>
References: <20260610093353.2538576-3-soham.purkait@intel.com>
 <20260610093353.2538576-4-soham.purkait@intel.com>
 <3467c712-8507-45c7-8ac7-2a32265ceb29@intel.com>
Content-Language: en-US
From: "Purkait, Soham" <soham.purkait@intel.com>
In-Reply-To: <3467c712-8507-45c7-8ac7-2a32265ceb29@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0109.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b5::14) To CH3PR11MB8706.namprd11.prod.outlook.com
 (2603:10b6:610:1d1::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8706:EE_|PH8PR11MB6563:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f7468bc-5575-4808-74c9-08decca11bb8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|22082099003|18002099003|4143699003|11063799006|3023799007|56012099006|921020|6133799003;
X-Microsoft-Antispam-Message-Info: 0y8/Vb+XQnItl6JxI+EMzPk9tZhU/6tLVUsIn/0F+TE4wLQzI7fDI7CLBzfxmOq95H3wrtaCmObb8HVqp9jkzZJcGx8vUxjZDYmZjpPQqOMclMClwInGxCtwKTB7yb+rNWnm/+WreYaOuexxcrB3FHJayKs9sVDcTjjXI9PTPwSSG5KxKAxJlY1ctpXZdL3vdblccXsQfPWRatp7f/spYCah718iexfIdpVvcyhCwoUm5l4xjcNxKWGKTDsSUhNejGUzLjUNdpGKfY2evrefmM19YkxYLQfSIP4rIRbFXPqh3MSl/R/EDxZnf+QIjNA2ln/fHScPrYtJ2ht1EpNXUeZZRiGhEJGcCVjC17lGzWQCks5mENxqoVn6KPJcD2ewNTMTlAqgEuycbgi6at+JiiX3gb8V0Nq59+buK3v5AzWfpcB7dVaVNhrNJ8EH6WPtnD1w8YuJ/iHGIVt/IXEW8X/MEh31YvFAfSUYUg54vfevM+Eci5ZBxmr7Fq4h3oIRYMIFpcDbxD43cD8xq3VzPf7RMSwX627cPYPzEMI2dzD6OJGwDmh+TuZkxRbDDnGMFbfC8r3wx/B1Ebo0qaPylfzE/bYXuoupQP2qjpOnE+sBLkaDWyOzznTKp209CsWK+a3tSoqTO6tkj8BuwwXW5mZSz6bRm1/gvkGQ0c+5IiMpvWyfCeQLSqy3YTtquNvYFb11ylVWcJb4GGGnBCk0YCC8h8t1UQox5iCAbqKbctk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8706.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(22082099003)(18002099003)(4143699003)(11063799006)(3023799007)(56012099006)(921020)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z1JmdWVIaU9ZWG9mL2hKb1BsczJueTN3OS8rZ2FRalY1S3FmTmZGTENlZndL?=
 =?utf-8?B?cHZ2OEJyeURnazhjT0dRVldrQ0crN2J5SlBwM3BpRHNDTVRRNzVGZlZ3MlVN?=
 =?utf-8?B?dXR2QndrNzFBeEpMOFA2MmtsNWMydFp3UzRkMFdvaUZQblF4MHExdWRlOXBE?=
 =?utf-8?B?WVZncFVEc3k2b2ZIU2xEbHNtNFRXNDJDMVlHTUNmcFl1WUJ5V0pzNEk2d1ZT?=
 =?utf-8?B?R0I0YkZESkF3cUNqZzNqejZ5TGtJeEl6Q0ZGZkJyTHdwYXhLa0FMQkFxZGNt?=
 =?utf-8?B?MVBQdWJQRXFrR2JpZ2o0SkhmcFVjY0Nhbmx6N0FHZlRIZ3piOW10STFnMUp0?=
 =?utf-8?B?V3RkbkY2OVlQczlXVzNIVVpKOVpoZys5UlFxMEFhSjk5dWx2V2JPS3UzQlFz?=
 =?utf-8?B?NVdMdjUrcHRlQUp0UndONlJTaGJzSUJPemU2L1MwQjFWR09mcWVnQW1hVjVu?=
 =?utf-8?B?NVlDMWllOXUwVk5pVVo3dUtPWmYxdDRNd2w2amovVWFtdVF3cFAwV0NZWnh0?=
 =?utf-8?B?QVl3QlkxWFhtM2JPTXhLejdBaEFTSTE1T09xc3NKN2NCcE1aV0grUk5qb3lL?=
 =?utf-8?B?bzNXRnFUMEZlSFVRM1huVVNrUGdxSEYwR001bFg5cHpINi9VQ2RmNXVqTmNz?=
 =?utf-8?B?eDJmNzBBU2pOMUs1WE44cTZ5UkZTK3RZMFI2cTVYSWh5L05kSkt0MzVjMS9p?=
 =?utf-8?B?OVZUVzd2ellqUXd2dDFZT08xUURUaHBUNmxRZk83eWR5Y3FBMmU5Z0VlZnF5?=
 =?utf-8?B?c2ZSaVR0bkY4dkltNWJtMWJ1RTYvRVFaZWhpampRMkhBNXpRRm1KN29haXlU?=
 =?utf-8?B?MCtOeElHaFdmeHZEVXZDZDFlaGw3SmFCVDExeEFuQmExckxhMzFyaWhzWFl0?=
 =?utf-8?B?d3cxSWNQbTlnYi9lMHgvWU5pWmxxclYzTmIrZmhCamRrRW1LZXZjUk5zbmk2?=
 =?utf-8?B?WHBtWlVqcFhDa2ZnRlhoR25waGs0Z2NSQ1Q5R0wwVFBqaHFXQmRTOEx2TWlq?=
 =?utf-8?B?VjZSb0ZqUSt5SlBPN3o5OFdxZGdMN2R2OUUzbGsvZ3RBenM0bitudmRlcVJN?=
 =?utf-8?B?YzZEUWNnNXRVYmNTdFFFUm9hdzk2OVRuczcyd2M0UFJxNWNEOEhwV1RGNGRZ?=
 =?utf-8?B?azhtQXl0ZXVaUWUrN0haZmFtMzcvTkN1ZEQ2TEVMaXBRcUxIUHo1Z1VRYk9F?=
 =?utf-8?B?cnhGN1M3S0hybGtWN1creGtVZVFpb1FmOGdvK2NteExXUS9aYVJ1RlBWNGpY?=
 =?utf-8?B?ZklVQURlNlJGL3R4RzVjeHNmbDZpY3VxcmxFYXQ3UjF2bnFHTlRTQVdzUGRy?=
 =?utf-8?B?VzdUYUtyM29zNUg4TEpjTHFocWdaSTFQczI1K2Y3elBlRkQwTlRIb1k0RXhv?=
 =?utf-8?B?NSs0KzI3Vi9sTXZCQ2JKSjYxeHlacFNEalJ5emx3YmdENStuRy9MM1ZWYjZ5?=
 =?utf-8?B?bkNQdm1xd29KZGkvRUw0dUJVSUV6L1ZaY2Q3QU9aZTkzVTVsaG9oQTlmR0xC?=
 =?utf-8?B?RDNldjhYYndpd0lvTndBem00VzVhdmV5TmpYRGNNVGszNTBKekZPbFk2UGh4?=
 =?utf-8?B?dzlNR3FLbEV3ZCtKUXo3UHM3aHdKZUtCeGpsUEQrWnJ5QWNvREc5UDJPeGJZ?=
 =?utf-8?B?NEZDTU9BQzUwRVN1akQzWkdRSWR5WjVMRUIrTEhvcUxJeEluellsZ0xwajBV?=
 =?utf-8?B?VGtveTI0WE5CbUNNSC90bWljeCtSYURzaVFialV6SnMxSytDWEVrZmdFQmZn?=
 =?utf-8?B?RU9iNXc3dGF1KzVEb3d4SWV1ckk1ZXZBcjRsMGczeDIyNXdFcWUvdUxtcWZE?=
 =?utf-8?B?RUk5eUp4ck1HL0Qra2RGU2NqaUlSVktYaXhwU1AyQlo4dUxTTGRzY1Q2L2dM?=
 =?utf-8?B?M3NtbVUrZHhRUEdzZHhRMHdkWkhIa3RCY0o3S053UmlyYjE3cW1CcVF5dk1M?=
 =?utf-8?B?QjhhVzFjNjhyM3lYMFlFaDhCVExTRXF1V1VhWVBMRFl3UlZ3cXdqS0VtSldv?=
 =?utf-8?B?KzQ4Rk8vUnhtWGVTQ1hOeXdHaWpndm50ajcxVVE3VFY0dkNWT1pabzlDeWNO?=
 =?utf-8?B?dDZMa1BpeVM4QUJqY2JwSExLdGt5dEpMRjZjU3gwcDAwWG9vK0xHRVBrYnhq?=
 =?utf-8?B?TnQzK21paWpOL0FFYzk2ZWFGS1Flbk5XQ2FmNW5nMTBiQ2lIK0cycy9UZTFL?=
 =?utf-8?B?QkhLaWVMWHhiTWgzcHBkdHJQR1hYZGNBcTIwbHpYVHpYSUY3Tm9HUm03dGlo?=
 =?utf-8?B?MFV2alBkVTRIRWUwUWxaV05LT082YndVQkFUS2NVdHNyOFVIckJMTlRIdElq?=
 =?utf-8?B?Q1FhTCtOdjdFaFFxaFMyRFczYWdOblFuS0ppWkV6RnpnUVVKc1BTMlJUZU5w?=
 =?utf-8?Q?0zBSdgS6pJvYInHg=3D?=
X-Exchange-RoutingPolicyChecked: lgF7wkcPPlP1hY1Yl1h5Qtzp8hmBnE/Pz2W3zLNIDGDKAlcehiwljhWtWT2X4+PZpZ3D5Xg9OZh2EkRQjFqSmFf9oqExLC4R0hk5fWYJ9CAfX5dptXYN1QiF/D4fFx0loc7d/2FQC/y4Rly2aQPo93d3xD9vdP1rKWvgdfM6sTwK7hy0LuK0aIQRYEu0cDcAf0SOj4lY+tlBIj/CiHxgrJqcHFm2ONiTsQxIwRG5bcKNK3XRsZkfqSjaC7pVh0Cesuo47m+qrhvUdY8WMTijLcCNBHylYZern7zY4aZhcPkO7UJxgOkufhrenIqF1kNGnUaU4xpHLpanJCupEdo/lw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f7468bc-5575-4808-74c9-08decca11bb8
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8706.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 18:49:06.5111 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XQ0jBPqlIAcvSBQQXvXnhynuOytN4OShi+y7CUWZhoMrBApBpkHj+BE6zwlRy8u7VY1g1QX0aNkcXaDBzJOS0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6563
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

Hi Badal,

On 17-06-2026 14:05, Nilawar, Badal wrote:
>
> On 10-06-2026 15:03, Soham Purkait wrote:
>> Add a sysfs interface that reports the current GPU health state and
>> lets admin users and management tools update it but is readable by all
>> users. Requests are routed through the sysctrl mailbox. The interface
>> is present only on platforms that support the GPU health indicator.
>>
>> The interface is a single read/write file at the device level:
>>
>>    $ cat /sys/.../device/gpu_health
>>    ok
>>
>>    $ echo critical > /sys/.../device/gpu_health
>>
>>    $ cat /sys/.../device/gpu_health
>>    critical
>>
>> v1:
>>   - Add enum for health status. (Andi, Rodrigo)
>>   - Return error number instead of error message in _show/_store. (Andi)
>>   - Move GPU health sysfs init error logging to xe_ras_init. (Andi)
>>   - Return only the current health state for sysfs read. (Andi, Rodrigo)
>>   - Add documentation for sysfs interface. (Andi, Rodrigo)
>>
>> v2:
>>   - Make logs and structures consistent with their counterparts. (Riana)
>>   - Drop unnecessary variables. (Andi, Riana)
>>   - Add correct KernelVersion. (Raag)
>>
>> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
>> Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> ---
>>   .../ABI/testing/sysfs-driver-intel-xe-ras     |  30 +++
>>   drivers/gpu/drm/xe/xe_ras.c                   | 177 ++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_ras.h                   |   1 +
>>   drivers/gpu/drm/xe/xe_ras_types.h             |  60 ++++++
>>   drivers/gpu/drm/xe/xe_sysctrl_mailbox.c       |  28 +++
>>   drivers/gpu/drm/xe/xe_sysctrl_mailbox.h       |   3 +
>>   drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |   4 +
>>   7 files changed, 303 insertions(+)
>>   create mode 100644 Documentation/ABI/testing/sysfs-driver-intel-xe-ras
>>
>> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-ras 
>> b/Documentation/ABI/testing/sysfs-driver-intel-xe-ras
>> new file mode 100644
>> index 000000000000..c7f2cf8bb6ad
>> --- /dev/null
>> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-ras
>> @@ -0,0 +1,30 @@
>> +What:        /sys/bus/pci/drivers/xe/.../gpu_health
>> +Date:        April 2026
>> +KernelVersion:    7.2
>> +Contact:    intel-xe@lists.freedesktop.org
>> +Description:
>> +        This file exposes the current GPU health state and allows 
>> the GPU
>> +        health state to be updated.
>> +
>> +        This sysfs file is present only on Intel Xe platforms that 
>> support
>> +        the GPU health indicator interface for RAS. Reading the current
>> +        health state is available to all users, while updating the 
>> health
>> +        state is restricted to administrative users only.
>> +
>> +        Read returns a single line containing one of the valid 
>> values for
>> +        the current device health state. Writing one of the valid 
>> values
>> +        updates the current device health state.
>> +
>> +        The valid values for the device health state are:
>> +
>> +            ok
>> +                The device is healthy and operating within normal
>> +                parameters.
>> +
>> +            warning
>> +                The device is experiencing minor issues but remains
>> +                operational.
>> +
>> +            critical
>> +                The device is in a critical state and may not be
>> +                operational.
>> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
>> index 4cb16b419b0c..b7efd607aadf 100644
>> --- a/drivers/gpu/drm/xe/xe_ras.c
>> +++ b/drivers/gpu/drm/xe/xe_ras.c
>> @@ -4,11 +4,14 @@
>>    */
>>     #include "xe_device.h"
>> +#include "xe_pm.h"
>>   #include "xe_printk.h"
>>   #include "xe_ras.h"
>>   #include "xe_ras_types.h"
>>   #include "xe_sysctrl.h"
>>   #include "xe_sysctrl_event_types.h"
>> +#include "xe_sysctrl_mailbox.h"
>> +#include "xe_sysctrl_mailbox_types.h"
>>     /* Severity of detected errors  */
>>   enum xe_ras_severity {
>> @@ -31,6 +34,16 @@ enum xe_ras_component {
>>       XE_RAS_COMP_MAX
>>   };
>>   +/* RAS response status codes */
>> +enum xe_ras_response_status {
>> +    XE_RAS_STATUS_SUCCESS = 0,
>> +    XE_RAS_STATUS_INVALID_PARAM,
>> +    XE_RAS_STATUS_OP_NOT_SUPPORTED,
>> +    XE_RAS_STATUS_TIMEOUT,
>> +    XE_RAS_STATUS_HARDWARE_FAILURE,
>> +    XE_RAS_STATUS_INSUFFICIENT_RESOURCES
>> +};
>> +
>>   static const char *const xe_ras_severities[] = {
>>       [XE_RAS_SEV_NOT_SUPPORTED]        = "Not Supported",
>>       [XE_RAS_SEV_CORRECTABLE]        = "Correctable Error",
>> @@ -50,6 +63,33 @@ static const char *const xe_ras_components[] = {
>>   };
>>   static_assert(ARRAY_SIZE(xe_ras_components) == XE_RAS_COMP_MAX);
>>   +static const char * const gpu_health_states[] = {
>> +    [XE_RAS_HEALTH_STATUS_OK]        = "ok",
>> +    [XE_RAS_HEALTH_STATUS_WARNING]        = "warning",
>> +    [XE_RAS_HEALTH_STATUS_CRITICAL]        = "critical"
>> +};
>> +static_assert(ARRAY_SIZE(gpu_health_states) == 
>> XE_RAS_HEALTH_STATUS_MAX);
>> +
>> +static int ras_status_to_errno(u32 status)
>> +{
>> +    switch (status) {
>> +    case XE_RAS_STATUS_SUCCESS:
>> +        return 0;
>> +    case XE_RAS_STATUS_INVALID_PARAM:
>> +        return -EINVAL;
>> +    case XE_RAS_STATUS_OP_NOT_SUPPORTED:
>> +        return -EOPNOTSUPP;
>> +    case XE_RAS_STATUS_TIMEOUT:
>> +        return -ETIMEDOUT;
>> +    case XE_RAS_STATUS_HARDWARE_FAILURE:
>> +        return -EIO;
>> +    case XE_RAS_STATUS_INSUFFICIENT_RESOURCES:
>> +        return -ENOSPC;
>> +    default:
>> +        return -EPROTO;
>> +    }
>> +}
>> +
>>   static inline const char *sev_to_str(u8 severity)
>>   {
>>       if (severity >= XE_RAS_SEV_MAX)
>> @@ -91,3 +131,140 @@ void xe_ras_counter_threshold_crossed(struct 
>> xe_device *xe,
>>               comp_to_str(component), sev_to_str(severity));
>>       }
>>   }
>> +
>> +static ssize_t gpu_health_show(struct device *dev, struct 
>> device_attribute *attr, char *buf)
>> +{
>> +    struct xe_ras_get_health_response response = {0};
>> +    struct xe_sysctrl_mailbox_command command = {0};
>> +    struct xe_ras_get_health_request request = {0};
>> +    struct xe_device *xe = kdev_to_xe_device(dev);
>> +    enum xe_ras_health_status health;
>> +    size_t rlen = 0;
>> +    int ret;
>> +
>> +    xe_sysctrl_create_command(&command, XE_SYSCTRL_GROUP_GFSP, 
>> XE_SYSCTRL_CMD_GET_HEALTH,
>> +                  &request, sizeof(request), &response, 
>> sizeof(response));
>> +    guard(xe_pm_runtime)(xe);
>> +    ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
>> +    if (ret) {
>> +        xe_err(xe, "sysctrl: failed to send get health command 
>> %d\n", ret);
>> +        return ret;
>> +    }
>> +
>> +    if (rlen != sizeof(response)) {
>> +        xe_err(xe, "sysctrl: unexpected get health response length 
>> %zu (expected %zu)\n",
>> +               rlen, sizeof(response));
>> +        return -EIO;
>> +    }
>> +    if (response.current_health >= XE_RAS_HEALTH_STATUS_MAX) {
>> +        xe_err(xe, "sysctrl: invalid health state %u\n",
>> +               response.current_health);
>> +        return -EIO;
>> +    }
>> +
>> +    health = (enum xe_ras_health_status)response.current_health;
>> +
>> +    xe_dbg(xe, "[RAS]: get health:%s\n", gpu_health_states[health]);
>> +
>> +    return sysfs_emit(buf, "%s\n", gpu_health_states[health]);
>> +}
>> +
>> +static ssize_t gpu_health_store(struct device *dev, struct 
>> device_attribute *attr,
>> +                const char *buf, size_t count)
>> +{
>> +    struct xe_ras_set_health_response response = {0};
>> +    struct xe_sysctrl_mailbox_command command = {0};
>> +    struct xe_ras_set_health_request request = {0};
>> +    struct xe_device *xe = kdev_to_xe_device(dev);
>> +    enum xe_ras_health_status health;
>> +    size_t rlen = 0;
>> +    int ras_status;
>> +    int state;
>> +    int ret;
>> +
>> +    state = sysfs_match_string(gpu_health_states, buf);
>> +    if (state < 0) {
>> +        xe_err(xe, "[RAS]: invalid health state '%.*s'\n",
>> +               (int)strcspn(buf, "\n"), buf);
>> +        return -EINVAL;
>> +    }
>> +
>> +    request.new_health = (u8)state;
>> +
>> +    xe_sysctrl_create_command(&command, XE_SYSCTRL_GROUP_GFSP, 
>> XE_SYSCTRL_CMD_SET_HEALTH,
>> +                  &request, sizeof(request), &response, 
>> sizeof(response));
>> +    guard(xe_pm_runtime)(xe);
>> +    ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
>> +    if (ret) {
>> +        xe_err(xe, "sysctrl: failed to send set health command 
>> %d\n", ret);
>> +        return ret;
>> +    }
>> +
>> +    if (rlen != sizeof(response)) {
>> +        xe_err(xe, "sysctrl: unexpected set health response length 
>> %zu (expected %zu)\n",
>> +               rlen, sizeof(response));
>> +        return -EIO;
>> +    }
>> +
>> +    ras_status = ras_status_to_errno(response.status);
>> +    if (ras_status) {
>> +        xe_err(xe, "sysctrl: set health command failed with status 
>> %d\n",
>> +               response.status);
>> +        return ras_status;
>> +    }
>> +
>> +    if (response.current_health >= XE_RAS_HEALTH_STATUS_MAX) {
>> +        xe_err(xe, "sysctrl: invalid health state %u\n",
>> +               response.current_health);
>> +        return -EIO;
>> +    }
>> +
>> +    health = (enum xe_ras_health_status)response.current_health;
>> +
>> +    xe_dbg(xe, "[RAS]: set health:%s\n", gpu_health_states[health]);
> The [RAS] prefix is redundant here as xe_dbg macro already includes 
> driver/subsystem context.

xe_dbg  does not print [RAS] prefix by default. This convention is 
already being used in upstream: <operation>:<value> <component> <severity>

>> +
>> +    return count;
>> +}
>> +
>> +static DEVICE_ATTR_RW(gpu_health);
>> +
>> +static void gpu_health_sysfs_fini(void *arg)
>> +{
>> +    struct device *dev = arg;
>> +
>> +    device_remove_file(dev, &dev_attr_gpu_health);
>> +}
>> +
>> +static int gpu_health_sysfs_init(struct xe_device *xe)
>> +{
>> +    struct device *dev = xe->drm.dev;
>> +    int err;
>> +
>> +    err = device_create_file(dev, &dev_attr_gpu_health);
>> +    if (err)
>> +        return err;
>> +
>> +    err = devm_add_action_or_reset(dev, gpu_health_sysfs_fini, dev);
>> +    if (err)
>> +        return err;
>> +
>> +    return 0;
>> +}
>> +
>> +/**
>> + * xe_ras_init - Initialize Xe RAS
>> + * @xe: xe device instance
>> + *
>> + * Initialize the RAS GPU health sysfs interface.
>> + */
>> +void xe_ras_init(struct xe_device *xe)
>> +{
>> +    int ret;
>> +
>> +    if (!xe->info.has_sysctrl || IS_SRIOV_VF(xe))
>> +        return;
>> +
>> +    ret = gpu_health_sysfs_init(xe);
>> +    if (ret)
>> +        xe_err(xe, "[RAS]: failed to initialize GPU health sysfs, 
>> err=%d\n", ret);
> ditto.
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h
>> index ea90593b62dc..8acfd0ffe48e 100644
>> --- a/drivers/gpu/drm/xe/xe_ras.h
>> +++ b/drivers/gpu/drm/xe/xe_ras.h
>> @@ -11,5 +11,6 @@ struct xe_sysctrl_event_response;
>>     void xe_ras_counter_threshold_crossed(struct xe_device *xe,
>>                         struct xe_sysctrl_event_response *response);
>> +void xe_ras_init(struct xe_device *xe);
>>     #endif
>> diff --git a/drivers/gpu/drm/xe/xe_ras_types.h 
>> b/drivers/gpu/drm/xe/xe_ras_types.h
>> index 4e63c67f806a..4767bcf315a3 100644
>> --- a/drivers/gpu/drm/xe/xe_ras_types.h
>> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
>> @@ -10,6 +10,21 @@
>>     #define XE_RAS_NUM_COUNTERS            16
>>   +/**
>> + * enum xe_ras_health_status - Device health status values
>> + *
>> + * @XE_RAS_HEALTH_STATUS_OK: Device is healthy and operating normally.
>> + * @XE_RAS_HEALTH_STATUS_WARNING: Device has minor issues but is 
>> still operational.
>> + * @XE_RAS_HEALTH_STATUS_CRITICAL: Device is in a critical state and 
>> may not be operational.
>> + * @XE_RAS_HEALTH_STATUS_MAX: Sentinel value for validation
>> + */
>> +enum xe_ras_health_status {
>> +    XE_RAS_HEALTH_STATUS_OK = 0,
>> +    XE_RAS_HEALTH_STATUS_WARNING,
>> +    XE_RAS_HEALTH_STATUS_CRITICAL,
>> +    XE_RAS_HEALTH_STATUS_MAX
>> +};
>> +
>>   /**
>>    * struct xe_ras_error_common - Error fields that are common across 
>> all products
>>    */
>> @@ -70,4 +85,49 @@ struct xe_ras_threshold_crossed {
>>       struct xe_ras_error_class counters[XE_RAS_NUM_COUNTERS];
>>   } __packed;
>>   +/**
>> + * struct xe_ras_get_health_request - Request structure for GFSP 
>> GET_HEALTH
>> + *
>> + * GET_HEALTH takes no input parameters; the reserved payload is 
>> kept to
>> + * preserve the firmware wire layout and allow future extensions. The
>> + * driver must zero all reserved fields.
>> + */
>> +struct xe_ras_get_health_request {
>> +    /** @reserved: Reserved for future use. */
>> +    u32 reserved[2];
>> +} __packed;
>> +
>> +/**
>> + * struct xe_ras_get_health_response - Response structure for GFSP 
>> GET_HEALTH
>> + */
>> +struct xe_ras_get_health_response {
>> +    /** @current_health: Current GPU health, see &enum 
>> xe_ras_health_status */
>> +    u8 current_health;
>> +    /** @reserved: Reserved for future use */
>> +    u8 reserved[3];
>> +} __packed;
>> +
>> +/**
>> + * struct xe_ras_set_health_request - Request structure for GFSP 
>> SET_HEALTH
>> + */
>> +struct xe_ras_set_health_request {
>> +    /** @new_health: New GPU health to set, see &enum 
>> xe_ras_health_status */
>> +    u8 new_health;
>> +    /** @reserved: Reserved for future use */
>> +    u8 reserved[3];
>> +} __packed;
>> +
>> +/**
>> + * struct xe_ras_set_health_response - Response structure for GFSP 
>> SET_HEALTH
>> + */
>> +struct xe_ras_set_health_response {
>> +    /** @status: Status of set health operation, see &enum 
>> xe_ras_response_status */
>> +    u32 status;
>> +    /** @current_health: Resulting current GPU health, see &enum 
>> xe_ras_health_status */
>> +    u8 current_health;
>> +    /** @reserved: Reserved for future use */
>> +    u8 reserved[3];
>> +    /** @reserved1: Reserved for future use */
>> +    u32 reserved1[2];
> If firmware wire layout permits then how about combining reserved 
> fields in single appropriately sized array.
Regarding the reserved fields, I was thinking to keep it as is (as 
documented) to avoid the confusion.
Thanks,
Soham
>> +} __packed;
>
> Missing blank line here.
>
> Thanks,
> Badal
>
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c 
>> b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
>> index 3caa9f15875f..9507f68bc2eb 100644
>> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
>> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
>> @@ -293,6 +293,34 @@ static int sysctrl_send_command(struct 
>> xe_sysctrl *sc,
>>       return 0;
>>   }
>>   +/**
>> + * xe_sysctrl_create_command() - Create system controller command
>> + * @command: Sysctrl command structure
>> + * @group_id: Command group ID
>> + * @cmd_id: Command ID
>> + * @request: Pointer to request buffer (can be NULL)
>> + * @request_len: Size of request buffer
>> + * @response: Pointer to response buffer
>> + * @response_len: Size of response buffer
>> + *
>> + * Helper function to build sysctrl command to be sent via 
>> %xe_sysctrl_send_command()
>> + */
>> +void xe_sysctrl_create_command(struct xe_sysctrl_mailbox_command 
>> *command, u8 group_id, u8 cmd_id,
>> +                   void *request, size_t request_len, void *response,
>> +                   size_t response_len)
>> +{
>> +    struct xe_sysctrl_app_msg_hdr header = {0};
>> +
>> +    header.data = FIELD_PREP(APP_HDR_GROUP_ID_MASK, group_id) |
>> +              FIELD_PREP(APP_HDR_COMMAND_MASK, cmd_id);
>> +
>> +    command->header = header;
>> +    command->data_in = request;
>> +    command->data_in_len = request_len;
>> +    command->data_out = response;
>> +    command->data_out_len = response_len;
>> +}
>> +
>>   /**
>>    * xe_sysctrl_mailbox_init - Initialize System Controller mailbox 
>> interface
>>    * @sc: System controller structure
>> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h 
>> b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
>> index f67e9234de48..fb434cc165b2 100644
>> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
>> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
>> @@ -23,6 +23,9 @@ struct xe_sysctrl_mailbox_command;
>>   #define XE_SYSCTRL_APP_HDR_VERSION(hdr) \
>>       FIELD_GET(APP_HDR_VERSION_MASK, (hdr)->data)
>>   +void xe_sysctrl_create_command(struct xe_sysctrl_mailbox_command 
>> *command, u8 group_id, u8 cmd_id,
>> +                   void *request, size_t request_len, void *response,
>> +                   size_t response_len);
>>   void xe_sysctrl_mailbox_init(struct xe_sysctrl *sc);
>>   int xe_sysctrl_send_command(struct xe_sysctrl *sc,
>>                   struct xe_sysctrl_mailbox_command *cmd,
>> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h 
>> b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>> index 84d7c647e743..f82e3fb9b5ef 100644
>> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>> @@ -23,9 +23,13 @@ enum xe_sysctrl_group {
>>    * enum xe_sysctrl_gfsp_cmd - Commands supported by GFSP group
>>    *
>>    * @XE_SYSCTRL_CMD_GET_PENDING_EVENT: Retrieve pending event
>> + * @XE_SYSCTRL_CMD_GET_HEALTH: Retrieve current health status
>> + * @XE_SYSCTRL_CMD_SET_HEALTH: Set new health status
>>    */
>>   enum xe_sysctrl_gfsp_cmd {
>>       XE_SYSCTRL_CMD_GET_PENDING_EVENT    = 0x07,
>> +    XE_SYSCTRL_CMD_GET_HEALTH        = 0x0B,
>> +    XE_SYSCTRL_CMD_SET_HEALTH        = 0x0C,
>>   };
>>     /**
