Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FAC0C61DD3
	for <intel-xe@archiver.kernel.org>; Tue,  1 Sep 2026 21:27:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AA7110EF40;
	Tue,  1 Sep 2026 21:27:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JH3rq+PV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A40D10EF40
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Sep 2026 21:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788298032; x=1819834032;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=t+bFO2LWy+YCCsWNQr95zM37jY0+el7sM1wk6ghUR/s=;
 b=JH3rq+PVYXM33YmxAh9cwKjC4bA69MMAqLY5LHsY2fVR6I6rkHIwNPGk
 LHnxF81WMroz+QDqRrzpaZTUc//OtWcaumorasK1b2KSZobkbncZnMZc4
 kwIG9P9DNAvgA1E7eVDUwB4RVQTmGk3ev5vSCudMQ383HVmC/vDWehoG3
 czdvmJxAaAj9v2Q+NZiTU1rb2lXWKmzhH3lG/Rvat63jdoddlhwiWSHR+
 z/yExb7oV6uPdyOM5tFHI/kHnRluOqLk6TAeze7GMkRukAzkICszV9YY+
 NZejWk2HAJNfemkWzeyvuZQgSvrJ+ufp0u7qV5L7Hl0HetCXkbQejtUzY g==;
X-CSE-ConnectionGUID: CPCUFKXMTy6j8hBx+TKkVg==
X-CSE-MsgGUID: S6tJdoyIQPaz47deGCkbyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="87683640"
X-IronPort-AV: E=Sophos;i="6.25,256,1779174000"; d="scan'208";a="87683640"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2026 14:27:12 -0700
X-CSE-ConnectionGUID: XMfzM2mYRIG5jls6jIil7A==
X-CSE-MsgGUID: ndvxqelSTIuJWukX7R5K4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,256,1779174000"; d="scan'208";a="307446869"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2026 14:27:13 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 1 Sep 2026 14:27:12 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 1 Sep 2026 14:27:12 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.27) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 1 Sep 2026 14:27:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZmleUA8948KBS41isk9ZzwWD6+frn6FK9bhr8ur8eR1bVatD0qc27xedR0wJAbe96rPYFTShzqJ2ent/bfDGBWtLS4F7R2y8NRFj+TIT2h3YTNpiqpx3r9RZYq6rrUStg6v5HwoBAg4tbI7O+CV4hI7UtC/E69TFYzu8Ecd5U7LaqiZVKkmqCAipSwOLkYWeIUotOpVw5dVfWAU8c58YFQXAVEZBmnevB0bS9Tb/ymlqaOMkgWg2YelcFRjr+mvHAQs03g0UTw8bUdxSc2FwAUEqI6R9qBTlwhUbVoQ9JhnVgIdVtFh0Usl4GDqYjtBrzoYX1g1E8ZlWrkoSD7OnFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wo2+9wKD4SJ/cXlZQ+B+yP54PCRVoOYIReo8p3goMo8=;
 b=vMTmRPZVLrtjSUfnPn1hpPFKZ1chqs3pk/23cpz/H5PTHwtYNONp9Ls6Yp6ZuAZFmCLC3hcLuKCb6yRmz1txtZ3whNUJL3ilLl6OYacfm/Ut4rh9KBLwa5by7K/pbSZZw9pIgv2l8fRyMyPuN4wmwrVi77XqK+vRi6KCDp43DqJVeOIpV8hqxLbDedV9av+6n0hhBQhmoK58tmnSSL/DIj/lPwL6M9vV0B5mbose3tDQrKQUshPry63pUjZLj4lVMTFqtJWv6EkdPiN9IZTY5qyxpT0ZVFen1TRb79x5itk5E9EkcmmLzkkaruPcgUSJJM+VVur3SQYslDS9hO8LqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by DM3PPF453C3BEC4.namprd11.prod.outlook.com (2603:10b6:f:fc00::f1b) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Tue, 1 Sep
 2026 21:27:01 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::f3ff:11d0:7a52:db0c]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::f3ff:11d0:7a52:db0c%5]) with mapi id 15.21.0360.008; Tue, 1 Sep 2026
 21:27:01 +0000
