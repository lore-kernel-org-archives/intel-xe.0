Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34F81C5CFC1
	for <intel-xe@archiver.kernel.org>; Fri, 14 Aug 2026 10:30:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E835110F564;
	Fri, 14 Aug 2026 10:30:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PbLuKMlS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 678EA10F577
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Aug 2026 10:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786703451; x=1818239451;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Oqdj3ncYAE00K9TSrvvA872Ye7P9H8ejkwLC8er53Jg=;
 b=PbLuKMlSoxP8hzKErdslXM6TdWcBExe3GwbPPNhk2PryocRPJay5LGao
 z1oEuMyh9Bf55NccPz5UHge93xdXbFnBLyt+zC1tMgyqRvn6sH+s1R+w7
 j9FQ3X+X9KX2wK6DaCYoIpVf4qYPyi5CoTwp2boA5ulMqXViYaVfxJJsv
 vhbLzHCcfG9Q0vMjzRO8Xll5kjitXFG06Qyxmq2JlTOjwpYA8j0GbJd60
 WS9fsowTklMxzKweKKZbLJ7ycj9iQeVwhgHPa+M+28cAuMwFz8iFI7ZMz
 eDVtsnQI5z9u1hzXoH65XqUxG013dNJ3sv581BcOiqHfC75KN3S48I0A0 g==;
X-CSE-ConnectionGUID: A8rNUd5BQ5iFf06IJvEGwg==
X-CSE-MsgGUID: DOGkv+rWSDO83uegDWlVgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="98639558"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="98639558"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 03:30:51 -0700
X-CSE-ConnectionGUID: AxYYSEn0TZWPkyhZguXRtQ==
X-CSE-MsgGUID: G8z/r9pnTWGDWezUu5edaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="262871977"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 03:30:47 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 14 Aug 2026 03:30:45 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Fri, 14 Aug 2026 03:30:45 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.21) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 14 Aug 2026 03:30:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yC6FuOyHIP885+7aNDPkJ5wjoiDWu/+SiPx1GOi0zuaOaYqqLe48sM7rqM6CiFm5xbmd4JkL9EuCSlmlCGbQ1LZFZ518fhKH6Zb7hIr/3g4rr+Gd0tzBzD4nQ8Kzs9XcDWzvhLjaQ2hvywoFzWWZg3vMEAwwa1MLTx3G90/OhY1MjAZBGsD5UvFhLoPCe1GHJMHUyBuZDdGLpnuChh/N5oCyPc4pHCYekQR63WovmVdxm30FvPbwd2P04MtKdCSK8PP20tGJRujL26CBr6mFdso+zsRjhNA/KZrlMQFGpGAdesYoPoa0lRpHOT90uf+d7RxFtsNIPbCmjUH+6TxqvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S7tv/6jNv5sTQJ4DxdDcMhV3akQ7ERfgkXr4jtEsUBM=;
 b=bFxfijMu4t6pjors6okXaGLwUogfT1N7onVVrIQQ8Pwmr/mlX88wUwo8VNPX2VAIj/+Pp3rGWQkMVNsr7gC1Vu8vqyoWYh2H+WF7tXo9NE0M58eBdipP3Voei6RRY9mBqD08nLmxF0NXIHm43CGdKxTRRKayJ0tgH5qhXGm8XWy7Nq1hMgi8THhuRpe1v/utM8h5O5UXVUDgAz6T5v+4ljSx2IB0RCCqjIay4tfqSStuW3p19lsMxmXdxi1BkRNFXYmz2drhPDYJFGRj+LWUQL04sTvO/uJLcNIvjAFU8vYuySnpX1ioYvpM0ZQBLbFW/oocAVvwv7cFPjFYfiRSXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by CO1PR11MB4771.namprd11.prod.outlook.com (2603:10b6:303:9f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.16; Fri, 14 Aug
 2026 10:30:39 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0315.011; Fri, 14 Aug 2026
 10:30:39 +0000
Message-ID: <7a237006-bf12-4fea-8b34-921f9a00c1a6@intel.com>
Date: Fri, 14 Aug 2026 12:30:35 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 30/32] drm/xe/gt: Report 'Fault response' pagefault
 error using SIGID
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Aravind Iddamsetty
 <aravind.iddamsetty@intel.com>, Mallesh Koujalagi
 <mallesh.koujalagi@intel.com>
References: <20260812191450.11690-1-michal.wajdeczko@intel.com>
 <20260812191450.11690-31-michal.wajdeczko@intel.com>
 <an4PAo7kT0tomdgh@intel.com> <fd80931a-b656-4220-b099-a370fe2a5313@intel.com>
 <4c041efa-449a-49f5-89d2-a2db09940cec@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <4c041efa-449a-49f5-89d2-a2db09940cec@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA1PEPF00005B90.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d8::627) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|CO1PR11MB4771:EE_
