Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A943C55182
	for <intel-xe@archiver.kernel.org>; Mon,  3 Aug 2026 12:42:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF36810E5B4;
	Mon,  3 Aug 2026 12:42:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a11yO17A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8025610E5B4
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Aug 2026 12:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785760963; x=1817296963;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=goB6Cu+QapwmQef4I+X5wfEK9880bEtEjyTmvXinYkQ=;
 b=a11yO17AYmWX63e4l5mOGFoxXRXazO20Eww+eM3iOFamIPyX7pkGhFCE
 6Vfw1o8JbgNQRtWApcvw8qQqd7zOaOOgn8crMgMBhuLmMtVn8O2oYqMSM
 IbiIUdBF/BES2llAH6JYTxtivmHe8CW7TBokJ9O8/2rqKL9AijpwArDHG
 /ruJMpUHLAHjAGcNleoh73otqShOgNw7AVbGA6eLhv8qKEt3bO9aUKqUu
 eDQiQBFeV23DjuJG5swACasbpvlgZ5ZK6ik38qmtgj8e2OC84yILUccpR
 SuM03jU9Edbg9/LCJKc/dPbp4NLkiZknN9rkF0z7fcH5rJcH411xCdl8G Q==;
X-CSE-ConnectionGUID: KMlCOrXDQI2AYjKoxWS5Yg==
X-CSE-MsgGUID: 0GZtUiMIRNGLcxuIm2PPew==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="86376382"
X-IronPort-AV: E=Sophos;i="6.25,202,1779174000"; d="scan'208";a="86376382"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2026 05:42:42 -0700
X-CSE-ConnectionGUID: VUXbsVV8QwiEkbHOfbn52Q==
X-CSE-MsgGUID: YCrRe5KPTu+llP2NGcaHgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,202,1779174000"; d="scan'208";a="260629736"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2026 05:42:42 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 3 Aug 2026 05:42:41 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Mon, 3 Aug 2026 05:42:41 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.26)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 3 Aug 2026 05:42:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wM3VqqL/bgyOci/It/Gatu1QnAsputn7LvChQ0uR1Kkd2xDXjXYnrLVA/ezzspfmgz95FJ0JZZNN+rc4Gk61TxZjM3hTZw3RwA7ASjbooNvAhp33RdJvgz2thXS1knscwSR2jd7SM4qu/iYjdaNMgV4nFxc2jrMYy/anSb+hEQqrMjS/ebUwMdE6wy/jCBOTKtYDztIssxPM9O4447sDIGxDQ0CVVcwoHaWuWr5gfeZbLN8RfmXYZJPiw1kZ3CHH0UZ5VDIh8TMbvEywjrRGP8GcZ1LHz81sd2jbi5p55uMsr4YmgKz6CnBDGTU417wTM9FhmjnPCDOutX85pACbMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4uduJk9Vrz5xcCRWam1v9NRKyG1nP7BjQztDverVs/E=;
 b=xBfR2m26CVFZwRdhHp9krLT5mJ9sQ73xQLUuAxb4f3Hx9U9UNrczw9g4eVQSO/epsAUk6yQH/CZG77cP7iRdWArya9/SznTBaSzI8I+85+LH2wA/a6JN9xNQiSG6jtAWKW/VfffDPEkRPRsTP+k29fg3OQXPLvpYdCVvM87qyxKv1aINnPJVokIDUB0lJlpksArV4KkLUSBo7j+uznhEvKAXtL0qZ30aQwjChQeUmATAJ6EDHBEcGs6nh4GNePVfk61ENiDsVsaDHErrgF/s3fK2qU3r1bVyeL3L120TksV0j7s5L/i9ds0JZwIEcfuS0ThXxmSQVmx9+N81IH2c6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by PH8PR11MB6802.namprd11.prod.outlook.com (2603:10b6:510:1ca::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Mon, 3 Aug
 2026 12:42:37 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%5]) with mapi id 15.21.0270.016; Mon, 3 Aug 2026
 12:42:37 +0000
Message-ID: <6ae6eeca-651b-4c65-b8c9-773dbbd6ed43@intel.com>
Date: Mon, 3 Aug 2026 18:12:29 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/23] drm/xe/log: Add SIGID log helpers for components
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Aravind Iddamsetty
 <aravind.iddamsetty@intel.com>