Message-ID: <608531df-0478-456c-8f2d-2c5425fb9c41@intel.com>
Date: Tue, 1 Sep 2026 14:26:59 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/debugfs: Expose per-engine idle status
To: "Anirban, Sk" <sk.anirban@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <riana.tauro@intel.com>, <karthik.poosa@intel.com>, <raag.jadav@intel.com>,
 <soham.purkait@intel.com>, <mallesh.koujalagi@intel.com>,
 <matthew.brost@intel.com>, <rodrigo.vivi@intel.com>,
 <michal.wajdeczko@intel.com>
References: <20260723194303.2507234-2-sk.anirban@intel.com>
 <ecfc0273-eab7-4d5a-8937-53da468a5a73@intel.com>
 <d4cff797-ed1c-47c6-a25a-43547641af4d@intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <d4cff797-ed1c-47c6-a25a-43547641af4d@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0339.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::14) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|DM3PPF453C3BEC4:EE_
X-MS-Office365-Filtering-Correlation-Id: f5b453c5-6573-4306-26bc-08df086fc2cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|10067099003|6133799003|4143699003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 0N1rJiQ8CeTwRWEAJJpTwBvwdOuY9CegK4V4JHfJ24jqCCrb9xcBz/4mO2vQNBZSbW+qCZRNEAqYTpq1CdKpjOpB2STJnuQnwtDhlHVjhIzOKeoCj67AMU5xIhgA8p404YnZL927X5bb3QzRftrWFkyqoGtZ3ANnpwRBLyWBNReiyAHQJ2XmnrKM+EWX94v53RJYUGyY+bO1OT9JKvNvFZjNK3LTo34BqYcRHTzwXaps+fi5/KWn3ePvM27cZtkKMJVl7vqSU06eC+hxN+9yeQEXeNaPB+SRpwugROxk5QXbQXRu9iMkskSgli+MH1jxkGqgUWlMOfQ7RJ/tYhlRe9JsYda0egX6wYyFtCmjHgaH69TsWr8+QvNxAN13OWgsvQgN8jxdXZKGQyfoncYmme5UIH9FFBkVcmR9Cd0oonZRRzMI2BvYP7CebFjjifL1n4kenfUlG6+tdGSXq9crfvZtnno9ahZTXOsTrCRZg37RLmT16OdvGbcOIZPxTcsQyn7RQE4nWL1kiTwidxC+Ti3XKb64ysdQx8v20HhR3PuTwPf10h7Llvo1l2XIP4xlUfUQ7J8ldGajhGSBJnEIj8zRW//DgnhHQKIc24jX0gl9R4Y9dV2mUy3/oent2k0buu17BvQnjk5t3JubUdFdL1zMZOfKe4u4KfCfIXQtizc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(10067099003)(6133799003)(4143699003)(56012099006)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QUMwNHhmdGhNWTFSdmd4ckYwamROa2QwTUFhSUx5K1VsU3lxbXV4MUJ2ZWhC?=
 =?utf-8?B?QzlVTWM3cUFCUFA5L21NTUNtdDlmSDdSVW5yNE9sQWFrWWthSGNBR2libG1S?=
 =?utf-8?B?WmtXVllBYTUzUVRYQlRTaGlyTUJ3dTlkblVCQ25hSHU5bktpTzdtMzBVWlNu?=
 =?utf-8?B?L005MWp0eGxVcHRSemhyakNPZWcyQW9jQnZPd0I2TVdxQk9sTCtxYjFKa2sw?=
 =?utf-8?B?dy9NbXVEZEpMZkFOZHJ1T1hpaU5FK1FRVUFFcTlieU5hZTREZTNNNHhIWUJK?=
 =?utf-8?B?bDZEVkhlcEN6c0s2cTRGQUhHOXVoOTkyY2hQUUZUa0RVcUkxSnFOM1FCN05V?=
 =?utf-8?B?STY1eFdvcE40cVBLUmtSSEpUbVFOSE1XS3RRN3dpODJnWjJKT0xLRmRXdEps?=
 =?utf-8?B?dXB6dEIvbnFyYzN1U3JHcGVxc1RjZk5Zdk14ejZvYThZWkt1NFVETFJ1Tlpu?=
 =?utf-8?B?c2liclA1M1A5M2Fhb0xLT3diWGx6ZktGN1hnRnBKay9NTmYxSU5LcVpHalFZ?=
 =?utf-8?B?MFNweUk5d0tjMkhEdkEwSHVlYyszTUx4VHBBTGdkSUhaam43Z24vUlg5aGxI?=
 =?utf-8?B?ZHhXOUZZTyt1WUNManllenVrSTJabEEvY05ZeVR6WDV4T0pxY0JhTGdyYUhF?=
 =?utf-8?B?MlNJMXUzSXRnSTJyejdPNld5Z0JMTEFWNk1lcyt3THdSdDBaWWQ1TUdkeVhu?=
 =?utf-8?B?dWpaN0Jxc0xVcnlPaHZMN0FjTjNtcTYzSFdST2JWellBOWl3UUdUeEozQjM0?=
 =?utf-8?B?aDI3OEZoMUg3V01va3cvTDUybzh1VFNvQ2M3WVVXb212dk9saUczOTdnT1d2?=
 =?utf-8?B?TEw0RWY4L09maTFvSHlvemF4TUE3ZW1ZeEVFUjRPaHZ5Y2o3ODg4ZHhwam9H?=
 =?utf-8?B?dDd5RzlLQkg3SlQ3bE5kWE1MNmhIY1VKbGdkNmdyQlY2eXU2WWpvM0IrUDFU?=
 =?utf-8?B?U0JPUlI3aEdKTEdMQmJVS0VNVW5LNlNrZDQ1VEVwRUlDd0s5WldlblI2VHNy?=
 =?utf-8?B?NVZ5ek9ZYWFNTWtaYTFRaTBFUFM5cFFjaThZTXdkczVNQ0J5ajVwTkZvZzJT?=
 =?utf-8?B?dUN6Wnk4WUZNUmlQZHlqTGpVOFBGSWNQL3VZbENEc2lCM0d3OHRMc29NS0Ru?=
 =?utf-8?B?ZTIzZVNDYkNKblZXVEpnT3ZBcFFVWHBFeTRJVkhrVUNPODA5U3JjQWJvZ3Z2?=
 =?utf-8?B?YmdVU2gwajF0cnJIVUNpaWdoYkJ1UWJ0TUZqWHQ1Z1pJOE1RZEJaRHgxM3Fs?=
 =?utf-8?B?ZFZ1TCs4aGplOTdWNE9TZER3cU9saVpKcHQzUEowdUxYc0MvckNobEFBWERS?=
 =?utf-8?B?b3JLdnBmRXpTcXViTStvNFlYN2pvQ2phMjN4ZEcwTkkrL2NyYkRRRlVTbDZk?=
 =?utf-8?B?RWxTL05tb2tzaTFpVmxsZ2tJWUNqSytRcVBaZTFqVHYzU0lUUVdIM0d5eXJK?=
 =?utf-8?B?OW5YNEZRMFdSbktDSVYwb3FHK2d6TFAyM0t6aThSaGhmbGZ1Um5hdG8rdmps?=
 =?utf-8?B?eHZhME9kWTZuWnBSeHFnakRjNTMycXM5RWVrN2pNU1d2cmg4RXUrWmg5QjZB?=
 =?utf-8?B?dWRtbzJqQ3lGcVljRTBsV2dnaWRLK1JiSlVRYkV0cjRkYzNTNjk2UVd1c1RP?=
 =?utf-8?B?aFJtYVZBeUhZQlRlK0FYODhGdHlvZVp2QnhmT3R0K0xodS9TR2laVVpwSUo1?=
 =?utf-8?B?VXJid1FBS3VLT3hwa1cwZWYyR09XakFqYTlzdWdvZmVhU0pqR2xvWnhLWS9N?=
 =?utf-8?B?TitnN05XWTBCUlo3VmU0WUpRcms4VzhGKzFsVG9PbUs2bEpFemJqT2t1cVhM?=
 =?utf-8?B?K3ZWbDBvWmZuQjFjU3R6cGhGQVQyQWZtS1dGV3R2WlRGM1FCUWhiSUdBV3cx?=
 =?utf-8?B?UVd6cDlhUUg0a3kvNW1qYnI2UFY1cGhVTW9nU3IycWlWc2tMR3pvNEZVV2ov?=
 =?utf-8?B?ZVBGME5QYmpDUmFUU0lOK3hFK2lYaHJJcGk4U29ZdzQ2eU52VDgySjBONCtG?=
 =?utf-8?B?VlhSbldnYjg4ZTNpS3RFaHpRanVKNlBPSHZPV3FSNkNVb3RZSVRGMjdpZ3lx?=
 =?utf-8?B?MTd4eDFDdzhIbjlMN2F1ZnpKQUNQUGZvWnE0RFdVRWF4dDB4Mk5OSDNud3pp?=
 =?utf-8?B?Wll0T3hPY0FtOG9XaUdqU1VZK21qTk5pMmJ6WnkwVlFJQ1V3MklaemFONTc1?=
 =?utf-8?B?ejAyKzREKy9vamRnMXV0ak9MMVdwanQzUm1POVdYY2NkSVN0alc5cHhZWTJy?=
 =?utf-8?B?ejhjUVB3b0dDS3NRb1Q1Zkpsb3pOZkZheWt0L0FTVlBpdy94UUxYYTgrU2Jj?=
 =?utf-8?B?bDlFWHhaeENIdnNDcGRlbjR2dXkvU1JKV0YwMm1MVkJqM1NNL2FCZjJYcEg5?=
 =?utf-8?Q?6LlXCQRUhUrwjsuU=3D?=
