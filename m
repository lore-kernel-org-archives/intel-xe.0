Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EF09CCD184
	for <intel-xe@archiver.kernel.org>; Thu,  9 Oct 2025 14:39:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5D7D10EA76;
	Thu,  9 Oct 2025 14:39:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YNZHEPeo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC21B10EA76
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Oct 2025 14:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760020747; x=1791556747;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=AgVxZYkYK7hOLt6+MT27cYSy2HdWUUE96XCdcS2l5F4=;
 b=YNZHEPeoph9yGpgeeYqlY3VocilAVGXyCrBHfq75M7ZFbej7oaEgz1FV
 GWFuRW3dsjzkGmFGFFa9gAS3t+3zOlD4GVQDS6bqeR/EsEm9WqdI5IeoY
 Rjm9DCw1w6Yqsgx8qQp2KoZ0l3/AJww2rUBTdpG2U6RYyaEM9seUrq/B3
 luFEh5VJ2FU3Yvg75m4NMMbx7w/w3hlGKiWv9312nxgKiOpZELPLFiGfN
 NcruX5BfbHd2XeebEgQRtwN9tFbqmiQXaUQ1eUMblzl9PF42VrOPtuQuS
 etTyF1KyLCmr6WRaeJpPi1p+BnwiLLeAvRCSacMIm6471QnNCOu8Nntr8 w==;
X-CSE-ConnectionGUID: 2twYJurxRTmNn2XJOMOwEw==
X-CSE-MsgGUID: 2dT1b9uYQFiSN4aCHSGEfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="62392834"
X-IronPort-AV: E=Sophos;i="6.19,216,1754982000"; d="scan'208";a="62392834"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 07:39:07 -0700
X-CSE-ConnectionGUID: ZIpDvwfVR7Wt7MO/a7kxrg==
X-CSE-MsgGUID: pjL/XRH4SKikCQNpu4+stg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,216,1754982000"; d="scan'208";a="184757571"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 07:39:07 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 9 Oct 2025 07:39:05 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 9 Oct 2025 07:39:05 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.39) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 9 Oct 2025 07:39:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GNEp7Cu12WilyWBqpp/WwUNXmvF5AfpPN6oL6oOFMmP1C2S4+8pvT+O0ILQ35ei6cSW7jd8aZo6KMYTUHMozRQjvIB8JR8zf6b5JDMJPLUNGaz7s/kmgk2WIo69YqhCx/lgrUla/F6H32doj2tDrEPYkyTlAGS/OIm0DuMEBkLU8C0kxVv5HxtTlwomBhG3C8j3bc3IxxbSAUX0v7KfRvFqCUle+BWz/e42Knd2GksZxUPt6fmpgVInJPG9KGyLuMJc3/4/Qon1GkNExisZcgAWKlDsJ9sXsJLz8yIeWs/jVTBv5wMjcs/hvYGQOsVZARcU1ihceT2mdrEt9idbuxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lcBNXSly/ydoLu52JYLlTs+2CtzsmybIu+npwHiEyzo=;
 b=E4PsVZjICAgzc9p8+gf//9bTnyDly8mLFtezSj5fcvKbrT5W1or1Rf0O7jq+IoZb880x7utg5qENh6FNd8rm+RD0uXVCcv2/8tawc51+pl5GygaVqH0T3ANuNNNJjicxX7xhoobDHq5mPcWiXSZBnbUZBRV2Ky57DkiTAoRdD7XJlXRAVT9r31vG+WONFFU/HpVfMN1a3aacghPKpY7l2SP5/ZXAkKE1b2LfHT5PQIIkBuZm9Rw7qcVpi95clsCJ4OrNMUpiPSvZb6vew2cTbuboryAHABqZ5PMHySE1JyQhM4s6ydzTK1brhGI8YXxxfTFgg6tJ8spL124upyu2Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by SA1PR11MB7111.namprd11.prod.outlook.com (2603:10b6:806:2b5::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Thu, 9 Oct
 2025 14:38:59 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%4]) with mapi id 15.20.9203.007; Thu, 9 Oct 2025
 14:38:58 +0000