X-MS-Office365-Filtering-Correlation-Id: d300bc3f-67fe-4ec2-3654-08def9ef15d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|366016|376014|56012099006|10067099003|6133799003|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: fdfnPeJw1ogdmk5JwT8PG7ENHh+D2/yZQR+TI8taC+AEP0jrlDuund0iZcGo5k7KQWTqD0xCxe+eovvHmVTveB8BiNoTlc0t/l+cVOcTv5bdXZoPXSw2v6jGpJ0Lam3L8PRM3+/UPFzivYMAu5wZr09zQ9qC4L3dUvu003vT7NJnB6tdFlsgpn6TQ0FhNNo3iOKpO1GCN/wcgvNQfZf+bsjUpYHNIr9kdJA7Zl/0bMwLdnP6j9pIlXn+ud1K8T16OBdS7xV2CN5wRj1pb96nOeEEHp/T+4taRKfyLPAiluywIIbSH/v/jJZD7W0ThN7Pgk+38X/BErMhv3Mt0i8AP3z6AakNkNbollReMn71ORIqNBTzGPJ9QegEIs26gvZWg/3UqjmVwEhZ4JW6GA4ZS2T5uY0wYGMVEuGM+/085VN5ywljJeLbCdIH/1nl5Fj9eRkj/ZHUmt/QmknV2EKtzn+42Ihxv4B7lOMgOnv0G75dlnJv402bLF+BoXsdIAh4HNxJEWkGpLQP1mvHl7bd94AzOsJw5kbNZagtragfUETvTFiZj71/mK0V/K/fVnZuHacnmeFsyyI3Onr+dbd+TLP43eW1BUIrVUtic9inUKs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(56012099006)(10067099003)(6133799003)(11063799006)(4143699003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SHlDcmpJeHZTU1FCMnFEeGFvUGNDSVZzMUk2bjNteU13N3YyV0hBUXd2WnVT?=
 =?utf-8?B?ZjNNM1BQclpIdmJwK0I0K1ZPM0E4YzNoTDdoM0daTE9VV200RTlSWjJqL1JU?=
 =?utf-8?B?VkdOTDZoZi9pakUwaTB4UXpnL1dTSnV4cWhJWmJVSGpKM0RvYlNNRDUwdmg2?=
 =?utf-8?B?VUNQOGk5ajlnZGlUckdCdU9mKzJGVFpjRjh4WWVpNWswZzgrV1FjSFZDSGU1?=
 =?utf-8?B?a3dMTk1YTndReXZIR2dXNXBrMlhGWHJZbkN3R3cvQjV2WldocEFiVEFSbVE2?=
 =?utf-8?B?WVJueXNmU3FnTzlNWUNzZGI2NmlIUklhR1pjNU96dHBCS293cGZsMmt0QURL?=
 =?utf-8?B?Qk83a0I0SmxHQi8rMmE3UFpFTk1Nd0tURTh0QWo0eHJFSm84RFBNUERHY1dq?=
 =?utf-8?B?M2tPY0NtcExWZGM4cndzS0JyQ3lFN2xsM2VHSDltaDQwNlFGRkNWSGZlTk44?=
 =?utf-8?B?bG9jbFBEdFVBRjBYSXRGWDdpRTRJVE14cE5LditiWGxXaVlGd3lQdjFSQ2wz?=
 =?utf-8?B?djVCVjZITGRJdFVOK2ZDMW1CVGxnSHJxUkVoUERPZ01KSDZVNkRNb095Ulor?=
 =?utf-8?B?a1o4Y1F5aUtmbXpsSkN5SmJ4QkFjUFlxbkFrbFdCTFErRWpXcjN5VWxEcHgz?=
 =?utf-8?B?bU1CQjIrbFNsa05JRENHOFlmeVhRQkhxKytzc3c2K3dTSmh2ZXlRdGloOXFG?=
 =?utf-8?B?VXZMYmRTRmxWZTlraWg1OFU5RHpGQUpnckdLT0JiVHhObVpiV3VpOUd4Ykpm?=
 =?utf-8?B?S1NYMjEyUnVwQ0s5c21jdmhYTUhIeGJjb0MyUzVsZGxQc1JvTlhFUmEyaCsv?=
 =?utf-8?B?ZlJHaVV0Rkh2Q2tFM1NLYVFMelM3ekx5eFhxWTlCUENNSG1Ob0d3VUVHajNl?=
 =?utf-8?B?eHFlRXRLZ3FJY2szR21hRDBQQnE4T2h0OGdMWHcvWVNiUit3N3F2SVRCMEk3?=
 =?utf-8?B?eStCdXR0TUo0Q2NQY2Qva25xSDZoQ0hzRzdud01SSHVGQVViNmU2SDcrNEVG?=
 =?utf-8?B?YnRmQm1vMFZ4VlFIbTVWY1NEaVYvTjZOZS8zYWtQamIvVVlXVXZqRUxyMUhZ?=
 =?utf-8?B?ZVM2STFDeUQwdkdqeWhOWHlybDhiL3hzZ2VlMmJkWlM0elliUkVVbEIwSlVF?=
 =?utf-8?B?Nkk4dWRXckV3ZVpIcUxSR29sTFBKQTY2ZUgzMVpNbkF4bkhvWDZrbHZjUlpZ?=
 =?utf-8?B?dEFWajBYOWdURFd3a0ZnRStqOXN1U1BjQURTckc5SGZUQnNNa0pHNVgwam13?=
 =?utf-8?B?cXJwTTVvOW1zZktiL3pDS3h6ZXRCa1R2bkVUWmp5Z1ROUWxFQTFGOE5WQTFj?=
 =?utf-8?B?VHNoMzB0NitqdTZkdVRDdW9iTTVxUHQ0MUxPRE1DZnhqdnNISVdRT2o5Z3lw?=
 =?utf-8?B?TUJjQXlVMDRlV1RIMWVNTUhJUDJSdVBZQmVzOC85d0tEQmNnYnRmUFQ2ZjZS?=
 =?utf-8?B?S0FPOTJhS3hEWEN6UytFWEVZcDMvS3RkRG5BV09RNjZIL2FhSUUyMzU4TGlk?=
 =?utf-8?B?QWdGeHpza01CR2RNc3ZucGZ1RDNiUmY2TlRUWDdubSthc0NOVTcwVTRaWnlk?=
 =?utf-8?B?ejlRc0JzWlA3M1RqYUlCM24vWDdVd1FtRm9aVk8vbGhYM1dxYlIvK012alQv?=
 =?utf-8?B?cmlSbmp4RXVxSkJic0hhZ2x3cElRMGQ4TU5sL3N6QzI4QUtVNWRUUlZwZTVR?=
 =?utf-8?B?anFySzJEdFB4dWV1LzU1SUphaGNseGhodDhremhoVWQ3bDZ1U0RDMUhZT1d0?=
 =?utf-8?B?c1lGZGlDVTZzVkc3SWNLOVVGVlFrTit0UDh2VFpxV082eE5ZaGt2TmVPN3V6?=
 =?utf-8?B?MVJlVkNDTGowNmVtVVhyZVRrUlI1NWhseHN2Q0haaGlKVzRuYkh4Q0I0YlVH?=
 =?utf-8?B?Z3IwV3JTYnprWWJkM1RTU2RpRFJUWktGY3FrcHZ0QkcrSFRuYyt6aytNUUk2?=
 =?utf-8?B?S2VjYldPMkEyUnE2Y2U0YlZoa0dvNW5kNWdVb0VybWlvVFc5VHZjRGhNM2Fw?=
 =?utf-8?B?dnlsQkNERXdzVU5TdDlxS1M1aUJSRjd0Qkp5c1I1SldHdm1mbDg4Y2Z2QjlP?=
 =?utf-8?B?SVhub0ZHNU93eU9FOERZcVdwdG5NeGF4TUNrVGNQUlJJclUzUlh4d0hJOEJS?=
 =?utf-8?B?a1ZyVzZwUnJSZXhjdERQd01PUHZjRGVIM0ZCRmhnZzVQaE5HamxZZEhoQS81?=
 =?utf-8?B?eTNma0NaS1pYcnU0c3FHMGJVSlB0NGd5b0ZYSlJaTThaZXNFbWxOWDAxNWYy?=
 =?utf-8?B?OWdxTjVGeVNJZ0k0UjhVU2NGeVlzdTBIeURlaVFDS3BwNEtGYTU2bWNqZk5x?=
 =?utf-8?B?SmFHSVFJQThTR0JwRU41cUVzaFMwdTY2bUN2MFozbHpNd29WRmxLT2gyWTlM?=
 =?utf-8?Q?az1944alo1Dc9bLM=3D?=
X-Exchange-RoutingPolicyChecked: bbRrZ2Jy/WddqHWzfu3fuZCVD8cbqmSpqKoaGlW1nQcTG3Hd+cWd+sxaB4SFc1LgdLBZ5mqNaEidexF02f8t43srTnrPbT76D0m8R7p9r040FIEarRtgU/onRn8N4BxejdCYfGc0VhUoeZsNX3g9mcGTAzhQwLEJyTFxJx6E7mC2pJCi5713PAKqkp81AkJ/Iqk0kLHLkRPyjq+WDo/kJRtUcC+20gOrpiEsv9r1Ljt9m01VyFU0BG3tJNLX65kxHvS7ztARzUxAM/R4Npq17FuEPf+fQqAn2XzDaAYEYqdKRqSb7p35qhUPPwuWdrJ7wwq+MD/fk0+GbgfpZMbZYA==
X-MS-Exchange-CrossTenant-Network-Message-Id: d300bc3f-67fe-4ec2-3654-08def9ef15d2
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 10:30:39.3199 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DuCjtv6IQyqJcFJBL0WqWTm3dQIupAgaIukMQ3PjGxdVb05rUQidZJLfEsWHqqI2kIVS9FZ9gluGrTgEcug7lATfQY1MrhbqVhMitgpTIu8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4771
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



On 8/14/2026 12:12 AM, Daniele Ceraolo Spurio wrote:
> 
> 
> On 8/13/2026 12:46 PM, Michal Wajdeczko wrote:
>>
>> On 8/13/2026 8:37 PM, Rodrigo Vivi wrote:
>>> On Wed, Aug 12, 2026 at 09:14:46PM +0200, Michal Wajdeczko wrote:
>>>> Report 'Unsuccessful response' error using xe_log_err() helper.
>>>>
>>>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>>> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>>>> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
>>>> Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>>>> ---
>>>> v2: rebased (Michal) reword message (Mallesh)
>>>> ---
>>>>   drivers/gpu/drm/xe/xe_pagefault.c | 4 ++--
>>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
>>>> index 7e829c61387f..eb600c466187 100644
>>>> --- a/drivers/gpu/drm/xe/xe_pagefault.c
>>>> +++ b/drivers/gpu/drm/xe/xe_pagefault.c
>>>> @@ -14,6 +14,7 @@
>>>>   #include "xe_gt_types.h"
>>>>   #include "xe_gt_stats.h"
>>>>   #include "xe_hw_engine.h"
>>>> +#include "xe_log.h"
>>>>   #include "xe_pagefault.h"
>>>>   #include "xe_pagefault_types.h"
>>>>   #include "xe_svm.h"
>>>> @@ -625,8 +626,7 @@ static void xe_pagefault_queue_work(struct work_struct *w)
>>>>                   xe_pagefault_save_to_vm(gt_to_xe(gt), pf);
>>>>                   xe_pagefault_cache_start_invalidate(cache_start);
>>>>                   xe_pagefault_print(pf);
>>>> -                xe_gt_info(pf->gt, "Fault response: Unsuccessful %pe\n",
>>>> -                       ERR_PTR(err));
>>>> +                xe_log_err(pf->gt, PAGEFAULT, err, "Unsuccessful response\n");
>>> I'm wondering if we should really go from info to err here...
>> my question was different:
>>     "why this err is only reported as info level?"
>> as once we hit this condition we also print large dump
>> (see xe_pagefault_print) likely for debug/diagnostics
>> so it seems important
> 
> drive-by comment, but AFAIU this error can be intentionally triggered by UMD by simply accessing an invalid PPGTT address (see e.g. xe_exec_fault_mode@invalid-va), and we usually avoid using error-level logs for something that UMD can cause on demand.

thanks for explanation! 

so we have two choices here:

1) drop this patch completely, or
2) switch to SIGID reporting with INFO severity

but currently xe_log_info() does not take an 'err' parameter
so we will not print the actual error code as it is today

so we have two more choices:

a) update xe_log_info() macro to accept 'err', or
b) add new xe_log_err_info() macro that takes 'err'
   but it will still use CPER_SEV_INFO severity

I'm in favor for 2) + b)

> 
> Daniele
> 
>>
>> @Matthew, comments?
>>
>>> Why not staying with xe_log_info or now?
>> I can change that for xe_log_info, but then (by design)
>> we will not print an error
>>
>>> But also, why err and not ERR_PTR(err)?
>> patch 10/32 [1] introduced helpers that take just errno
>> value and convert that into data { ERR_PTR(err), 0 } pair
>>
>> [1] https://patchwork.freedesktop.org/patch/745993/?series=171022&rev=4
>>
>>>>               } else {
>>>>                   xe_gt_stats_incr(pf->gt, XE_GT_STATS_ID_INVALID_PREFETCH_PAGEFAULT_COUNT, 1);
>>>>                   xe_gt_dbg(pf->gt, "Prefetch Fault response: Unsuccessful %pe\n",
>>>> -- 
>>>> 2.47.1
>>>>
> 