X-Exchange-RoutingPolicyChecked: QkQpzb6vDWYB+Ej32+Bv9uEsjd5w0zIy1c2qePKbp5hWZaAl8JK/3LaRvJ+kIe+8kCrqKkOooKpefa4JYk8zKDHDR64+IlQ01JrqrD+jT5PcbG988JEG+RfdKUfAPM7EI6GsWWy0DDnK8Kw1gqhfzlGsetV4I3RHO9Txn4fsatoCK5ObPJ/TfPgaDS1QBPEQOfYv0cZnV9jDxUKaFR6KBLjt6bky8ydoe7i0kj8cZQ2DfNQPeafL/Mr/HCCAUvuH64gm2Wu7db4wSx3Y5g/ReDJUt60e3C2CmtYfd7ZDaoyBoC/nzhnEsj6l8ZLRK9i9gyzoG6F+bwWRqrBlx/ymag==
X-MS-Exchange-CrossTenant-Network-Message-Id: f5b453c5-6573-4306-26bc-08df086fc2cd
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 21:27:01.5119 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3IoYiCLc1I9tYi+7VGN6AoSTQOui7J2HjsCpNpbLzdZvsXQOc3z2WUgLAAIZd/0rX6oAsolhpVOOkB+xVvSGT7azeo94eUoAFIHhwtGmymY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF453C3BEC4
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