Message-ID: <e7972531-e105-41ed-90f7-5be793599631@intel.com>
Date: Thu, 9 Oct 2025 10:38:55 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] drm/xe/guc: Update GuC log buffer type value
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>, Daniele Ceraolo Spurio
 <daniele.ceraolospurio@intel.com>
References: <20251002150302.99524-1-zhanjun.dong@intel.com>
 <20251002150302.99524-3-zhanjun.dong@intel.com>
 <df58cadf-80d2-4c6b-92d9-beeb8630fc5a@intel.com>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <df58cadf-80d2-4c6b-92d9-beeb8630fc5a@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW2PR16CA0002.namprd16.prod.outlook.com (2603:10b6:907::15)
 To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|SA1PR11MB7111:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e25c1ba-5877-4657-3245-08de074194c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TDJDclB4T2wxYWg2d2VWWmsvQTJ6YUp6ajF4Z1o1OEVxNWVXcFFYTTRvdG1t?=
 =?utf-8?B?MFlrWlYrSnBjdWpNaUNsNzBWVDd1c0htRDArVnJVQmpzOVQrRWNsdnFZK3Vm?=
 =?utf-8?B?WGhNa2d1cXd2Y0o4Z0srWVNoZEZ0NG1qRDJyaWI1bkZ5STZuT0FmSTdveVhU?=
 =?utf-8?B?dWkycThTdFlMcVk0dzRLVVVGU2dJajZkdkk3bktrbm0rZHlPbUR2enFRN1JN?=
 =?utf-8?B?ZkZqWEptbVgzV1hzUFRpOWxGcXl1RVpQS2pFWkQxMUhUSHFRMVREbUppVWNo?=
 =?utf-8?B?T2pGVkUvNWZodGNUSVdVS0xUSmFIaXpMNWtya1hOemJ4ankzRUJHckxLUXAy?=
 =?utf-8?B?M1hnOWlJbDMreVVmcUV2dSt1YlFKYXQ3aGRxdnJjZDFFQ2xIamVIbFFXZmFL?=
 =?utf-8?B?ejdOQkRwdUdSNmF0S3hTMGgvVFRYb2NSb3FFcWlreTdKRVpnWlNKUmVoaDNh?=
 =?utf-8?B?dFg0ekQ1Q0xadjcxdVJDNjhOOU4zdFlaUnpCbEdSSTUwNGpNbHRBQ3lTZTM4?=
 =?utf-8?B?bXcxR3daUkhqNFNVVXRJWTBLZXYwN0FINkc0dGVOaWt3c29hWnlXWWhicm0z?=
 =?utf-8?B?aEpEdXd3UTFFYWhJWlRrRHBVbnZOOEgxblFydjBmditCMTluU3E2NDM1VVZr?=
 =?utf-8?B?WSt1KzBYOUJsVTd4Zm9KRk9NSldaY0REVG5kZ3piTHU1RzFMSG9neDFrblcx?=
 =?utf-8?B?TDJlWmJueS8wcUFmMDc2aFp0NXlpaTdRNlJHdk5LV0JsZkJzcVJkK3hwdlRB?=
 =?utf-8?B?Wk9zZk4zcXZmRDl2MXdCdnJzdE9XUC9LYjlaRTcyN3V4MGY3V291TER5aTNt?=
 =?utf-8?B?SWg5ekxKVS9MTWR6bC95OCs0cUMwdW9TdWtlTTZzV2FVZDhmUTZlUW9DWEto?=
 =?utf-8?B?TVB6S1Mwc1p6dlozdUd0NnVpTU9jT25yNElXYWVydnY5bkNveHIvUHdtQkd5?=
 =?utf-8?B?QkcxNTBZVVBEQ0pNUUo0bDdmTDJtQlZLK1hwT1JVMi9VM0xQSVlEaVpKRjVV?=
 =?utf-8?B?a21hLyt5TmVMUVNSMGdhdUd6bG9QMlZvdUdwb0RScnFCZTJKRk5KYSt5UGs3?=
 =?utf-8?B?SCsyUTFLMXMyWjBjVlVCcDRiUmhBenUzY0M3endHS05ZY2J6NlU3QmtMczBQ?=
 =?utf-8?B?eVBjVXNsdjRNVTZ1U3JlNEdiTDJVd21rWVo1SW11WGhGSTZ4b2Rwa0VpVzFK?=
 =?utf-8?B?TkREVklvZkJZVWwrZXVGYXdXWVhTNnIzR3F0d0xRb3VTcnlKcjA4VXJ3dVRK?=
 =?utf-8?B?RWhSN1dLcnZlK3l0YjIya2VyenorMFRmcVduME4wNzE0QjA2Y01qMTlNeDM4?=
 =?utf-8?B?bHZSSW1wWnQ1WmRJQmliS0hIdjV4YTU1RDcvNmZEclZXcWVDbFA4bTJHV0FI?=
 =?utf-8?B?TXhMVzBROE1NemZrY25KMXZHc29rY0FQejc3QW92RmF0KzhuS0w2U3NwbWJ2?=
 =?utf-8?B?QTZhdmttYlQ5Zm1yYjZhYjFyY2RxbXB1QWhMd1VYMUdYeVAxWk1rWUJPdHNE?=
 =?utf-8?B?Q0J3UTU0aENrckdFaVMreEd0SXg0cENJVkdMd2RwUXhhQmh5ZGtaS0RBaXhh?=
 =?utf-8?B?byticitjN1U2T2ZGeDZJaTBsb2xVckxSY0dRRTUzNWZqNVZJVENRdG5nVUdG?=
 =?utf-8?B?R2ZGcDJxR1RWbzd0MnhCWVRsaml1T1VzaHRPckhRbG5SQTFyd2ZaNlVON09w?=
 =?utf-8?B?RDlJMzVKcy8xK0k4SnU2T21jK1ptOFFwc3hEZS9rdmJKeDJ3UVUzdFZDL3Ev?=
 =?utf-8?B?MXg3T05oNUZUelZqWlkvRk55ZFlwVDZDa3BJL1lwVHcwS0VzVk5MaUFlSG1u?=
 =?utf-8?B?TzNpYW5LNE9yam8yc3oyc0FTYzRjcDlURW5LdGR6ZTJycFRKK1FOOVMvenBn?=
 =?utf-8?B?VG1BMFNwSGFNYzlQOGNFbk52SEdJNTdCMjJMeS9QT2YyazBTOTV4K0xoMEFW?=
 =?utf-8?Q?odYQVchHrxbU+aaB55RQ5J7v+QEwwXPj?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QW5SRkxzVHBFQjRDZldicjZWeFkxcENReXFaa213VlM2V29lbm9qaTlINkJv?=
 =?utf-8?B?OUNESWdJNGlIYm1Qa2pRNUNLV0o3bHFYZUtQUG1qY0tuZGFwaXpMVEpZWHNp?=
 =?utf-8?B?eVB2bXJEMCtUSGNuaTFpSFlrUXRPUnl1NGNaTnRmRUZuTTVSZ0IwRVE1TzB4?=
 =?utf-8?B?STVHM2Fua0hrRjBzVHZxTE85c3ZEZmExQkpjTTdIODBoODlIN3h1NHhPajJS?=
 =?utf-8?B?cFBYSTdpOEhJbVorT0oxZTdrUW4reHNNWjF1L0gyUEx4NU5VQ1N2eFljUmxr?=
 =?utf-8?B?VWtZY0tEcWFGL3ErdzFrUXhkaGFCelY5QThCd09KS1VscHRwZlpRZC9tSDM4?=
 =?utf-8?B?S2JzRjZ3a0ZjRTYzUHBkSjNjeDBqZDJLOE13RXY5b2lsbkJDdDVOK1YxZno5?=
 =?utf-8?B?VHVaNG1YYm1ab0RNUTkzWEZCVWtZclhhdm9SVHRHT1YvY3RTNnRRemtNbFYy?=
 =?utf-8?B?bVQ1L0NZMHlUQ0E3SExyL2dYSGtFTUNzakl1aFU4cS9uaExXRFVieUk2aDN5?=
 =?utf-8?B?VEJxc21UWmxkQnpZUmhrYzdRaENhSEJjWmp1MWxQdXUwMGFRV3JPeEZVa0pw?=
 =?utf-8?B?V04wUHJpU1hCMUhISDd5WkY2REdwZHdSZlVsZjRSR3JPOFlRZW80b0tBWlRX?=
 =?utf-8?B?ckRzUCtvS054dkVOSkFzZWFyY0VGcVdnUFpuRU1iTFJCTU9kTkpXb3JOdWFH?=
 =?utf-8?B?MnFIem04dmFBRjB3bW1FMlNXVllCbDNMSzMrMG1hemVSeVU1RjVnNTNsWVNF?=
 =?utf-8?B?OU4rS3JwN1ZNd3BXOHNjK21jay9jRXBTUjJXSm9vbjl1dzM1VitjdS9EUmR3?=
 =?utf-8?B?L2tMZWZ5aHBwZnNoeE03YkY2RGtRUzBXbUh1dVlnSmFqYzNjcmkyZDd3MjJ0?=
 =?utf-8?B?ek9OejRBRGxQQ3ZQZ29PQ3lOVVYvYlRkSUtGNlVaeVlwNktyVHUyUUYzZzdk?=
 =?utf-8?B?MkpZQmxqNm5XUFhFWVBnZzhZQnA2cFZUaEo3SWFodGhkKzFZNk5LM3JJRjd2?=
 =?utf-8?B?RFpYRklRbUVxZFdHZHdmSmN2YWJUTUcxMnZ5bktlMzFLVlM0RHh1OWIzV21u?=
 =?utf-8?B?QWIwUGRsaG5GZlVUMUJyOTZTenJ5TGtOVXNKRG1PaVNPZU9BWEJlNmRyZ3Zh?=
 =?utf-8?B?ckdWa2VmeTU2Q2U3T0hVKy8zK2JyYVpmUTk5aGxxRW9PT3FGeC83YjhtMlZ1?=
 =?utf-8?B?bzdneE9uSS9uK0I5Nld3Zjg3TWF3UnJ0LzhyeFBzNWV0WnVxdXhhWEE2TnQr?=
 =?utf-8?B?MW5uM08vLzJXbUR2SUh3SmJNditVU09nNjMxVmdwOXhYZExiNEdZbXd1Yzg5?=
 =?utf-8?B?MHV6S0N5UWdZUXlPZnNnajNqbWhrYmltTG9wU3ZlTzJZbitUU0hPV2hWMzN5?=
 =?utf-8?B?bWlSMmRRTnNuR01MTHppWkw4ZGJySkR1c1VLdHNraWJpSTFwSWZlQ0FYcDk5?=
 =?utf-8?B?OUYwM2YwZ01oT2JWWXgxMkxkNTUyZm15dmVnL0ZxM1dVcDNNVFozU3haUlh5?=
 =?utf-8?B?ZGp1VVJjRDRwM1kyL3FZM2k4NE94ZUkvZFlWOFJSU2VEOHFjWGppb051cnVK?=
 =?utf-8?B?c2Fna3EwMS9ia2s2eUU3dHVXNHUwYlE1ZTNqTlZzQkc2OVB2TXUvWXc1aVAz?=
 =?utf-8?B?ODFxdWZoTkg5WVhPTkR1dENyd2NSZXd6UTN1TkN0dDd1R3BOaUpydEFGcFZT?=
 =?utf-8?B?Mk1DMm9SeWlCS1p0MitZaVRDci9mNUpPazdReEgxTFJBRDhDQW1YTG0zUlNL?=
 =?utf-8?B?R0Z4NHJNTFZ6dkt0ZjVwamd5TEtFZTcyd1Z3UmVZT3ExajduTTh4RzZUZnNO?=
 =?utf-8?B?UzdrbFlTQmk0TkZFNjBvaEd4Wi9JWWtpV0lQVlVRTEVBSU0yWFdBR28wNFJz?=
 =?utf-8?B?VEZYaUN4cnNzRzhhVTJGbzNRZmdYclRVYXAwVXVmLzR5NGViWDNNNHJVY1k2?=
 =?utf-8?B?WUxwM212YTB2dWtXK1NtNGpscWhYQUN6a2I2Qk1VeUx1clhTU0JUSWNyRVBX?=
 =?utf-8?B?YWpOOEphRExUcEJwdlNIQ1NWa3ZMRnMxVisyemhySExHU1BIYkxObTdzTkxN?=
 =?utf-8?B?YkFPVjhGN3doT1RrU2s2VEdlMTZlcndJdnBzQmJkT1ozaXRNQjZ2TURDdlpE?=
 =?utf-8?B?cThHcHNvOS93NG1kRG12T1pxNjlYdTFpOFVJSFBRVGFxbU1DRWpTejkwbjky?=
 =?utf-8?B?M2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e25c1ba-5877-4657-3245-08de074194c7
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2025 14:38:58.5463 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aFiDZbFcqoVb2/Rng/YYLc9kif95Y0x31USUCvRcQ1qfSUzvKrGkUTuVUikhrU85Yx06yeI73jNxJR2LZcdZzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7111
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



