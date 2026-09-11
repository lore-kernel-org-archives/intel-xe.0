Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38DD5C88E41
	for <intel-xe@archiver.kernel.org>; Fri, 11 Sep 2026 06:12:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EECA110E361;
	Fri, 11 Sep 2026 06:12:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FP0mBiwd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89D1F10E361
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Sep 2026 06:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789107126; x=1820643126;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=B+JEFssPuis4eTabHJKueRW7EYdwCVta8nxNW2EEl48=;
 b=FP0mBiwdj65XLF9VCpCPEwFqh/6vAjgzwVogHz0vo/Xe5w5zDgo1qNqM
 nBX754dPHGVcap70GN6F0v2TuV8IRWEslDz4BxRf7tkeCRBaUwP8l1286
 IuqoqA57CZJjSFfy1KQwE1AICCRxrQl7sQ6tUq1Vgo/HvK4unp8qzRpAV
 suy+uEbAivBGAHLgEgbOktus5PyD95XYLkkvBhrkmSG6BW/nsk+n3DXmp
 8O481ZvyNJAMtZpYN9U0FJBO2H7SyDUjhhJ00jr2zhctlqQtRMr4QZVRX
 HtU1FSJdc24gzoEh5pL4f12Sjve771hFnCtkNC4TkdV+Rnl/PwMDa6WPH g==;
X-CSE-ConnectionGUID: b3joX7fyS/+tPsEK/wdyOA==
X-CSE-MsgGUID: sbmRjtyOSnSvI8PcIhCNtg==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="93395165"
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; 
   d="scan'208";a="93395165"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 23:12:06 -0700
X-CSE-ConnectionGUID: ieXAeRWTQAuUEPQ0Vquokg==
X-CSE-MsgGUID: Pc4R5oSyTC61N045zgGl/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; d="scan'208";a="270462877"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 23:12:06 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 10 Sep 2026 23:12:05 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 10 Sep 2026 23:12:05 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.41) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 10 Sep 2026 23:12:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QQ7mWS+URPtBQGHosOa0GOjnUsqVFLOTOWu5mxTx/mUgpqSQxIRBznfViQh9DvRZoQlOkPjYpgVVyWgW7X89eLkdSFRY2YbHRms0IdXyojbsZWW1wR2ZxSGVv/KLrIeOFVW2/mowKDlALHNJJX9XHb5kD9wlS+2+IRcz0T42Dkh1uAs0fq2vNvY0ayezNZtv3iC9VLcbBStcoLrZimx0OKk6KFkE2ea0XfzTzV4eNqQxr5Qhz+BrNxdQH9Wf2cXRT1tC0rSr5XHcPsGt9O0cNTCs8/hlWJw9esX8gwzO9ywiYGOfjmRz0AZpIkHqsP1R11xCaOqKo/GVVPAcatfCOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wsaMoZ5NYkGI+nJLyFfojCnrHIzPxVm3CYOI+04JQRI=;
 b=j83xz4U3KTNp2Xxi58zXXS3Xg17cxEMg68arK94QJMqUNRFyyFYcrSE+7HcfGNZp9rqB9Rj4UEtYF1G3HCFu3ExbRNUjwepJVG0Sa4kbuvs4OLCTH93hbjBZhmrTII04MkNt+rKvsb8NULcij35Y94ICWXGD/PP4LrfMT5X8VymEhsU6gLTJkcc94qTakt7xXKBnGawUts1UzLpVmUIKCDujSaB5PZBAClfKiw5hpjKFVA3NqFK2PegJuaPAQ8XVYuhLOByhq+tlESKeTX4UvDmA5ll09F5uqZmNZ+I7KJh0pR2gzcn3Mh28DvRI0B0w7hNeICY3UojWpE7rq2Cu7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SJ5PPFED9C9AC99.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::85d)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Fri, 11 Sep
 2026 06:12:02 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0382.014; Fri, 11 Sep 2026
 06:12:01 +0000
Message-ID: <57ba2a0a-a4eb-4e97-9fea-003cd494c9f2@intel.com>
Date: Fri, 11 Sep 2026 11:41:52 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] drm/xe/xe_ras: Add support to query page offline
 queue and list
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <badal.nilawar@intel.com>,
 <raag.jadav@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <mallesh.koujalagi@intel.com>, <soham.purkait@intel.com>,
 <tejas.upadhyay@intel.com>