On 9/1/2026 8:12 AM, Anirban, Sk wrote:
> Hi,
>
> On 29-08-2026 05:00 am, Belgaumkar, Vinay wrote:
>>
>> On 7/23/2026 12:43 PM, Sk Anirban wrote:
>>> Extend the existing "hw_engines" debugfs to iterate over all hardware
>>> engines and dump their idle state: whether the engine pipe is idle or
>>> busy, whether C6 entry is allowed, and (where available) the forcewake
>>> request status.
>>>
>>> v2: Use existing debugfs (Matt Brost)
>>>
>>> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/regs/xe_gt_regs.h | 27 ++++++++++++++
>>>   drivers/gpu/drm/xe/xe_devcoredump.c  |  4 ++-
>>>   drivers/gpu/drm/xe/xe_gt_debugfs.c   | 54 
>>> +++++++++++++++++++++++++++-
>>>   drivers/gpu/drm/xe/xe_guc_capture.c  |  2 --
>>>   4 files changed, 83 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h 
>>> b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>>> index 08251c7a1a4b..accf3012bad2 100644
>>> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>>> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>>> @@ -196,6 +196,33 @@
>>>   #define   MSC_MSAA_REODER_BUF_BYPASS_DISABLE    REG_BIT(14)
>>>   #define   FAST_CLEAR_VALIGN_FIX            REG_BIT(13)
>>>   +#define MSG_IDLE_CS                XE_REG(0x8000)
>>> +#define MSG_IDLE_VCS0                XE_REG(0x8004)
>>> +#define MSG_IDLE_VCS1                XE_REG(0x8008)
>>> +#define MSG_IDLE_VCS2                XE_REG(0x80C0)
>>> +#define MSG_IDLE_VCS3                XE_REG(0x80C4)
>>> +#define MSG_IDLE_VCS4                XE_REG(0x80C8)
>>> +#define MSG_IDLE_VCS5                XE_REG(0x80CC)
>>> +#define MSG_IDLE_VCS6                XE_REG(0x80D0)
>>> +#define MSG_IDLE_VCS7                XE_REG(0x80D4)
>>> +#define MSG_IDLE_VECS0                XE_REG(0x8010)
>>> +#define MSG_IDLE_VECS1                XE_REG(0x80D8)
>>> +#define MSG_IDLE_VECS2                XE_REG(0x80DC)
>>> +#define MSG_IDLE_VECS3                XE_REG(0x80E0)
>>> +#define MSG_IDLE_BCS0                XE_REG(0x800C)
>>> +#define MSG_IDLE_BCS1                XE_REG(0x8680)
>>> +#define MSG_IDLE_BCS2                XE_REG(0x8684)
>>> +#define MSG_IDLE_BCS3                XE_REG(0x8688)
>>> +#define MSG_IDLE_BCS4                XE_REG(0x868C)
>>> +#define MSG_IDLE_BCS5                XE_REG(0x8690)
>>> +#define MSG_IDLE_BCS6                XE_REG(0x8694)
>>> +#define MSG_IDLE_BCS7                XE_REG(0x8698)
>>> +#define MSG_IDLE_BCS8                XE_REG(0x869C)
>>> +#define MSG_IDLE_GSCCS0                XE_REG(0xA62C)
>>> +#define   MSG_IDLE_INDICATION            REG_BIT(0)
>>> +#define   MSG_IDLE_C6_ALLOWED            REG_BIT(1)
>>> +#define   MSG_IDLE_FW_STATUS            REG_GENMASK(13, 9)
>> This field is called FW_REQ in bspec, we should stick to the same, so 
>> MSG_IDLE_FW_REQ.
> Sure, I will modify this.
>>> +
>>>   #define XE2LPM_CCCHKNREG1            XE_REG(0x82a8)
>>>     #define VF_PREEMPTION                XE_REG(0x83a4, 
>>> XE_REG_OPTION_MASKED)
>>> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c 
>>> b/drivers/gpu/drm/xe/xe_devcoredump.c
>>> index 5f2b90b18f97..b918f046ae15 100644
>>> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
>>> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
>>> @@ -127,8 +127,10 @@ static ssize_t __xe_devcoredump_read(char 
>>> *buffer, ssize_t count,
>>>         drm_puts(&p, "\n**** HW Engines ****\n");
>>>       for (i = 0; i < XE_NUM_HW_ENGINES; i++)
>>> -        if (ss->hwe[i])
>>> +        if (ss->hwe[i]) {
>>>               xe_engine_snapshot_print(ss->hwe[i], &p);
>>> +            drm_puts(&p, "\n");
>>> +        }
>>>         drm_puts(&p, "\n**** VM state ****\n");
>>>       xe_vm_snapshot_print(ss->vm, &p);
>>> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c 
>>> b/drivers/gpu/drm/xe/xe_gt_debugfs.c
>>> index c38bcacb27e4..621d1e57e997 100644
>>> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
>>> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
>>> @@ -10,6 +10,7 @@
>>>   #include <drm/drm_debugfs.h>
>>>   #include <drm/drm_managed.h>
>>>   +#include "regs/xe_gt_regs.h"
>>>   #include "xe_device.h"
>>>   #include "xe_force_wake.h"
>>>   #include "xe_gt.h"
>>> @@ -22,6 +23,7 @@
>>>   #include "xe_guc_hwconfig.h"
>>>   #include "xe_hw_engine.h"
>>>   #include "xe_lrc.h"
>>> +#include "xe_mmio.h"
>>>   #include "xe_mocs.h"
>>>   #include "xe_pat.h"
>>>   #include "xe_pm.h"
>>> @@ -111,6 +113,38 @@ int xe_gt_debugfs_show_with_rpm(struct seq_file 
>>> *m, void *data)
>>>     static int hw_engines(struct xe_gt *gt, struct drm_printer *p)
>>>   {
>>> +    static const struct {
>>> +        struct xe_reg reg;
>>> +        bool has_fw;
>>> +    } msg_idle_reg[XE_NUM_HW_ENGINES] = {
>>> +        [XE_HW_ENGINE_RCS0] = { MSG_IDLE_CS, true },
>>> +        [XE_HW_ENGINE_BCS0] = { MSG_IDLE_BCS0, true },
>>> +        [XE_HW_ENGINE_BCS1] = { MSG_IDLE_BCS1, false },
>>> +        [XE_HW_ENGINE_BCS2] = { MSG_IDLE_BCS2, false },
>>> +        [XE_HW_ENGINE_BCS3] = { MSG_IDLE_BCS3, false },
>>> +        [XE_HW_ENGINE_BCS4] = { MSG_IDLE_BCS4, false },
>>> +        [XE_HW_ENGINE_BCS5] = { MSG_IDLE_BCS5, false },
>>> +        [XE_HW_ENGINE_BCS6] = { MSG_IDLE_BCS6, false },
>>> +        [XE_HW_ENGINE_BCS7] = { MSG_IDLE_BCS7, false },
>>> +        [XE_HW_ENGINE_BCS8] = { MSG_IDLE_BCS8, false },
>>> +        [XE_HW_ENGINE_VCS0] = { MSG_IDLE_VCS0, true },
>>> +        [XE_HW_ENGINE_VCS1] = { MSG_IDLE_VCS1, true },
>>> +        [XE_HW_ENGINE_VCS2] = { MSG_IDLE_VCS2, true },
>>> +        [XE_HW_ENGINE_VCS3] = { MSG_IDLE_VCS3, true },
>>> +        [XE_HW_ENGINE_VCS4] = { MSG_IDLE_VCS4, true },
>>> +        [XE_HW_ENGINE_VCS5] = { MSG_IDLE_VCS5, true },
>>> +        [XE_HW_ENGINE_VCS6] = { MSG_IDLE_VCS6, true },
>>> +        [XE_HW_ENGINE_VCS7] = { MSG_IDLE_VCS7, true },
>>> +        [XE_HW_ENGINE_VECS0] = { MSG_IDLE_VECS0, true },
>>> +        [XE_HW_ENGINE_VECS1] = { MSG_IDLE_VECS1, true },
>>> +        [XE_HW_ENGINE_VECS2] = { MSG_IDLE_VECS2, true },
>>> +        [XE_HW_ENGINE_VECS3] = { MSG_IDLE_VECS3, true },
>>> +        [XE_HW_ENGINE_CCS0] = { MSG_IDLE_CS, true },
>>> +        [XE_HW_ENGINE_CCS1] = { MSG_IDLE_CS, true },
>>> +        [XE_HW_ENGINE_CCS2] = { MSG_IDLE_CS, true },
>>> +        [XE_HW_ENGINE_CCS3] = { MSG_IDLE_CS, true },
>>> +        [XE_HW_ENGINE_GSCCS0] = { MSG_IDLE_GSCCS0, false },
>> aren't the media related idle message registers only valid for media 
>> GT and similarly those for render on render GT? Here we seem to be 
>> reading all registers on both GTs? So some values are invalid.
> for_each_hw_engine() only iterates engines present on that GT. So on 
> each GT we only read its own engines' idle registers.

ok, missed that part.

Thanks,

Vinay.

>>> +    };
>>>       struct xe_hw_engine *hwe;
>>>       enum xe_hw_engine_id id;
>>>   @@ -118,9 +152,27 @@ static int hw_engines(struct xe_gt *gt, 
>>> struct drm_printer *p)
>>>       if (!xe_force_wake_ref_has_domain(fw_ref.domains, 
>>> XE_FORCEWAKE_ALL))
>>>           return -ETIMEDOUT;
>>>   -    for_each_hw_engine(hwe, gt, id)
>>> +    for_each_hw_engine(hwe, gt, id) {
>>> +        struct xe_reg reg = msg_idle_reg[id].reg;
>>> +        u32 val;
>>> +
>>>           xe_hw_engine_print(hwe, p);
>>>   +        val = xe_mmio_read32(&gt->mmio, reg);
>>> +
>>> +        if (msg_idle_reg[id].has_fw)
>>> +            drm_printf(p, "\tpipe %s, C6 %s, fw_req 0x%02x\n",
>>> +                   val & MSG_IDLE_INDICATION ? "idle" : "busy",
>>> +                   val & MSG_IDLE_C6_ALLOWED ? "allowed" : "not 
>>> allowed",
>>> +                   REG_FIELD_GET(MSG_IDLE_FW_STATUS, val));
>>
>> should be FW_REQ here as well.
> Sure, I will modify this.
>
> Thanks,
> Anirban
>
>>
>> Thanks,
>>
>> Vinay.
>>
>>> +        else
>>> +            drm_printf(p, "\tpipe %s, C6 %s\n",
>>> +                   val & MSG_IDLE_INDICATION ? "idle" : "busy",
>>> +                   val & MSG_IDLE_C6_ALLOWED ? "allowed" : "not 
>>> allowed");
>>> +
>>> +        drm_puts(p, "\n");
>>> +    }
>>> +
>>>       return 0;
>>>   }
>>>   diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c 
>>> b/drivers/gpu/drm/xe/xe_guc_capture.c
>>> index 82df19b304e1..5a4d085660a2 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc_capture.c
>>> +++ b/drivers/gpu/drm/xe/xe_guc_capture.c
>>> @@ -1868,8 +1868,6 @@ void xe_engine_snapshot_print(struct 
>>> xe_hw_engine_snapshot *snapshot, struct drm
>>>           snapshot_print_by_list_order(snapshot, p, 
>>> GUC_STATE_CAPTURE_TYPE_ENGINE_CLASS,
>>>                            list);
>>>       }
>>> -
>>> -    drm_puts(p, "\n");
>>>   }
>>>     /**
