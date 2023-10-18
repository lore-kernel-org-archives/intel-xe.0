Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADEEACDB47E
	for <intel-xe@archiver.kernel.org>; Wed, 18 Oct 2023 16:54:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D56E10E1A0;
	Wed, 18 Oct 2023 16:54:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC27E10E1A0
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Oct 2023 16:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697648089; x=1729184089;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=/6o1LQp+HtR1LYfP/VerluiLgy79d1hRtzfwHmOJJkU=;
 b=KBiwN4hA0jYtUbaHbngWTF5rtO5feELKNZxahTXEXZiiJnhC57WWjnuD
 DfaNjMXuQsM1pqCKS2+S3IolmMzV38mZNsRYy1KIx2uTTPodiNrPDmZTY
 PTU+en34p6mY4M4BUHwtdnMkTIhyVDITcaDU8gK9JecIVdr0vMcJjvHUA
 t8TcRbU+2A+o6g4Z+dAqH9DCXfo//inlnNYN+pYIhuYnd0y/1DdZ94wIk
 J/ig06n3Hu6TZQRz7eCFoIGL7UJoGNkQhZgZyAUgkJZ8oLJDUCgRzGM4b
 /DA+J4ISc9wRnGfADMHqGR10tojVIovi9DaVFvS7BLDUVmLdzU43tcC7v A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="7608675"
X-IronPort-AV: E=Sophos;i="6.03,235,1694761200"; 
   d="scan'208";a="7608675"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2023 09:54:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="706525889"
X-IronPort-AV: E=Sophos;i="6.03,235,1694761200"; d="scan'208";a="706525889"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Oct 2023 09:54:36 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 18 Oct 2023 09:54:33 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 18 Oct 2023 09:54:33 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 18 Oct 2023 09:54:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LkJh2iyFCT38/D7/gnMRxXALo7LATaZG62H3wBXvOYTmMdqmr3jMf+ssuBtGOgQFuzrgBUQbXLbZ6rJE2I9DKjqi9/5EWcrVaXeDqtg3RGnLwiMx2W/4KzoHE14Wzsv6V0v/bV0orOXs/EBoH/9vceJApLnau7tJJj0rIuqvDp8TcEa1rWFM8Tipjn0CuysKyDJW6f/NP38uJWniFV5ryzlbZGaPv4SFj7SqBByAkVS9376gIO+pLBUjYQK0egwUec+HACtTPVJ2CovOKqZqthvLqHpq0OdOi5asmYT0t7uEujI1iKqFXrfaxGSKSaEuIH2FbvEbSAiVYlfTd96wbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r0IQ0cWdWu5nD0fGNEyAK4fih2c9Z/KnIF9lHmm9k9M=;
 b=M1oHEgEv/OzKRSP369aqS3ofhJDyu2yCsRg5ootDvDxfKlZO7JE433OjHOtMvOQxy0KXPZYI90Zz1+PbLC+KukV5ds4vgDAo97eyRkE72hokTW3SdA1oC2eLtENwPOLY3EVvF6ADx/VNEFfHoxLiCw4haJqljZ1IqZyJw5WsyAjuzqNCPE+XvvtliIVstQxN72i6AoZD6B8n2igKPNlXiPR//q3dUgIlZs585nxtN8caaHwar3M/hg6ND9IYFngMRxYvvuAKP04WAOUI0Fr8ULVrkRGzBNl0EOqZ4cjWzXJapIpz+FMdZTNr8d/EBIbigNySWjw591gyTQ8sYuhjAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA3PR11MB8003.namprd11.prod.outlook.com (2603:10b6:806:2f7::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36; Wed, 18 Oct
 2023 16:54:29 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::c228:5055:b7da:d0bf]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::c228:5055:b7da:d0bf%6]) with mapi id 15.20.6907.021; Wed, 18 Oct 2023
 16:54:28 +0000
Date: Wed, 18 Oct 2023 11:54:34 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
Message-ID: <hei43mlosgjrz6s6zrzsi73haxndlwm2s46uxy2sv5be76xroc@c33rolrzaulg>
References: <20231018115826.3908905-1-michal.winiarski@intel.com>
 <20231018115826.3908905-3-michal.winiarski@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231018115826.3908905-3-michal.winiarski@intel.com>
X-ClientProxiedBy: SJ0PR05CA0072.namprd05.prod.outlook.com
 (2603:10b6:a03:332::17) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA3PR11MB8003:EE_