References: <20260907094706.1407436-8-riana.tauro@intel.com>
 <20260907094706.1407436-10-riana.tauro@intel.com>
 <8c546a9c-4c59-4345-b430-dba6eb6a2244@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <8c546a9c-4c59-4345-b430-dba6eb6a2244@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0054.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b8::17) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SJ5PPFED9C9AC99:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d7ffc8c-2ae4-4e4f-7c8a-08df0fcb97ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|56012099006|11063799006|18002099003|22082099003|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info: MbdyfLizzasFhw/Y+OrxmFGx/iwfU3eMkOeODVApLOUY8YOHQGInzKSrmtnVfgJLTo90SNRbnpiVWOmQo1Fi7nSM9PWkoze3vD/ltzSD3ZKtTfq514ReXbibE8uDbwUikB4dxTL7HiwLdQdaj8lABtMvpDQuL9YykzydJd7FJ9X3OZ6PY8Xcu++AXoUs1hfcszU3sGSxjocvtW1sf0k/YY1fXKwiqfTpITEb6qP90i7+IMNUuGvwo9U1AFmf27AJ9XU1hVcN8nrJfGmxy2gjcdqab3Vr4RN+2WDUAVdglNwqIF65EGkucqnKE+qqUZbyGECOgEFYpYPtlTWg8i15YlZDM17xTcQZy/raM/BcwB8P+bNLCPtTDZWpTHtnqm2ETLUqVTXROhFwtu7bt7LQzMds92BftXJAXZezZ0yTVuEx8NPLeyxGRMRmXUkzDs+h212hUqkf0c0ZyqOHTwLDig5I/T+NjlM6Qup/kkTKOTSDgpnf7K8z9LUFFiRmWjypGf7/wvcbSVtDC43c3sgatcSR7riZKarWQEjIBmSlrnlP5PQsTKmpddKA9L5Kl4MjaZmMrKkXEXTj6s/JYr6Qc6y0u2AyYvahnr9FapsXCrWLS7Mdtc5FNPA3eO8kb8vFdPWcPXkEyNFN7yrejet0ZN8LpPrUEu71NsjOPN+lxpQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(56012099006)(11063799006)(18002099003)(22082099003)(4143699003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dDJ2eWR3VWRTZmRIYWVmMWtNQTVaNXM2R1p4QitmVWlFMnE4ZGJYaFJ3Vmto?=
 =?utf-8?B?YnlqSjYvLzdYN3ZiRENQbTh0VitqRVhUWUhOYUN4MmQ4Y0c3aE1uRHN5dXAv?=
 =?utf-8?B?aVRGeTNCLzZFcDhMZnpyMVJmeHpDdXQ5RVVFcWJ2dGs2VS91T3ppLzl1ZWdV?=
 =?utf-8?B?Q2JCb1F5dUhqazJnbXl4bGxSbk9IU242RTBaMlE2S2JVaGNLZXFlRUxhLzhk?=
 =?utf-8?B?OHFnUk02OWpVeEtwN1pWdlpuRFRYNFp5cUNrYmFSZk4wWGIrRkdNSFFrNHlG?=
 =?utf-8?B?Zkc5bXArUVdXbEpsSkN1TVNocTJDN3kwbUJocDk1WVVoZmhDQVhYS0UxRDda?=
 =?utf-8?B?ME9KVWU4RW9Fd2VXY1dyUElTajFPTy9DM1RSSVo1MEdXNkExVFhHSnh0SUhu?=
 =?utf-8?B?OGFkVWlTeWpMc3pjN2FhTlkxMTFVZUlEYlMxaDFCb2EyYUwyTFZHVFd3Z1Jj?=
 =?utf-8?B?Y3RDbGxUUHd5bUtSQXJ6aGc0eHNEbG12QytHQlpYV1UraDFiRVUyUFRoaHJ6?=
 =?utf-8?B?VlM0N2FZdnk1Wmh3UisxekNwbjlMaGVpMmdIUks5RGV1VGlMMmNaVS9qK2gr?=
 =?utf-8?B?Z3hWNlJXVTYxOEc5b1NrbHAwNFVuZmttbkV6NVA5S2ZqSnFyUWNXNkRhM3VH?=
 =?utf-8?B?OTZNQ2VCRzNSYnR1Q1VuV25kNDg2SlhJbU5RSVNLNGtlWHpld2RtdTVSYUsr?=
 =?utf-8?B?RkZYZVVyRXdkK2JmOHJyUjZaWWtLaUwyQXczWVpXVmE1U0xobElmUVJEWDVF?=
 =?utf-8?B?YWwxbGJLVFp3TEtMQ2YwRzB4eFJoU1FBZVZBODk1Ti9EV0Z6NEJBOUQreDda?=
 =?utf-8?B?S2NzWFZ6UjM5TmZlRktKYjE1R213RUFJcGo5YitsN0EzbGxhaHROUmlXNmxx?=
 =?utf-8?B?UENKYTg5cE55OWc5MTNsMmEwNTZYRjNFWmxMK2g4YnZ0SExWM04rcElmMElG?=
 =?utf-8?B?UURHN0Z5NlRwNHN5NEtGUEVEajFMS2NyZVZ4Q0t5UWx5aHI4OStJUFF0Misv?=
 =?utf-8?B?QThpS2lGUkprKzVyTTVwaXpHQ29XWHJhbmtmQldZclhkZUVLZ054N3YvOUZF?=
 =?utf-8?B?TzUxS1AvUjhHdENvdlB6UzlGWVhELzMwNkN3MmRObmtzV1N1eWNmSElpK2hh?=
 =?utf-8?B?NlZOc3JDeFhkZGt5amx5ZEJCMGp2MGRYK2lYc3lmTGc1bnI4ZHdpVkdIanlw?=
 =?utf-8?B?YmI0eVFDaXoySk5EWkNSSmV6eXJWcG1lWExYWUZNeituMDIxd0xYUi9sSk5D?=
 =?utf-8?B?OSs4NTV3bThaYjlYMWF4b2NHa0w1a1NJbU84aVNtNnArOXNTZVppbnBXcXI2?=
 =?utf-8?B?SGQ3YkFMM2N2Vmg0ajk2dXI0bFF2MXVMR2MzOWpDTFkxZWVUNTRoRVFhc3pz?=
 =?utf-8?B?YlBHQzZPeVdQUVlSMW5ib1BnUUROWStyTUlZaVdCdk5zRjdXNU8xWUdHRnhN?=
 =?utf-8?B?NGVMUWZvWWNldi9oaXBxQWI4bEtLZGZCTDBZMjNicUdYQTVtUk5CTlc5ZGZU?=
 =?utf-8?B?TEY1aDFpTXNRbm44eUZwZjl6c2swNWVqMENka1BTdjhMUlZ4QXBBS3dJOUZK?=
 =?utf-8?B?ZlRlby9va0xwUGl4WjM3cEFTWlBDU1czMzRuNERDUXgxNmlDdUJTSUQrNHpn?=
 =?utf-8?B?K2RQNDk0dlN2SDdWQUh5ZEpoV3FkS0NxK3AyNmtXSGYvaXYzeWpVVE5qcjhy?=
 =?utf-8?B?bXdHNS9qY3ljY2d6QlhTWjJhYUg1b1JlWDV2cEJoaEVGOTcyTlYxR1p3czZO?=
 =?utf-8?B?K2V1YjYzT29XWTVvN1REUFZiWE54NUJjM3dDUWhacm4xNWt1dHlzTE5ROFo1?=
 =?utf-8?B?bGZWa1ZOR1M5UVN1Z3IzV0wzd1pOK1dVbzM4N08zVVN1MjRZc1I2REx2UDdD?=
 =?utf-8?B?L21SdWRqNU8ra1NETXVkZWZLTmR4OHNZOFREOUt3akd5RlVnMUhRTlIrTDJV?=
 =?utf-8?B?MmIzQ3YzZE1GTk1hUnF6L1VwWWhHZmlNTDZVM0Q1V3JhYnhPQUQ4RnlDOU95?=
 =?utf-8?B?ZkRSdGNnSTBneUw5dDJWNnAzN2xxQ3ZqWmVtK01paE1IK1Rmd2loTnR4YWVv?=
 =?utf-8?B?OTFvQ1pNREp3SnRXN0FUbncxN1dDVEhyZkV3bk9neDQ0eUwwWkNYOHM0bzZv?=
 =?utf-8?B?MkJXMDlURU9wc2JHNUJrSEMxMUFxZTk0OTlBWVFQV0xaTnlhUFBmVWZlZEda?=
 =?utf-8?B?Q3hYQlR4R25OU24yWDhVTmNXNVdkemRiSHB4WHpHRFhVd1hOS0xEY3RLb3dR?=
 =?utf-8?B?bFRScVNkYU53cVgyRm9DQ29BNDBwSVVGT2FwL2N4SmpSbG9hdGd6blZMcFkr?=
 =?utf-8?B?ZFRLYVZjVWZrN01VMDQwZXhkVFBNY3NzSHE0QjNmeHNEWVNoNEtCZz09?=
X-Exchange-RoutingPolicyChecked: fKK/l5C/Sb8HFBa+MO85kLXSe+qPCsewjWCubiCcDDp52h/B2t+yscFqRVZfjOl1xF7NDMYEt0mEFObY8Q4XEa9i9RCb9570s+0FT3lISt6b18sue5LU8gIZEZ846CrjvfDnoHNb8HcXWMY44NWmOPOAed9Uu1g/rHMuFTDHtNNAq+Oojxm15KCvJ2679hstsCwXQn6sMjtXcv09EmqH+llE6KA0U2e8m80TgSIXAbOgH/RsbKd0dwdS81H9azMczeDk1oMTwzoTqcmhob7lz2scjIP+vj/hJrZQwcZxMa27VVmDQu9nsSS4pW3Tf46e+ito5SeCrhcq4DMNPhbiaQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d7ffc8c-2ae4-4e4f-7c8a-08df0fcb97ef
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 06:12:01.3914 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qdEq+LBs9ku3iqULHyB+lorbAB+5hyNBsggSFefouCsENfKH9wTwMFf5xXuY8aZBsTcm8KPWlUzPVZFwoUYTNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFED9C9AC99
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


On 07-09-2026 23:55, Ghimiray, Himal Prasad wrote:
>
>
> On 07-09-2026 15:17, Riana Tauro wrote:
>> Add support to query page offline list and queue from firmware
>> during module load. The page offline list command retrieves pages that
>> are already offlined by the firmware. The page offline queue command
>> retrieves the pages pending to be offlined by the firmware.
>>
>> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>> v2: rebase
>>      store total pages once per response (Sashiko)
>> ---
>>   drivers/gpu/drm/xe/xe_ras.c                   | 105 ++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_ras_types.h             |  43 +++++++
>>   drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |   4 +
>>   3 files changed, 152 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
>> index 94ffd0852938..648e46df831d 100644
>> --- a/drivers/gpu/drm/xe/xe_ras.c
>> +++ b/drivers/gpu/drm/xe/xe_ras.c
>> @@ -326,6 +326,108 @@ static bool ras_counter_is_valid(struct 
>> xe_device *xe, struct xe_ras_error_class
>>       return true;
>>   }
>>   +static void get_queued_pages(struct xe_device *xe)
>> +{
>> +    struct xe_sysctrl_mailbox_command command = {0};
>> +    struct xe_ras_page_offline_queue response = {0};
>> +    u32 count = 0, total_pages = 0;
>> +    size_t rlen;
>> +    int ret, i;
>> +
>> +    /* Supported only on platforms with system controller */
>> +    if (!xe->info.has_sysctrl)
>> +        return;
>
> move to caller, single check helps for both get_queued_pages and 
> get_offlined_list.

This is already part of caller.  Added here in case there is a re-use.

>
>> +
>> +    xe_sysctrl_create_command(&command, XE_SYSCTRL_GROUP_GFSP,
>> +                  XE_SYSCTRL_CMD_GET_OFFLINE_QUEUE, NULL, 0, &response,
>> +                  sizeof(response));
>> +
>> +    do {
>> +        memset(&response, 0, sizeof(response));
>> +
>> +        ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
>> +        if (ret) {
>> +            xe_log_err(xe, SYSCTRL, ret, "failed to get page offline 
>> queue\n");
>> +            return;
>> +        }
>> +        if (rlen != sizeof(response)) {
>> +            xe_log_err(xe, SYSCTRL, -EINVAL,
>> +                   "unexpected page offline queue response length 
>> %zu (expected %zu)\n",
>> +                   rlen, sizeof(response));
>> +            return;
>> +        }
>> +
>
> How about helper function for below part avoids code duplication ?

I did try it before sending this. But due to difference in 
request/response structures it is not very clean.
And there is max_entries cached in the next patch in offline list.

Thanks
Riana

>
>
>> +        for (i = 0; i < response.pages_returned && i < 
>> XE_RAS_NUM_PAGES; i++)
>> +            handle_page_offline(xe, response.page_addresses[i], true);
>> +
>> +        count += response.pages_returned;
>> +        if (!response.pages_returned)
>> +            break;
>> +
>> +        if (!total_pages)
>> +            total_pages = response.total_pages;
>> +
>> +        if (count > total_pages) {
>> +            xe_log_err(xe, SYSCTRL, -EINVAL,
>> +                   "Pages returned from queue exceed total pages %u, 
>> returned %u\n",
>> +                   total_pages, count);
>> +            return;
>> +        }
>> +    } while (response.additional_data);
>> +}
>> +
>> +static void get_offlined_list(struct xe_device *xe)
>> +{
>> +    struct xe_sysctrl_mailbox_command command = {0};
>> +    struct xe_ras_offline_list_response response = {0};
>> +    struct xe_ras_offline_list_request request = {0};
>> +    u32 count = 0, total_pages = 0;
>> +    size_t rlen;
>> +    int ret, i;
>> +
>> +    /* Supported only on platforms with system controller */
>> +    if (!xe->info.has_sysctrl)
>> +        return;
>> +
>> +    xe_sysctrl_create_command(&command, XE_SYSCTRL_GROUP_GFSP, 
>> XE_SYSCTRL_CMD_GET_OFFLINE_LIST,
>> +                  &request, sizeof(request), &response, 
>> sizeof(response));
>> +
>> +    do {
>> +        memset(&response, 0, sizeof(response));
>> +        request.index = count;
>> +
>> +        ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
>> +        if (ret) {
>> +            xe_log_err(xe, SYSCTRL, ret, "failed to get page offline 
>> list\n");
>> +            return;
>> +        }
>> +
>> +        if (rlen != sizeof(response)) {
>> +            xe_log_err(xe, SYSCTRL, -EINVAL,
>> +                   "unexpected page offline list response length %zu 
>> (expected %zu)\n",
>> +                   rlen, sizeof(response));
>> +            return;
>> +        }
>> +
>> +        for (i = 0; i < response.pages_returned && i < 
>> XE_RAS_NUM_PAGES; i++)
>> +            handle_page_offline(xe, response.page_addresses[i], false);
>> +
>> +        count += response.pages_returned;
>> +        if (!response.pages_returned)
>> +            break;
>> +
>> +        if (!total_pages)
>> +            total_pages = response.total_pages;
>> +
>> +        if (count > total_pages) {
>> +            xe_log_err(xe, SYSCTRL, -EINVAL,
>> +                   "Pages returned from list exceed total pages %u, 
>> returned %u\n",
>> +                   total_pages, count);
>> +            return;
>> +        }
>> +    } while (response.additional_data);
>> +}
>> +
>>   static struct pci_dev *find_usp_dev(struct pci_dev *pdev)
>>   {
>>       struct pci_dev *vsp;
>> @@ -1040,6 +1142,9 @@ void xe_ras_init(struct xe_device *xe)
>>       if (IS_ENABLED(CONFIG_PCIEAER))
>>           ras_usp_aer_init(xe);
>>   +    get_queued_pages(xe);
>> +    get_offlined_list(xe);
>> +
>>       ret = devm_device_add_group(xe->drm.dev, &gpu_health_group);
>>       if (ret)
>>           xe_err(xe, "Failed to create GPU health sysfs, err=%d\n", 
>> ret);
>> diff --git a/drivers/gpu/drm/xe/xe_ras_types.h 
>> b/drivers/gpu/drm/xe/xe_ras_types.h
>> index 20c74593ce05..7bfd86c9d135 100644
>> --- a/drivers/gpu/drm/xe/xe_ras_types.h
>> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
>> @@ -10,6 +10,7 @@
>>     #define XE_RAS_NUM_COUNTERS            16
>>   #define XE_RAS_NUM_ERROR_ARR            3
>> +#define XE_RAS_NUM_PAGES            25
>>   /* Error bits in IEH global error status register */
>>   #define XE_RAS_SOC_IEH_PUNIT            BIT(1)
>>   /* Device memory error categories */
>> @@ -330,6 +331,48 @@ struct xe_ras_page_offline_response {
>>       u32 reserved;
>>   } __packed;
>>   +/**
>> + * struct xe_ras_offline_list_request - Request for get offline list 
>> command
>> + */
>> +struct xe_ras_offline_list_request {
>> +    /** @index: Zero-based index into the offline page list */
>> +    u32 index;
>> +} __packed;
>> +
>> +/**
>> + * struct xe_ras_offline_list_response - Response from get offline 
>> list command
>> + */
>> +struct xe_ras_offline_list_response {
>> +    /** @max_entries: Total no of pages that can be stored in flash */
>> +    u32 max_entries;
>> +    /** @total_pages: Total number of permanently offlined pages */
>> +    u32 total_pages;
>> +    /** @pages_returned: Number of pages returned in this response */
>> +    u32 pages_returned;
>> +    /** @page_addresses: Array of permanently offlined page 
>> addresses (4KB aligned) */
>> +    u64 page_addresses[XE_RAS_NUM_PAGES];
>> +    /** @additional_data: Indicates if more data is available */
>> +    u8 additional_data;
>> +    /** @reserved: Reserved for future use */
>> +    u8 reserved[3];
>> +} __packed;
>> +
>> +/**
>> + * struct xe_ras_page_offline_queue - Response from get offline 
>> queue command
>> + */
>> +struct xe_ras_page_offline_queue {
>> +    /** @total_pages: Total number of queued pages */
>> +    u32 total_pages;
>> +    /** @pages_returned: Number of pages returned in this response */
>> +    u32 pages_returned;
>> +    /** @page_addresses: Array of page addresses (4KB aligned) */
>> +    u64 page_addresses[XE_RAS_NUM_PAGES];
>> +    /** @additional_data: Indicates if more data is available */
>> +    u8 additional_data;
>> +    /** @reserved: Reserved for future use */
>> +    u8 reserved[3];
>> +} __packed;
>> +
>>   /**
>>    * struct xe_ras_get_health_request - Request structure for 
>> obtaining gpu health
>>    */
>> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h 
>> b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>> index 590dd408399c..a96aeb11d061 100644
>> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>> @@ -29,6 +29,8 @@ enum xe_sysctrl_group {
>>    * @XE_SYSCTRL_CMD_SET_THRESHOLD: Set error threshold
>>    * @XE_SYSCTRL_CMD_GET_PENDING_EVENT: Retrieve pending event
>>    * @XE_SYSCTRL_CMD_PAGE_OFFLINE: Instruct firmware to 
>> offline/decline a page
>> + * @XE_SYSCTRL_CMD_GET_OFFLINE_LIST: Retrieve list of all offlined 
>> pages from flash
>> + * @XE_SYSCTRL_CMD_GET_OFFLINE_QUEUE: Retrieve list of offlined 
>> queued pages from firmware
>>    * @XE_SYSCTRL_CMD_GET_HEALTH: Retrieve gpu health
>>    * @XE_SYSCTRL_CMD_SET_HEALTH: Set gpu health
>>    */
>> @@ -40,6 +42,8 @@ enum xe_sysctrl_gfsp_cmd {
>>       XE_SYSCTRL_CMD_SET_THRESHOLD        = 0x06,
>>       XE_SYSCTRL_CMD_GET_PENDING_EVENT    = 0x07,
>>       XE_SYSCTRL_CMD_PAGE_OFFLINE             = 0x08,
>> +    XE_SYSCTRL_CMD_GET_OFFLINE_LIST        = 0x09,
>> +    XE_SYSCTRL_CMD_GET_OFFLINE_QUEUE    = 0x0A,
>>       XE_SYSCTRL_CMD_GET_HEALTH        = 0x0B,
>>       XE_SYSCTRL_CMD_SET_HEALTH        = 0x0C,
>>   };
>
