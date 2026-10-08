Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2566ECA6007
	for <intel-xe@archiver.kernel.org>; Thu,  8 Oct 2026 06:04:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D230110E747;
	Thu,  8 Oct 2026 06:04:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mn/5+q3f";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54C2910E747
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Oct 2026 06:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791439450; x=1822975450;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=/6zSG/B+3/dQLPm+jv7aQQTVY4GXpzQnYDpPjstGims=;
 b=mn/5+q3fWeZagFPLXnBftDmBvErcOPrORzqI/QXKU4TQQZSHBRas2afO
 YThrmNz82X+9gRUgAB4C9t4u9mn9ZmHGk74ekHPl+GKZq4vzLAqySD5jk
 dBF6NnPN1PEPFevRHi7N8iZmFuXZeWCPF/U7HNPYlUbLS3S2UZabkOGhE
 iJ4Jg9FaY93N8m2GQeGT8H9EWF/aGmhtmJmc+Sb+KTmIChi4sV8SqXhvA
 XPKtrYb553L/QCuYAnYqIRE5Wskwb5dkfRLXafOJA+6eBhRMR8XPL396Y
 EkiVa5TlErejrg44yS72ojOC8YeN9aN9s8UeTITpcr2kFeRKqVV6rjMwR w==;
X-CSE-ConnectionGUID: vzwBsAVFQwe+YOuUC/vRNw==
X-CSE-MsgGUID: ueodqa+lSwKU163XBfGCgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="231701"
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; d="scan'208,217";a="231701"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2026 23:04:10 -0700
X-CSE-ConnectionGUID: vWaLw6zMTXC4NXSWCvqwvw==
X-CSE-MsgGUID: TBkCLhCQQVq3IhOCu08E2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; d="scan'208,217";a="257052"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2026 23:04:09 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 7 Oct 2026 23:04:09 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 7 Oct 2026 23:04:09 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.3) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 7 Oct 2026 23:04:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uwRreyEvhizYGvIwhIu2P24aK+Alqrjxc5sEmOnMW0LMnuOh+UnLbID9csvDMkvNui7scme/3OpEZ1x7MP6pwGjZJZb8Ky5NLGL1gBaoSlP9eG8xMzf4XNAMm8DXFXTYJ+D7Ji2CK7mP4L0n3w0zDGofMtpokPZu+60bFinF+W5xzLsFjE9rnXowd6EDtwH3x5N0C9B1z9160QR6tzA8kKrhHJjNPfy9VNYuXr8V4OaECPLjkvS6uS5TPeELDC5YPwp62qc+y7zZKEuy7vUDDS2nAQTKK/VhA2vpzrmmpXmUwoL7LhOcluN9kGoFAXjw42kJGlAIpCs6doBs6lTIVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PMQuCqOTPHcZmlbeq7Zs906VyE3V/gtrKy9EgR8GbNs=;
 b=hy0wH3G5woJaXZ0rw7WTcGvS8WndfRHyNtaqadPDpc58JSCD48PXc0ypu5xh6YTaj9uhZYt/c9WCM9DA7hFoSe28jP797+cDsuxgCcP+tmvSC5Zftfc+4egWr26i7EmH/oAD0bUu+OiHBlYLv5jhNIKg5tz67sNVe/0z97vTLKqWcLACO3mzajqYo6QKrq2PuJ4nZiDPUCTRxS53QPJvIrx0ejEhltdfphxcle2+wv3QRRpuKYjeaRueBftc75wWKuGWj3WQHZ8jFRHxHboFj2JGiXHfvLur/9+J/ZTzA4qfK+8Meq0CDasOE0Hvuy/dFKsfdK/S9pMBCLmfdrpDGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6954.namprd11.prod.outlook.com (2603:10b6:510:205::8)
 by DS0PR11MB7578.namprd11.prod.outlook.com (2603:10b6:8:141::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.16; Thu, 8 Oct
 2026 06:04:07 +0000
Received: from PH7PR11MB6954.namprd11.prod.outlook.com
 ([fe80::7a4e:c93f:b085:f2f8]) by PH7PR11MB6954.namprd11.prod.outlook.com
 ([fe80::7a4e:c93f:b085:f2f8%5]) with mapi id 15.21.0496.010; Thu, 8 Oct 2026
 06:04:07 +0000
Content-Type: multipart/alternative;
 boundary="------------fkCiyUr0209s0ju2V0NglwWU"
Message-ID: <ea1cf933-cd0b-403f-9bb3-1bff2134db48@intel.com>
Date: Thu, 8 Oct 2026 11:34:01 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/4] drm/xe/guc: Start use explicitly usable GuC IDs
 for for submission
To: <intel-xe@lists.freedesktop.org>
References: <20261005085132.3720685-1-piotr.piorkowski@intel.com>
 <20261005085132.3720685-4-piotr.piorkowski@intel.com>