On 2025-10-04 12:42 p.m., Michal Wajdeczko wrote:
> 
> 
> On 10/2/2025 5:03 PM, Zhanjun Dong wrote:
>> Update GuC log buffer type value, to align with the GuC specification.
>> Rename GUC_LOG_BUFFER_DEBUG to GUC_LOG_BUFFER_EVENT_LOG.
> 
> hmm, my copy of GuC specification has:
> 
> 	GENERAL = 0	/* Log event data */
> 	CRASH = 1	/* Raw crash data */
> 	ERROR_STATE_CAPTURE = 2	/* Error State Capture data */
> 
> so if the goal is to align (more) with the spec, maybe it should be (to keep them reasonable short):
> 
> 	GENERAL_LOG

1st, the issue is the "GENERAL" here give us no information about what 
it is,
GENERAL_LOG almost equal to _LOG.
2nd, here is within the enum define about log buffer type, so _LOG here 
also didn't tell us anything.

As you mentioned:
   GENERAL = 0	/* Log event data */
that's why I would like to use the name from comment

EVENT_LOG
This name tell us something and also aligned with spec.
or maybe
EVENT
as _LOG means nothing here
BTW, the previous name _DEBUG not aligns with spec, too generic and not 
provide much info.

> 	CRASH_DUMP
> 	ERROR_CAPTURE
That's fine