References: <20260730152121.576-1-michal.wajdeczko@intel.com>
 <20260730152121.576-9-michal.wajdeczko@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20260730152121.576-9-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0339.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:21f::11) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|PH8PR11MB6802:EE_
X-MS-Office365-Filtering-Correlation-Id: df842a93-5d97-42c0-6d0b-08def15cb2c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|6133799003|3023799007|56012099006|4143699003|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: gDgNzAMYPZJKkVd05174yAFsEeba6aoyMyyGli/OvBKic6H58AIH00CDYRNRTiPAykjUn7D9LzMzTNL7M0kFY0DhJut2NcBFlPEyVlt3cKbKWTuGuF79D4Nkzfqy2mi5ejmNZNVrZBvKMCpCqpBH0JuzXDsH017SzYQaZpAJeJy7wf1mYHeQOBIphD4/BdfBOPuO+0l1LSNoPTGQaxzPunxV2jW6JAKRf3yw6y08D5Bzug9bnvDndHlSfSpQaOr7jU8F5C07mpOnt4FNl4V4W10wCpWa/YVHHAojyvjuJ05ORe4tjWUZRl8zxy4ruASaufYW+E46o2STpmxDFjC2k6k8xVV1AdK5OYuwkrZpNbqquNnl24vb7E2OJA4l8E4M4JAOnZSTDsOI9BIQU3oF7ZFcOvT2eK7b1mFbKHuSYW0KQjpcYHCvW4rH1xL9zUWzStqRTmwagBzzK+MV4bFYRqN4Dj7Zhjeu12vkO1fQrg3lZYM8sGTlKt4L6gyntlHlYD0NQ8fG3ulCpj4Tq4tLWaRGQA2DJ8qgmezvJRQSUW4tDBSYSOWlJSPmDDvdyes+nEqb8ZWEQGjJB+oU9QA0uf5AW32Rz3t0fHR81jOqxX4g1P1Z6y+h95ErmlCe9GAKJty/VpiZw7WzhC7Bg3nq3GV04fLcL0wPKP8ZHaNUKZE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(6133799003)(3023799007)(56012099006)(4143699003)(11063799006)(10067099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OEk1VXdrTTB2UW5RWFBXMXlHRDNxSGRHeGk3aUMvS3JoME8wOS90aEhXMlRU?=
 =?utf-8?B?NXAxNHFlMWdDMnlZN1BQRVFONVpsV1VmbVEvRlNoS3p2bFc4eHBVY25xSXds?=
 =?utf-8?B?UFVEdUpGWXduMExMdTFucklvNWdHYjdFell2RnQvL2E3QVQwRjlzcHVRZElZ?=
 =?utf-8?B?V2h5WUlzQ25jZDBWa3RCcjZWRWVDYUlFT3JNeWE1cExOcGcrK2Jqc2tZb2p0?=
 =?utf-8?B?Y1lLUUZ0T1lFUzhnUHAzWVgwdlFDRlh2U243TzhTUHVuUE5QQnZOVDJSaGQ3?=
 =?utf-8?B?dmYzdWZQdW5xSVowd0h0U05rblpPMHg1RWkrano2KzRmaVIvSjJCV0Z0a2RV?=
 =?utf-8?B?WjU0NGFONE1CVjNxMGZBbDNMQjIzdXJySkVzWkFQWVJMVG1wWUVoS3ZRVFQ5?=
 =?utf-8?B?emltUmt4aWpjZFZHY3FNSlozU2YwWDFRbTR0Zk1yMUtIaWtrd2k4ckZMZ0Zk?=
 =?utf-8?B?QkVHQVJSMGpKRWYxOWJQQUVoSi9YVGZHM2VWVy9uQVhKMXlGV01SYkRleGxF?=
 =?utf-8?B?eDQvU3kwNXJFU1pVclhtazEwYlljTGVzVmNYYmlZSnBvRFlNYWpLaUc5anlR?=
 =?utf-8?B?SzdPN3JFWXBnQXcxNFJ0TXN0OGhYTWJORUZ0dkdCT09pcDgxeFF3TVp5Ritv?=
 =?utf-8?B?RkNGbHA2MUR3Q1dlalJVNFFBZmdSZytVUi84ZTFIUEVVOFN6Y1NLSUFFSlhh?=
 =?utf-8?B?T3cva2hqcE9NMDBQWXl0VHNoUHU2ZGFoeUo0NnRqb3YyaGVDUWl6Z3M4SG9R?=
 =?utf-8?B?Tm1Nc1piaVFLYU5BU2dWZkc2bDBkZlkyKzFvNEsvVjdwOXNreWRyd3lWcWJT?=
 =?utf-8?B?SjVpcmtKOXNmTGtEank5ckhmc3RzMUZqSll3UGtnNkhkKytTbGpkYVpVZldW?=
 =?utf-8?B?TWVaS0Rwcktabm5RbW1zUmttL1RXWGVKcjJnUzJ5OXNIeDRQdGF5VElIRmtD?=
 =?utf-8?B?LzNrcVI4cW1LVUwyVFFzT2R6SXQ2K1Z4TnFBeHFBdWN0TGNpTjFXZzdYRWRH?=
 =?utf-8?B?UzREYW00NnJoWlFOSE5VQ20wS01Lb3NKMEQ5bmUzUHZ2SmNMdWhYOGhoQkhW?=
 =?utf-8?B?aUlqa2VxZ3RWV3UzRGx0UG5vVVRLMlNsb3JjRndzSERMNDZpL2pXUjRjaTVQ?=
 =?utf-8?B?eUM2aDJkby94M0VXR0lOQjVJUmwwemJIdElJS0R1NWR4YmJ3dWZNRndMZ2Fm?=
 =?utf-8?B?cVRDemNyQ1NXWjRpeVJ4UDR4OEdhTjNMUDJndjJjOFNzd29sWVQ3bS9Qbm9K?=
 =?utf-8?B?NXVkMDJRMTM1WUhadEd5dG40RmdhNXFqR08wazRBSDA5bUhWVlZqYzg2MXha?=
 =?utf-8?B?WVJpazh1VFBsaXovZUFZS3Y4K1JjeHVoV2krKzJ5VWdtOEFEZXZPUDg4K3Nl?=
 =?utf-8?B?K1ZDOUdacThWNFluWTc4MEFmd0ZOV1NvMGNsaThOdFUrdVl6YndaMFc0K3Qw?=
 =?utf-8?B?NE43UE5UWHUvS0FINDNlUUZHNWoxVzliWm90NHVwaEk0YVRESVpzQ3ZYTFpR?=
 =?utf-8?B?VDFreXhBeW9WcE42S1JxUjdnVzV3cGRCRFppSGs0UnlyeHhyelNJTVVnY0NI?=
 =?utf-8?B?TVMzZzN3NEpsYzIxOVhMY2x4SVRkdTNSU1NkR1ZIeXdPTC9nOWdPZnBIWDNX?=
 =?utf-8?B?Rkh4MGVnSHozeUV4TjZDQWZqMkoyNzJSRjhTclBpWjlMelRNKzRTblhxaDhy?=
 =?utf-8?B?NzlXcVZ0UDI1UUFmS3hhb29jcndYcjVXSVVPSXV0ZDJBTFBpVGQ2OW1Cbnky?=
 =?utf-8?B?YUd2cy9tOFQ0MHIwYVJNQldZZ2Rvc3ovV1JGS29IQ2hzV2ErVmVpNHY4WFdJ?=
 =?utf-8?B?cGJneUV4aCtaUEFsMnZSMGc3QzB3NjgvRGVRMTF0dXQ1V0VQa3FEMGg3b2Ur?=
 =?utf-8?B?M1V1eERyNlBJdEJaNk1KNVkwN0pTTGViWXVlVHJWeS96cUxjNmNnbGFYNXI2?=
 =?utf-8?B?OURlamE1eVNxZm15K3orMzZybFQ5ampmR2RWYnc1clJ4NHdvV0FLa24yVExC?=
 =?utf-8?B?TFE5dDRpcEtDRUp4OHJUL29FUnFBNTdXNGlVQ21HZnBvZ0Jhc0FISEtYb2FP?=
 =?utf-8?B?ejk4SmNsdzhMZXJFeTFqUGZ6NW51QnQzVkYvK2htdmhyNWplTmhhUEdNbFdC?=
 =?utf-8?B?Q2Z2VnRRajVrRUFvNkZtY2RmSzdWeE1XZXFLL3VMZzM3SzBkOFFRNUZoT0tj?=
 =?utf-8?B?R2FzUmVNR3psUFFiUkxuTVRUbzZJVmxEVGhvWFd1dnJ1VnZxcG40N3VDam5M?=
 =?utf-8?B?TUZQTEwyU3daQUoxNEV3djhNNzVlUExTZnpWUmxpV3pkSW1jSWlpY2RkODh3?=
 =?utf-8?B?R2dhSWFqNWpqSnk0T1BHWnFmcmFwSmZNbmtjclF6Q3NCNmgrUEVPZzJRU2dx?=
 =?utf-8?Q?YaCdGEPNp92RDUfU=3D?=
X-Exchange-RoutingPolicyChecked: qMwWkpjNx7H0DkmbIj3z6WFhNftkND2/J7gk8h9TlfT+vXF0q8cBiF4a4isMwaaadzeT6w4JrY349WynTimXMCdog1btKAHkUlxeLkxWn2cR3oA6KGKJxhwzZg2Yi1hls5d/LifX/sp0n7ovNhQ0E4LgF4+HfgghldMtdrl6yuzd8rSnZDZhoLZpsWjlLvmOvJdnbRdV+1EQ6YYLef5IlBsP+RD+1PiHqsRPyGe982dfNUKWIk+oMMjGx9mU41DiH/jqIWTSpO44ujqxxWPlxucI4T4ggfuZ8uUMspQd0tBylieVBKX4D5CS4BfbP4C3ysoBjnO0lAyjH/imRElmpw==
X-MS-Exchange-CrossTenant-Network-Message-Id: df842a93-5d97-42c0-6d0b-08def15cb2c1
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2026 12:42:37.3154 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J18KZeuzff1uCiiOSqQ0qf7yhWJpJHaEAAq+Sc0Xm6tODNlwuRjhXcKuKcxBmLROzgSuP/s8jVeUoWXhVeozIHnkUC4ra3yKXRruOyQ5CQ8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6802
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


On 30-07-2026 08:51 pm, Michal Wajdeczko wrote:
> Our component list already defines relation between the component
> name, identified by the TAG, and its numerical identifier and the
> assigned SIGID. We can also already prepare location identifier
> based on the pointer type used to emit the log entry. Add helper
> that will prepare SIGID, COMPONENT and LOCATION parameters for
> xe_log_emit() using provided components TAG and the pointer.
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
LGTM,
Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> ---
> v2: rebased/simplified (Michal)
> ---
>   drivers/gpu/drm/xe/xe_log.h | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_log.h b/drivers/gpu/drm/xe/xe_log.h
> index 916218560297..c30db02950b0 100644
> --- a/drivers/gpu/drm/xe/xe_log.h
> +++ b/drivers/gpu/drm/xe/xe_log.h
> @@ -85,4 +85,22 @@ void xe_log_emit(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
>   	xe_log_from((any), CPER_SEV_INFORMATIONAL, (sig), (comp), \
>   		    (data), (len), fmt, ##args)
>   
> +/**
> + * xe_log_comp() - Emit a structured SIGID log entry on the component behalf.
> + * @any: the &xe_device or &xe_tile or &xe_gt pointer this report relates to
> + * @cper_sev: CPER severity (CPER_SEV_FATAL, CPER_SEV_RECOVERABLE, ...)
> + * @TAG: the component tag to use
> + * @data: pointer to the additional details, or ERR_PTR, or NULL if not applicable
> + * @len: length of the @data in bytes, or 0 if not applicable
> + * @fmt: printf-style free text format string (not a stable interface)
> + * @args: arguments for the @fmt format string
> + *
> + * The SIGID will be determined from the component's @TAG.
> + * The component identifier will be determined from the component's @TAG.
> + * The location used to emit SIGID entry will be based on the @any pointer type.
> + */
> +#define xe_log_comp(any, cper_sev, TAG, data, len, fmt, args...) \
> +	xe_log_from((any), (cper_sev), (int)XE_LOG_COMPONENT_##TAG##_SIGID, \
> +		    XE_LOG_COMPONENT_##TAG, (data), (len), fmt, ##args)
> +
>   #endif