X-MS-Office365-Filtering-Correlation-Id: f8e4cc37-74dd-42ad-29dc-08dbcffae486
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +TYAyB8H5jSXCdtAsj9mCepfHuBqW/+Zq2H3ZCUqdY3DZ52o7JV545tw2ffBKEe9UPqIvPUfqJDLmjkrOlBqpI4WuSn41M0HiEQesVrYFUTmlcKFb1yMxrhSck7IiB/cg1lwkuT40+IX3dq1mmLbPRjmVlz3QubuVZ0qAdS0J75EyHUDcCrO0wa9lLY7K0zUpxYLzOOZ4cYhtwo+1UTdYQtWcOV3e9map3waA5eKGKkBOHdfR7QxRkraRnQrJ8QRpJ42/lIC2kaSp+EuUpr8kVlUKlylCeIMArOuuEMX3toN+iOc1uIsP22dCRZSRcuzYzB3SD1YmhRLVz/hsSILwERNOs3Zd4tQhVcmyqfYh8cBx8WJJ1n1tZZDTZq5IgV3+e/d0T+fNw/jnRIitSo3GB8VaqoDjGo7IJH+U8gJQTGsY7LZ+geV6AMYZ5nRs243kZT1wr0UWTz0BBC9BAaXDBOa9iGaijS2MV5oZu0jeQgwZJhQR8OCVJx1TkYq+49pO7mv0d16hBDo4pAaTFZClXVuIiPg8GH+JZKfNjrZYgxZUiU2roWt0EVCPo0lCieL
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(366004)(346002)(136003)(376002)(396003)(39860400002)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(6512007)(66476007)(6486002)(66946007)(6636002)(478600001)(66556008)(316002)(6666004)(82960400001)(38100700002)(86362001)(6506007)(4326008)(33716001)(26005)(9686003)(8936002)(41300700001)(5660300002)(2906002)(8676002)(6862004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WlU2VW14WWJpbDZBVThjdTF2dUk2KzkwRExPZW5EMjUxM1dodUxtSlFrTHlM?=
 =?utf-8?B?MXp0RjVzbm5DYk5jcGROU0V4aXhiZlp5OEJTcmsvTDRDQW9RWWdpT3FwdU0v?=
 =?utf-8?B?UTloT2tkbWVGRk1pWjBJRXJSUDdFZHBHc3ViMG1aTHFWczRUa3VPQ0hNMThu?=
 =?utf-8?B?M2QzbXJ4K1ZLaW4rMzg2anlZK1oreVFyQTFYL0lvNEI4Yk0vbFhqdGZlVnpn?=
 =?utf-8?B?azVWOW9ZSlJyN0tFTlArWUhJZDlrcHRURDk2REFzN3R5ZUFPMWprY1BYcjJ3?=
 =?utf-8?B?RzdWcFhmOVRjd3cyajhpVHhoUnBCRG9ZYVJiZVk0ZzJIS29lNml1aTZqR3ZD?=
 =?utf-8?B?T0JWMWV3bWhuNkNvYmU2Y2ZjNmRndUdES0NjUzNYV2ZCMEpERGdRUFQvQ2JK?=
 =?utf-8?B?ZVQzeTlWck12aXZFMW1kTzh1U1VVMFg0NS9UUFBkOWx1eE9UUWRtTkpBd1dl?=
 =?utf-8?B?eTJEVVY2TnVTZkFQK0p0cERoM1ZvejJVTTVPV3FaRUZ0ZVV3ajRRbkFDL3pp?=
 =?utf-8?B?NWZ3eGpLTVZHMFBlYjkrcllXWTRPRDVkWHhUVDN2ZHBmQ2pMdW94ekVSc2dM?=
 =?utf-8?B?YTVhalYzelhMeGM5NHR0LzQxZTcvOFlVL2tpcW1QRnVzNkpxZzVpZldnQ1lE?=
 =?utf-8?B?Tnk0ektqT2FEMVJkRjJUNFBHNGEyYTdzUEpxQlhXaElNR3JWT3I5Q3BSaUpl?=
 =?utf-8?B?UmtjTG1VVjhpakZOcHJOOWoxNlhndW1PZ25Nb2ppczc3VHVPdEx0blI2SlFk?=
 =?utf-8?B?aXVBdWI0aE1WZUQ5cVZSbytiZlJsbllFYnFqd2tPZSszam1Ma2NyK2pqMVZP?=
 =?utf-8?B?WHZEUHh6Y2k2WHNnVXdCKzNYTmpkQ3Btd0hJNDhFanRUMjlNNjl1Tjg0MEFp?=
 =?utf-8?B?dERUVGk4RDhFTE1qcjFRaUw4Q1RDbXVhK3hSY011ZkVKV0Z2c2l5TWYrTWlE?=
 =?utf-8?B?MjczZ21qeGtjM1hLZkZZa0Rab2d6V1pmNy9ONWRLQjF2cENERVhveTZxYUpX?=
 =?utf-8?B?VUk3WVdHcm5iQVEzV1Q2U2tJQmovRkgyYTNaOEpENHhjVzRETGFFbDFOTXRs?=
 =?utf-8?B?dExmWTMvaXVPTGRTRU95SlVxT01yMzVHekNzZTI4enhRQzZzUC9EME5hWnV3?=
 =?utf-8?B?Rmgxa3NEVEZ6RkJRU1NMK1JQV3B5aERxdnZtMGJCaGs2Mmc1RWpWMWVLUXhu?=
 =?utf-8?B?ZU9TdSt1WXk2dVphZjRpa2JMM3htK09nbTFOOU0yQnZBTjllSy9oRStYY3VD?=
 =?utf-8?B?UmJsT1ozUUhnQzdDWW8wMDFSNkk2QzJhaERKckQ1bVU5dGEvTU5iY2t0UmhO?=
 =?utf-8?B?NnhMSk5NNXFlWDEzeTJQRlFZREozbGlTOXVrQ2hoTUIzZTNDK3BZdFkyVEMw?=
 =?utf-8?B?bUh5QmgvaXhSWkVQY1JDZ1ZuZXV0WEU5NkhkTHFpQzFqNDlsMUJYZzFuYmM1?=
 =?utf-8?B?S1VSUS9oVWtUQkNXUnRWWmFFbjlNZ0J6UHZ1cTh5MUdsalZrNldiOE5MQ004?=
 =?utf-8?B?LzRUSS9XZXJGb3QzVzRBYnhhUjVVMFI2dWk1dXNPbTdCMENiVHNjeHdNdUJj?=
 =?utf-8?B?SlJKSG8rN2FPT2I2Vzd6b1Q1VURkQnU0bEhaSGFNVUZnSEpZOCtCbVFkdGZQ?=
 =?utf-8?B?NjI2d0o4MG9NT08zRVRBMnNNQ0c2MzZNOGZ1ZFNVZmFxZWdCc0dwanZpbGFY?=
 =?utf-8?B?SVlTV2NVYWJ3L2F5RytzUWFOcU1LeWVhQnduYm5GcHpid29XK2hhZ1hHai9M?=
 =?utf-8?B?YUtpYzUvVWVrOEV5QWNNQ1dwL0xMWW15T3IzM2kzTFBCbnFHeHExWGEwM1ZQ?=
 =?utf-8?B?S3FiQ2pVODQrUUdGRHFqWWFUU3RiS0NmbmpIbFc1aVJxdWQ2TDRGTXBkcTBS?=
 =?utf-8?B?OU9jNTErVXViZXJIdjNTblp5SzhuNjlMQzdDVlR3cHNTbjNFbzZ5UVZ5bGRv?=
 =?utf-8?B?bVRiWFhCSWF0UE85cUE2NDY3Z2hlOEdPQ3B5ZXZJVE04K052ZUcrR1hHN0Vr?=
 =?utf-8?B?TjVlMi9HS1pDSlpwUU81Znk2V21MZ3BxZmNrclQxUFBaU0NkajArRTZTc0hu?=
 =?utf-8?B?WFB2OVRpMjE3SlJsQXJxTjFHWXVpS212U2VFWnQ1YzBiNVMzNWp0UFBJYktq?=
 =?utf-8?B?eldIYkQzN2hWVlllTElmSlNqMVpQa1U1MlFydXdCWm9QMVNnT2M4VHJGdkdy?=
 =?utf-8?B?RlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f8e4cc37-74dd-42ad-29dc-08dbcffae486
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2023 16:54:28.8929 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3SPc2CFEZ2S+svRRvQkf2gcThkitGo+tONIPgRUhTOUiPD4YomPvIgmGIj++elerSYx3bI/hGYV8L3vE4C2YP3RrPVC22qkN0A3AulP4Jfs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8003
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/3] drm/i915: Fix uninitialized variable
 warning
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Oct 18, 2023 at 01:58:25PM +0200, Michał Winiarski wrote:
>When used with Xe, "val" uses as function argument name clashes with
>"val" used inside iosys_map_* macro causing the build to fail with:
>
>drivers/gpu/drm/i915/display/intel_dsb.c:87:46: error: variable 'val' is uninitialized when used within its own initialization [-Werror,-Wuninitialized]
>
>Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>

I'd rather change the macro so it doesn't use a commonly-used variable
name. I usually use a _ suffix on macro arguments because of that.

I should had done that in commit e62f25e8b3cd ("iosys-map: Add a few more helpers")

wouldn't this be better?

diff --git a/include/linux/iosys-map.h b/include/linux/iosys-map.h
index 1b06d074ade0..78b3856c475a 100644
--- a/include/linux/iosys-map.h
+++ b/include/linux/iosys-map.h
@@ -414,11 +414,11 @@ static inline void iosys_map_memset(struct iosys_map *dst, size_t offset,
   * supported), use iosys_map_memcpy_to()
   */
  #define iosys_map_wr(map__, offset__, type__, val__) ({				\
-	type__ val = (val__);							\
+	type__ val_ = (val__);							\
  	if ((map__)->is_iomem) {						\
-		__iosys_map_wr_io(val, (map__)->vaddr_iomem + (offset__), type__);\
+		__iosys_map_wr_io(val_, (map__)->vaddr_iomem + (offset__), type__);\
  	} else {								\
-		__iosys_map_wr_sys(val, (map__)->vaddr + (offset__), type__);	\
+		__iosys_map_wr_sys(val_, (map__)->vaddr + (offset__), type__);	\
  	}									\
  })