Regards,
Zhanjun Dong

> 
> + @Daniele
> 
> and btw, IMO this patch should be before the other one that cleanups macros
> 
>>
>> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
>> ---
>>   drivers/gpu/drm/xe/abi/guc_log_abi.h | 2 +-
>>   drivers/gpu/drm/xe/xe_guc_log.c      | 2 +-
>>   2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/abi/guc_log_abi.h b/drivers/gpu/drm/xe/abi/guc_log_abi.h
>> index 554630b7ccd9..1a487164b980 100644
>> --- a/drivers/gpu/drm/xe/abi/guc_log_abi.h
>> +++ b/drivers/gpu/drm/xe/abi/guc_log_abi.h
>> @@ -10,8 +10,8 @@
>>   
>>   /* GuC logging buffer types */
>>   enum guc_log_buffer_type {
>> +	GUC_LOG_BUFFER_EVENT_LOG,
>>   	GUC_LOG_BUFFER_CRASH_DUMP,
>> -	GUC_LOG_BUFFER_DEBUG,
>>   	GUC_LOG_BUFFER_CAPTURE,
>>   };
> 
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
>> index fa1d490dca0d..900b39fc734f 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_log.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_log.c
>> @@ -293,7 +293,7 @@ u32 xe_guc_get_log_buffer_offset(struct xe_guc_log *log, enum guc_log_buffer_typ
>>   	case GUC_LOG_BUFFER_CRASH_DUMP:
>>   		offset += XE_GUC_LOG_EVENT_LOG_BUFFER_SIZE;
>>   		fallthrough;
>> -	case GUC_LOG_BUFFER_DEBUG:
>> +	case GUC_LOG_BUFFER_EVENT_LOG:
>>   		break;
>>   	}
>>   
> 