Content-Language: en-US
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
In-Reply-To: <20261005085132.3720685-4-piotr.piorkowski@intel.com>
X-ClientProxiedBy: MA5PR01CA0238.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1f4::19) To PH7PR11MB6954.namprd11.prod.outlook.com
 (2603:10b6:510:205::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6954:EE_|DS0PR11MB7578:EE_
X-MS-Office365-Filtering-Correlation-Id: f5bc3e58-0433-4137-feaf-08df2501f66b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|4143699003|56012099006|11063799006|22082099003|6133799003|8096899003|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info: qIYg/Yfk/9OgJWNHrEtv+V6cOEi0zaghHk/6UMhNZ2djkN1g8gLF3kNa4dUBY9//3fT8QzRnu0HI78zamHQHBCHjvykkkGDRoT9P+lWs9yo5TBonoocVhlGfLcEP62yuf6V1PoMElZzQ/j94LGI7DhOM2zYmDCVl5RUSWhxbFUZddWUqiiEYbRZNwrCk7uBAtdtKKFkQwgDOWsjC8QRtttRnLDQSvYUN30RxvB5GXBe4Vx2Adk2ZUWv2z+jM/0gMrHDtJxodtckFbBedGfUINEuxdiMd+ygYAFQGREqOVKbPJKbWSKDGlaH8FSUC66eGGJeZMYWnnRCVjNzteCMz8Wexbnp4KKWSyi5ZhPAX6/2zuBbrWeahMFzdgbs90BmlwQN8Y8LD8y9IWfNtltQmOsWOG5sl2yx8KWaXWo8WJApIp/QPRvfh9FwPnHf5ebmQS/50D50Hw4od7da/HF8f0Lvwocn4LCQkXh2hAR9PS0EzBIvUr5aQudWK0Uumif1td8uCsk2fYrhNUv1hbj/LGLmaSN8uzWpJS+O+CZcRMTK8F3ihVildsOwh7Utv9ZZSOKcTm4NZD1VIyHs7bkLbwIarEUyb1gNeZpPEx81uwPcPnLupBbYoQJPu1y1/6wff6MAHM1WbIgtazZNpWfOG1S25UPJakUXRORBiEEHXvQ4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6954.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(4143699003)(56012099006)(11063799006)(22082099003)(6133799003)(8096899003)(10067099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c1FtMjQ2VzdOMjhOY2xJK3JadGd0VlYvZGp1Z3JheTZTaUdWbmNKRGIwSmU4?=
 =?utf-8?B?V1VZSHh1UlFHWGlwMExhQjFHSnRwQURKMHZtRjJSRHVnbFgwWTFnVFNDVERz?=
 =?utf-8?B?VFZlR0FERzJwVWViZVZLWXl3bXJJYjdSUDc5QTFHZ0lkYk9iay9DcXhsclpX?=
 =?utf-8?B?OUVXa3dMWjNZR0JLWWtaUHpjYUx0UXRpL2RHTit2TzBwSTdiaVcya0RRQlZh?=
 =?utf-8?B?SVhZVW9hZUdYd21mYUREYjNDMU15M0E4V3piL3c4OVlRY2k2Wk0wcncxdVVH?=
 =?utf-8?B?djAvblNkYm5qbHBudzVsaDRwZTVWQjV2TWl3aDZPUDIzMW1UdTFBTWxMR0FT?=
 =?utf-8?B?MTF3SVZEREgyRDhEZ3owZk01WHVwSmtjcy9OV2tOTzN1VTg2TGI3RWhKbXRC?=
 =?utf-8?B?dHBCMG1iK0oyMXQ2QVgwaWhPSERkNzMwYlRRZjhGT2ZIM2R6c3R2eC84Wjky?=
 =?utf-8?B?VktjYXVxYk9URGtRaHVTMUFNMHZhWDBWMEIyaVFSSlJIUkJGNTBFVlJVRUJo?=
 =?utf-8?B?QWdWd2xpSnNOdGxlZUZVVlNkK1c0ZU02N1oxVVZPUTcrNkdTdHVTb0lPNzV5?=
 =?utf-8?B?SHJYTm9SclVBV1o3RGdvR2ZRUGcwQUo5V01maWVPK2xqRkwwZ2w2RWladFBK?=
 =?utf-8?B?SW1hZnlZTXVBTy9rOTEyT00zSHdkcUttMEVCMGQyZ09Id29zcDF1UkxJcnlV?=
 =?utf-8?B?R1VuT2hRRzlRbU9EY2ZNMElvcmtqMW00Y0xXSXQwUHR2ak1wZUNQVVV5NkVh?=
 =?utf-8?B?Q0U0MjI4OUx6ME0zdEJEZkJrbXJTL1F6YllQNjlYNlR5NitwV2FLa1F5S3R5?=
 =?utf-8?B?Z0VDUWpQVDZadTNjeWFLdlhUU1hDaG92NHJ5ZVhsY2JtT2hDWGorM0xOaEVO?=
 =?utf-8?B?R1Z2dGdiM081dmVCcmRYaUpGVVpRanRhc3ppNVVnamJ6T1kyNEpOcm1UN1JN?=
 =?utf-8?B?RG8xdWRQSWMyMUtaUEZXRmIydDRWNmlmTU5sS1Y5bkhXOW5NckhZVEE2bHRh?=
 =?utf-8?B?dlVFUENnV0IxUEtud2cvOHcwWEc3S2RPN0h2b2RMU1dBRm5TdDBnbldWdGhu?=
 =?utf-8?B?bDQxcUh2Q3NRdzdLNlI0NFE0c2tKUE15alU2bndkc3I4Q2xmbnBZaTZHWGlQ?=
 =?utf-8?B?akxVTi9PT3Z2Y2twaDF5Q1pONXBTUm9FOGFwQVc3aUM1UEs1MUFuT2VBaDI3?=
 =?utf-8?B?ZU9RQ25OWE9GcFV6YkpPWnpURWowdTl1R3ZENkdjb2FFNDdsTkl6SVdJdHdh?=
 =?utf-8?B?UVVNZjdPblk4SlZkTUVlWGwySGJlcG0xbGdQMDRuRFdoZ3RsbktNbVVVYnBT?=
 =?utf-8?B?TDdMZ25hdTRGVGlDODNOVEliTFVZcHk2MysxNG5COVBvZ2MxODNYV0htOEJa?=
 =?utf-8?B?K3Y4eXNlQjJrY2VMMmVsb0doVy9iVmlyTTd2eWFrU0RNTG1HKytTWTI5Zk50?=
 =?utf-8?B?MXc0a2V5SzdkOE52WHk0b3REcTBzQk82ZkVUVEc2M3ZQY1JoQnI4WUQ1cFRx?=
 =?utf-8?B?aEMxWXVjTTJWL0RUL1JUUFM3QzU0MjZWU1JyMmdnUmlENm1oM1BnNzVmNFV6?=
 =?utf-8?B?M1Nvb2pyQnc2WUxoZlI1TnBjanJzN1h0WDhMQkNHQU1JVC8wUUdXZlVGZHBP?=
 =?utf-8?B?VlZhK3hiV1Q0d2loV0lCS2lHV0FnamlISEpjcmdSZUJQdXBmL05lQ2NjMkhq?=
 =?utf-8?B?a0xrbkI4emF3UXlCWE9ITnZTSjlDdmhpSTNldUM2bjRZTytycU9kMG9oVlZ3?=
 =?utf-8?B?N1FWMVJBQlVJamdMNW94VzlaMXBlRFkyNGxxWWdVVEd5K0dNMVNFUVpJRlVV?=
 =?utf-8?B?K1pNOEplMG9tSzR3YzhkbjBaY3ZydXkxdjdqdjJ4a1QvYUZFMGJyb3lQVzE4?=
 =?utf-8?B?ekVGMmMrb2h0TFhleVNUUXcxekNtYS80V2cwU3A2ZElkN1IxQnd0TExHMVA2?=
 =?utf-8?B?Z2NUem8zNTZGUWlGRTNuNVNhcE5HUER2ZEFUaWJQM1UzKzcwY2QrWHVKR2dU?=
 =?utf-8?B?RjZORTJPcHhzZ0FEWHExYTk3TU9wbTN6amRVQW5WeHBLZFIrU3A3TmIwdTFz?=
 =?utf-8?B?cU5NVnlQVStod2c0Y3V4ckt2bTltTzNCSi9hWnE1bEUwMk0zd1NYRjZycUN0?=
 =?utf-8?B?ZitTa2ZXK2pwWUk2bEF5WC9CNWVQWjJvQlJEME1mckZIeEpSUE1oQ0ZlMzFG?=
 =?utf-8?B?UllxL2QvY0VHN0d4NEFLeGVJQUZRbkJQZ2VhRTh5NVFuekFOWkR4aEZZN2VY?=
 =?utf-8?B?U2RFcW0wV3U1dStPZWIzQnJ5bWp1eThqdm9tQTVoNXdlUmJHL1loRklJZ2tw?=
 =?utf-8?B?dzU5aTZ1TGtBOGh6VmpMU21zb21qdTRGbFZWRGFsNExRcXZ6eU1lb2JyUCtG?=
 =?utf-8?Q?w56VbM6bJHic1KmQ=3D?=
X-Exchange-RoutingPolicyChecked: Ilv7RmHw6VZWQf3WNkMozgI7Wev9oeEKs8NPxNlYPoelQ/ebhWb7zau7oOgC33tOw1nJr/mgTdrtox7TEoeJyeU+lTTv/56/jXndnDPqM+qlAEyPh+JICYp+Kj7gZjYfG3Y3lX6zS9pZTQQUo6z7I9RDrK7DSuqRSpAkyoWu8Jvi4x9gfLnShXu4NLHvl6FagD7nVZxQJlcE4Domz16FRzuGyvN6lsqQG4GQjjwbwOsHONMNCS4uEMHtTJumf1wSw5KMbM1Zmsw+3L+qV9kQr+RzYL1Zq7vi7Jm8jVg9FKkO0wi6w4bycoOOyVM4zeDfV4i7cAMjxAr6C8ip6TP8wg==
X-MS-Exchange-CrossTenant-Network-Message-Id: f5bc3e58-0433-4137-feaf-08df2501f66b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6954.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 06:04:07.1795 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3Xy+Gp99mGZmfR4XoShv7gXNeq/dX1WIogw3SAX2jRbdxi+Xgaw+s+tZ+Lp6wd/tLg0zkiiCeTSuoL1YwrqfgfTi+6WiohHCASWbmLsnVc4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7578
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

--------------fkCiyUr0209s0ju2V0NglwWU
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 05-Oct-26 2:21 PM, Piórkowski, Piotr wrote:
> From: Piotr Piórkowski<piotr.piorkowski@intel.com>
>
> Switch GuC submission to explicitly allocate IDs from the usable
> ID pool.
> Also lets configure the GuC ID manager according to the device operating
> mode during submission initialization. Use dedicated initialization
> paths for native, PF and VF modes to expose the appropriate usable and
> shareable GuC ID ranges.
>
> v2: Use xe_root_mmio_gt() to get the primary GT so no NULL check is
>      needed (Sashiko).
>
> Assisted-by: Claude:claude-5-sonnet
> Signed-off-by: Piotr Piórkowski<piotr.piorkowski@intel.com>
> Cc: Michal Wajdeczko<michal.wajdeczko@intel.com>
> ---
>   drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c | 33 +++++++++++++
>   drivers/gpu/drm/xe/xe_guc.c                   |  4 +-
>   drivers/gpu/drm/xe/xe_guc_id_mgr.c            | 49 ++++++++++++++++---
>   drivers/gpu/drm/xe/xe_guc_id_mgr.h            | 13 ++++-
>   drivers/gpu/drm/xe/xe_guc_submit.c            | 27 +++++-----
>   drivers/gpu/drm/xe/xe_guc_submit.h            |  2 +-
>   6 files changed, 105 insertions(+), 23 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c b/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
> index 5fe71eac2e380..2e62809b4d4c5 100644
> --- a/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
> +++ b/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
> @@ -65,6 +65,23 @@ static void init_fini(struct kunit *test)
>   	KUNIT_EXPECT_EQ(test, idm_total(idm), 0);
>   }
>   
> +static void check_init_small(struct kunit *test)
> +{
> +	struct xe_guc_id_mgr *idm = test->priv;
> +	unsigned int count = 8;
> +
> +	KUNIT_ASSERT_EQ(test, xe_guc_id_mgr_init_small(idm, count), 0);
> +	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_max_usable(idm), count);
> +	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_max_shareable(idm), 0);
> +	KUNIT_EXPECT_EQ(test, idm_total(idm), count);
> +
> +	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_reserve_usable(idm, count), 0);
> +	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_reserve_usable(idm, 1), -ENOSPC);
> +	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_release_usable(idm, 0, count), 0);
> +
> +	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_reserve_shareable(idm, 1, 0), -ENODATA);
> +}
> +
>   static bool require_iov_config_or_skip(struct kunit *test)
>   {
>   	if (!IS_ENABLED(CONFIG_PCI_IOV)) {
> @@ -75,6 +92,20 @@ static bool require_iov_config_or_skip(struct kunit *test)
>   	return true;
>   }
>   
> +static void check_init_shared(struct kunit *test)
> +{
> +	struct xe_guc_id_mgr *idm = test->priv;
> +
> +	if (!require_iov_config_or_skip(test))
> +		return;
> +
> +	KUNIT_ASSERT_TRUE(test, IS_SRIOV_PF(idm_to_xe(idm)));
> +	KUNIT_ASSERT_EQ(test, xe_guc_id_mgr_init_shared(idm), 0);
> +	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_max_usable(idm), GUC_ID_MAX);
> +	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_max_shareable(idm), GUC_ID_MAX);
> +	KUNIT_EXPECT_EQ(test, idm_total(idm), GUC_ID_MAX);
> +}
> +
>   static unsigned int test_idm_used_total(struct xe_guc_id_mgr *idm)
>   {
>   	lockdep_assert_held(idm_mutex(idm));
> @@ -671,6 +702,8 @@ static struct kunit_case guc_id_mgr_test_cases[] = {
>   	KUNIT_CASE(bad_init),
>   	KUNIT_CASE(no_init),
>   	KUNIT_CASE(init_fini),
> +	KUNIT_CASE(check_init_small),
> +	KUNIT_CASE(check_init_shared),
>   	KUNIT_CASE(check_used),
>   	KUNIT_CASE(check_quota),
>   	KUNIT_CASE_SLOW(check_all),
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 3ab4cb9e4964c..6c35474ab843a 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -853,7 +853,7 @@ static int vf_guc_init_post_hwconfig(struct xe_guc *guc)
>   {
>   	int err;
>   
> -	err = xe_guc_submit_init(guc, xe_gt_sriov_vf_guc_ids(guc_to_gt(guc)));
> +	err = xe_guc_submit_init(guc);
>   	if (err)
>   		return err;
>   
> @@ -897,7 +897,7 @@ int xe_guc_init_post_hwconfig(struct xe_guc *guc)
>   
>   	guc_init_params_post_hwconfig(guc);
>   
> -	ret = xe_guc_submit_init(guc, ~0);
> +	ret = xe_guc_submit_init(guc);
>   	if (ret)
>   		return ret;
>   
> diff --git a/drivers/gpu/drm/xe/xe_guc_id_mgr.c b/drivers/gpu/drm/xe/xe_guc_id_mgr.c
> index 8f90a5337fe4c..dc918221b78de 100644
> --- a/drivers/gpu/drm/xe/xe_guc_id_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_guc_id_mgr.c
> @@ -120,23 +120,56 @@ static int idm_init(struct xe_guc_id_mgr *idm, unsigned int usable, unsigned int
>   }
>   
>   /**
> - * xe_guc_id_mgr_init() - Initialize GuC context ID Manager.
> + * xe_guc_id_mgr_init() - Initialize GuC context ID manager in native mode.
>    * @idm: the &xe_guc_id_mgr to initialize
> - * @limit: number of IDs to manage
>    *
> - * The bare-metal or PF driver can pass ~0 as &limit to indicate that all
> - * context IDs supported by the GuC firmware are available for use.
> + * Can only be called when the device is not in SR-IOV mode.
>    *
>    * Return: 0 on success or a negative error code on failure.
>    */
> -int xe_guc_id_mgr_init(struct xe_guc_id_mgr *idm, unsigned int limit)
> +int xe_guc_id_mgr_init(struct xe_guc_id_mgr *idm)
>   {
> -	if (limit == ~0)
> -		limit = GUC_ID_MAX;
> +	xe_gt_assert(idm_to_gt(idm), !IS_SRIOV(idm_to_xe(idm)));
>   
> -	return idm_init(idm, limit, 0);
> +	return idm_init(idm, GUC_ID_MAX, 0);
>   }
>   
> +/**
> + * xe_guc_id_mgr_init_small() - Initialize GuC ID manager for small count.
> + * @idm: the &xe_guc_id_mgr to initialize
> + * @count: the number of usable GuC context IDs
> + *
> + * This function initializes the GuC ID manager to manage a small number of
> + * GuC context IDs (0..count-1) for use by the GuC submission code.
> + *
> + * Return: 0 on success, or a negative error code on failure.
> + */
> +int xe_guc_id_mgr_init_small(struct xe_guc_id_mgr *idm, unsigned int count)
> +{
> +	return idm_init(idm, count, 0);
> +}
> +
> +#ifdef CONFIG_PCI_IOV
> +/**
> + * xe_guc_id_mgr_init_shared() - Initialize GuC ID manager for PF.
> + * @idm: the &xe_guc_id_mgr to initialize
> + *
> + * This function initializes the GuC ID manager to manage the full range of
> + * GuC context IDs (0..GUC_ID_MAX - 1) for use by the GuC submission code.
> + * All GuC context IDs will be shareable with VFs.
> + *
> + * Can only be called when the device is in SR-IOV PF mode.
> + *
> + * Return: 0 on success, or a negative error code on failure.
> + */
> +int xe_guc_id_mgr_init_shared(struct xe_guc_id_mgr *idm)
> +{
> +	xe_gt_assert(idm_to_gt(idm), IS_SRIOV_PF(idm_to_xe(idm)));
> +
> +	return idm_init(idm, GUC_ID_MAX, GUC_ID_MAX);
> +}
> +#endif /* CONFIG_PCI_IOV */
> +
>   /**
>    * xe_guc_id_mgr_max_usable() - Get maximum number of usable GuC context IDs.
>    * @idm: the &xe_guc_id_mgr to query
> diff --git a/drivers/gpu/drm/xe/xe_guc_id_mgr.h b/drivers/gpu/drm/xe/xe_guc_id_mgr.h
> index 209f99831f1b4..ed9970829a939 100644
> --- a/drivers/gpu/drm/xe/xe_guc_id_mgr.h
> +++ b/drivers/gpu/drm/xe/xe_guc_id_mgr.h
> @@ -6,10 +6,21 @@
>   #ifndef _XE_GUC_ID_MGR_H_
>   #define _XE_GUC_ID_MGR_H_
>   
> +#include <linux/errno.h>
> +
>   struct drm_printer;
>   struct xe_guc_id_mgr;
>   
> -int xe_guc_id_mgr_init(struct xe_guc_id_mgr *idm, unsigned int limit);
> +int xe_guc_id_mgr_init(struct xe_guc_id_mgr *idm);
> +int xe_guc_id_mgr_init_small(struct xe_guc_id_mgr *idm, unsigned int count);
> +#ifdef CONFIG_PCI_IOV
> +int xe_guc_id_mgr_init_shared(struct xe_guc_id_mgr *idm);
> +#else
> +static inline int xe_guc_id_mgr_init_shared(struct xe_guc_id_mgr *idm)
> +{
> +	return -ENODEV;
> +}
> +#endif
>   
>   unsigned int xe_guc_id_mgr_max_usable(struct xe_guc_id_mgr *idm);
>   unsigned int xe_guc_id_mgr_max_shareable(struct xe_guc_id_mgr *idm);
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 7ce73489c35fc..cef59d5d82aa5 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -286,20 +286,26 @@ static void primelockdep(struct xe_guc *guc)
>   	fs_reclaim_release(GFP_KERNEL);
>   }
>   
> +static int guc_id_mgr_init(struct xe_guc *guc)
> +{
> +	if (IS_SRIOV_PF(guc_to_xe(guc)))
> +		return xe_guc_id_mgr_init_shared(&guc->submission_state.idm);
> +	else if (IS_SRIOV_VF(guc_to_xe(guc)))
> +		return xe_guc_id_mgr_init_small(&guc->submission_state.idm,
> +						xe_gt_sriov_vf_guc_ids(guc_to_gt(guc)));
> +	else
> +		return xe_guc_id_mgr_init(&guc->submission_state.idm);
> +}
> +
>   /**
>    * xe_guc_submit_init() - Initialize GuC submission.
>    * @guc: the &xe_guc to initialize
> - * @num_ids: number of GuC context IDs to use
> - *
> - * The bare-metal or PF driver can pass ~0 as &num_ids to indicate that all
> - * GuC context IDs supported by the GuC firmware should be used for submission.
>    *
> - * Only VF drivers will have to provide explicit number of GuC context IDs
> - * that they can use for submission.
> + * This function initializes the GuC submission state.
>    *
>    * Return: 0 on success or a negative error code on failure.
>    */
> -int xe_guc_submit_init(struct xe_guc *guc, unsigned int num_ids)
> +int xe_guc_submit_init(struct xe_guc *guc)
>   {
>   	struct xe_device *xe = guc_to_xe(guc);
>   	struct xe_gt *gt = guc_to_gt(guc);
> @@ -309,7 +315,7 @@ int xe_guc_submit_init(struct xe_guc *guc, unsigned int num_ids)
>   	if (err)
>   		return err;
>   
> -	err = xe_guc_id_mgr_init(&guc->submission_state.idm, num_ids);
> +	err = guc_id_mgr_init(guc);
>   	if (err)
>   		return err;
>   
> @@ -415,8 +421,7 @@ static int alloc_guc_id(struct xe_guc *guc, struct xe_exec_queue *q)
>   	int ret, i;
>   
>   	mutex_lock(&guc->submission_state.lock);
> -	ret = xe_guc_id_mgr_reserve_locked(&guc->submission_state.idm,
> -					   q->width);
> +	ret = xe_guc_id_mgr_reserve_usable_locked(&guc->submission_state.idm, q->width);
>   	mutex_unlock(&guc->submission_state.lock);
>   	if (ret < 0)
>   		return ret;
> @@ -3298,7 +3303,7 @@ g2h_exec_queue_lookup(struct xe_guc *guc, u32 guc_id)
>   	struct xe_gt *gt = guc_to_gt(guc);
>   	struct xe_exec_queue *q;
>   
> -	if (unlikely(guc_id >= GUC_ID_MAX)) {
> +	if (unlikely(guc_id >= xe_guc_id_mgr_max_usable(&guc->submission_state.idm))) {
>   		xe_gt_err(gt, "Invalid guc_id %u\n", guc_id);
>   		return NULL;
>   	}
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
> index 29abf07d8f041..7a81d0aa19bb2 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.h
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.h
> @@ -13,7 +13,7 @@ struct xe_exec_queue;
>   struct xe_guc;
>   struct xe_hw_engine;
>   
> -int xe_guc_submit_init(struct xe_guc *guc, unsigned int num_ids);
> +int xe_guc_submit_init(struct xe_guc *guc);
>   int xe_guc_submit_enable(struct xe_guc *guc);
>   void xe_guc_submit_disable(struct xe_guc *guc);
>   

LGTM.

Reviewed-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>

--------------fkCiyUr0209s0ju2V0NglwWU
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 05-Oct-26 2:21 PM, Piórkowski, Piotr
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20261005085132.3720685-4-piotr.piorkowski@intel.com">
      <pre wrap="" class="moz-quote-pre">From: Piotr Piórkowski <a class="moz-txt-link-rfc2396E" href="mailto:piotr.piorkowski@intel.com">&lt;piotr.piorkowski@intel.com&gt;</a>

Switch GuC submission to explicitly allocate IDs from the usable
ID pool.
Also lets configure the GuC ID manager according to the device operating
mode during submission initialization. Use dedicated initialization
paths for native, PF and VF modes to expose the appropriate usable and
shareable GuC ID ranges.

v2: Use xe_root_mmio_gt() to get the primary GT so no NULL check is
    needed (Sashiko).

Assisted-by: Claude:claude-5-sonnet
Signed-off-by: Piotr Piórkowski <a class="moz-txt-link-rfc2396E" href="mailto:piotr.piorkowski@intel.com">&lt;piotr.piorkowski@intel.com&gt;</a>
Cc: Michal Wajdeczko <a class="moz-txt-link-rfc2396E" href="mailto:michal.wajdeczko@intel.com">&lt;michal.wajdeczko@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c | 33 +++++++++++++
 drivers/gpu/drm/xe/xe_guc.c                   |  4 +-
 drivers/gpu/drm/xe/xe_guc_id_mgr.c            | 49 ++++++++++++++++---
 drivers/gpu/drm/xe/xe_guc_id_mgr.h            | 13 ++++-
 drivers/gpu/drm/xe/xe_guc_submit.c            | 27 +++++-----
 drivers/gpu/drm/xe/xe_guc_submit.h            |  2 +-
 6 files changed, 105 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c b/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
index 5fe71eac2e380..2e62809b4d4c5 100644
--- a/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
@@ -65,6 +65,23 @@ static void init_fini(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, idm_total(idm), 0);
 }
 
+static void check_init_small(struct kunit *test)
+{
+	struct xe_guc_id_mgr *idm = test-&gt;priv;
+	unsigned int count = 8;
+
+	KUNIT_ASSERT_EQ(test, xe_guc_id_mgr_init_small(idm, count), 0);
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_max_usable(idm), count);
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_max_shareable(idm), 0);
+	KUNIT_EXPECT_EQ(test, idm_total(idm), count);
+
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_reserve_usable(idm, count), 0);
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_reserve_usable(idm, 1), -ENOSPC);
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_release_usable(idm, 0, count), 0);
+
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_reserve_shareable(idm, 1, 0), -ENODATA);
+}
+
 static bool require_iov_config_or_skip(struct kunit *test)
 {
 	if (!IS_ENABLED(CONFIG_PCI_IOV)) {
@@ -75,6 +92,20 @@ static bool require_iov_config_or_skip(struct kunit *test)
 	return true;
 }
 
+static void check_init_shared(struct kunit *test)
+{
+	struct xe_guc_id_mgr *idm = test-&gt;priv;
+
+	if (!require_iov_config_or_skip(test))
+		return;
+
+	KUNIT_ASSERT_TRUE(test, IS_SRIOV_PF(idm_to_xe(idm)));
+	KUNIT_ASSERT_EQ(test, xe_guc_id_mgr_init_shared(idm), 0);
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_max_usable(idm), GUC_ID_MAX);
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_max_shareable(idm), GUC_ID_MAX);
+	KUNIT_EXPECT_EQ(test, idm_total(idm), GUC_ID_MAX);
+}
+
 static unsigned int test_idm_used_total(struct xe_guc_id_mgr *idm)
 {
 	lockdep_assert_held(idm_mutex(idm));
@@ -671,6 +702,8 @@ static struct kunit_case guc_id_mgr_test_cases[] = {
 	KUNIT_CASE(bad_init),
 	KUNIT_CASE(no_init),
 	KUNIT_CASE(init_fini),
+	KUNIT_CASE(check_init_small),
+	KUNIT_CASE(check_init_shared),
 	KUNIT_CASE(check_used),
 	KUNIT_CASE(check_quota),
 	KUNIT_CASE_SLOW(check_all),
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 3ab4cb9e4964c..6c35474ab843a 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -853,7 +853,7 @@ static int vf_guc_init_post_hwconfig(struct xe_guc *guc)
 {
 	int err;
 
-	err = xe_guc_submit_init(guc, xe_gt_sriov_vf_guc_ids(guc_to_gt(guc)));
+	err = xe_guc_submit_init(guc);
 	if (err)
 		return err;
 
@@ -897,7 +897,7 @@ int xe_guc_init_post_hwconfig(struct xe_guc *guc)
 
 	guc_init_params_post_hwconfig(guc);
 
-	ret = xe_guc_submit_init(guc, ~0);
+	ret = xe_guc_submit_init(guc);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/xe/xe_guc_id_mgr.c b/drivers/gpu/drm/xe/xe_guc_id_mgr.c
index 8f90a5337fe4c..dc918221b78de 100644
--- a/drivers/gpu/drm/xe/xe_guc_id_mgr.c
+++ b/drivers/gpu/drm/xe/xe_guc_id_mgr.c
@@ -120,23 +120,56 @@ static int idm_init(struct xe_guc_id_mgr *idm, unsigned int usable, unsigned int
 }
 
 /**
- * xe_guc_id_mgr_init() - Initialize GuC context ID Manager.
+ * xe_guc_id_mgr_init() - Initialize GuC context ID manager in native mode.
  * @idm: the &amp;xe_guc_id_mgr to initialize
- * @limit: number of IDs to manage
  *
- * The bare-metal or PF driver can pass ~0 as &amp;limit to indicate that all
- * context IDs supported by the GuC firmware are available for use.
+ * Can only be called when the device is not in SR-IOV mode.
  *
  * Return: 0 on success or a negative error code on failure.
  */
-int xe_guc_id_mgr_init(struct xe_guc_id_mgr *idm, unsigned int limit)
+int xe_guc_id_mgr_init(struct xe_guc_id_mgr *idm)
 {
-	if (limit == ~0)
-		limit = GUC_ID_MAX;
+	xe_gt_assert(idm_to_gt(idm), !IS_SRIOV(idm_to_xe(idm)));
 
-	return idm_init(idm, limit, 0);
+	return idm_init(idm, GUC_ID_MAX, 0);
 }
 
+/**
+ * xe_guc_id_mgr_init_small() - Initialize GuC ID manager for small count.
+ * @idm: the &amp;xe_guc_id_mgr to initialize
+ * @count: the number of usable GuC context IDs
+ *
+ * This function initializes the GuC ID manager to manage a small number of
+ * GuC context IDs (0..count-1) for use by the GuC submission code.
+ *
+ * Return: 0 on success, or a negative error code on failure.
+ */
+int xe_guc_id_mgr_init_small(struct xe_guc_id_mgr *idm, unsigned int count)
+{
+	return idm_init(idm, count, 0);
+}
+
+#ifdef CONFIG_PCI_IOV
+/**
+ * xe_guc_id_mgr_init_shared() - Initialize GuC ID manager for PF.
+ * @idm: the &amp;xe_guc_id_mgr to initialize
+ *
+ * This function initializes the GuC ID manager to manage the full range of
+ * GuC context IDs (0..GUC_ID_MAX - 1) for use by the GuC submission code.
+ * All GuC context IDs will be shareable with VFs.
+ *
+ * Can only be called when the device is in SR-IOV PF mode.
+ *
+ * Return: 0 on success, or a negative error code on failure.
+ */
+int xe_guc_id_mgr_init_shared(struct xe_guc_id_mgr *idm)
+{
+	xe_gt_assert(idm_to_gt(idm), IS_SRIOV_PF(idm_to_xe(idm)));
+
+	return idm_init(idm, GUC_ID_MAX, GUC_ID_MAX);
+}
+#endif /* CONFIG_PCI_IOV */
+
 /**
  * xe_guc_id_mgr_max_usable() - Get maximum number of usable GuC context IDs.
  * @idm: the &amp;xe_guc_id_mgr to query
diff --git a/drivers/gpu/drm/xe/xe_guc_id_mgr.h b/drivers/gpu/drm/xe/xe_guc_id_mgr.h
index 209f99831f1b4..ed9970829a939 100644
--- a/drivers/gpu/drm/xe/xe_guc_id_mgr.h
+++ b/drivers/gpu/drm/xe/xe_guc_id_mgr.h
@@ -6,10 +6,21 @@
 #ifndef _XE_GUC_ID_MGR_H_
 #define _XE_GUC_ID_MGR_H_
 
+#include &lt;linux/errno.h&gt;
+
 struct drm_printer;
 struct xe_guc_id_mgr;
 
-int xe_guc_id_mgr_init(struct xe_guc_id_mgr *idm, unsigned int limit);
+int xe_guc_id_mgr_init(struct xe_guc_id_mgr *idm);
+int xe_guc_id_mgr_init_small(struct xe_guc_id_mgr *idm, unsigned int count);
+#ifdef CONFIG_PCI_IOV
+int xe_guc_id_mgr_init_shared(struct xe_guc_id_mgr *idm);
+#else
+static inline int xe_guc_id_mgr_init_shared(struct xe_guc_id_mgr *idm)
+{
+	return -ENODEV;
+}
+#endif
 
 unsigned int xe_guc_id_mgr_max_usable(struct xe_guc_id_mgr *idm);
 unsigned int xe_guc_id_mgr_max_shareable(struct xe_guc_id_mgr *idm);
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 7ce73489c35fc..cef59d5d82aa5 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -286,20 +286,26 @@ static void primelockdep(struct xe_guc *guc)
 	fs_reclaim_release(GFP_KERNEL);
 }
 
+static int guc_id_mgr_init(struct xe_guc *guc)
+{
+	if (IS_SRIOV_PF(guc_to_xe(guc)))
+		return xe_guc_id_mgr_init_shared(&amp;guc-&gt;submission_state.idm);
+	else if (IS_SRIOV_VF(guc_to_xe(guc)))
+		return xe_guc_id_mgr_init_small(&amp;guc-&gt;submission_state.idm,
+						xe_gt_sriov_vf_guc_ids(guc_to_gt(guc)));
+	else
+		return xe_guc_id_mgr_init(&amp;guc-&gt;submission_state.idm);
+}
+
 /**
  * xe_guc_submit_init() - Initialize GuC submission.
  * @guc: the &amp;xe_guc to initialize
- * @num_ids: number of GuC context IDs to use
- *
- * The bare-metal or PF driver can pass ~0 as &amp;num_ids to indicate that all
- * GuC context IDs supported by the GuC firmware should be used for submission.
  *
- * Only VF drivers will have to provide explicit number of GuC context IDs
- * that they can use for submission.
+ * This function initializes the GuC submission state.
  *
  * Return: 0 on success or a negative error code on failure.
  */
-int xe_guc_submit_init(struct xe_guc *guc, unsigned int num_ids)
+int xe_guc_submit_init(struct xe_guc *guc)
 {
 	struct xe_device *xe = guc_to_xe(guc);
 	struct xe_gt *gt = guc_to_gt(guc);
@@ -309,7 +315,7 @@ int xe_guc_submit_init(struct xe_guc *guc, unsigned int num_ids)
 	if (err)
 		return err;
 
-	err = xe_guc_id_mgr_init(&amp;guc-&gt;submission_state.idm, num_ids);
+	err = guc_id_mgr_init(guc);
 	if (err)
 		return err;
 
@@ -415,8 +421,7 @@ static int alloc_guc_id(struct xe_guc *guc, struct xe_exec_queue *q)
 	int ret, i;
 
 	mutex_lock(&amp;guc-&gt;submission_state.lock);
-	ret = xe_guc_id_mgr_reserve_locked(&amp;guc-&gt;submission_state.idm,
-					   q-&gt;width);
+	ret = xe_guc_id_mgr_reserve_usable_locked(&amp;guc-&gt;submission_state.idm, q-&gt;width);
 	mutex_unlock(&amp;guc-&gt;submission_state.lock);
 	if (ret &lt; 0)
 		return ret;
@@ -3298,7 +3303,7 @@ g2h_exec_queue_lookup(struct xe_guc *guc, u32 guc_id)
 	struct xe_gt *gt = guc_to_gt(guc);
 	struct xe_exec_queue *q;
 
-	if (unlikely(guc_id &gt;= GUC_ID_MAX)) {
+	if (unlikely(guc_id &gt;= xe_guc_id_mgr_max_usable(&amp;guc-&gt;submission_state.idm))) {
 		xe_gt_err(gt, &quot;Invalid guc_id %u\n&quot;, guc_id);
 		return NULL;
 	}
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
index 29abf07d8f041..7a81d0aa19bb2 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.h
+++ b/drivers/gpu/drm/xe/xe_guc_submit.h
@@ -13,7 +13,7 @@ struct xe_exec_queue;
 struct xe_guc;
 struct xe_hw_engine;
 
-int xe_guc_submit_init(struct xe_guc *guc, unsigned int num_ids);
+int xe_guc_submit_init(struct xe_guc *guc);
 int xe_guc_submit_enable(struct xe_guc *guc);
 void xe_guc_submit_disable(struct xe_guc *guc);
 </pre>
    </blockquote>
    <p>LGTM.</p>
    <p><span style="font-family:Menlo">Reviewed-by: </span><span style="font-family:Aptos">Satyanarayana
        K V P <a class="moz-txt-link-rfc2396E" href="mailto:satyanarayana.k.v.p@intel.com">&lt;satyanarayana.k.v.p@intel.com&gt;</a></span></p>
    <blockquote type="cite" cite="mid:20261005085132.3720685-4-piotr.piorkowski@intel.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
    </blockquote>
  </body>
</html>

--------------fkCiyUr0209s0ju2V0NglwWU--
