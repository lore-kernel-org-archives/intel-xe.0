Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3A95109C05D
	for <intel-xe@archiver.kernel.org>; Wed, 25 Mar 2026 21:47:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A018010E194;
	Wed, 25 Mar 2026 21:47:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QjFA+4Mz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4503010E194
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Mar 2026 21:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774475241; x=1806011241;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=uz5TwPrHoBlzMVl+RZmdNymNIyfLAzo0zLW2E1rbC4g=;
 b=QjFA+4MzNpbQmBGaDU29mp9Kquv9y0o0wgoZCRVGLmQy8UM+PD3lUfHe
 J+GpfCEOZPIGM6g3ZrlQtP5VJTxBdFlbRet1uaY1TStZ2q+tbTlo4GKtV
 lP+ecU1KRZEY5JsTetfTwUQ3PJNaAPyqe3k73rXZm8reNXsLEpOkcYgQH
 wm5U09KB2dpXED41n+ff/E27V7rhH37vqnchsYLud7i/XwxoZkvCjz1Qm
 aWLKTcUZux5V1dG11nzyqrlvfFohxdQTA17B9d+ogiCAji4W9K8Ua0GO0
 MYLdy3RfLP43WU2dt+1yRnGc2kvvFRcq9FYc5YG8wg4sYAHLp+csDirWl A==;
X-CSE-ConnectionGUID: DI5kZIAwT9KRgCnyO+HYbA==
X-CSE-MsgGUID: 4pDSd5pdQ4OGZd0/Tr4J4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="92903166"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; d="scan'208";a="92903166"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 14:47:20 -0700
X-CSE-ConnectionGUID: SXvsTs3lRSG611ik4Q7QXA==
X-CSE-MsgGUID: nTrRSSPKSlWD5qdu2MZXNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; d="scan'208";a="221480984"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 14:47:20 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 25 Mar 2026 14:47:20 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 25 Mar 2026 14:47:20 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.53)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 25 Mar 2026 14:47:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DRfP6FNJuzd9m+6rtrIRskaeEOP82ql2MkKy96lJJNCUsJv467eyfYb5ecs9LUwSqiWjQtZoYQadl9dlj7M2oipszxkIMyUkR3XHcWpZ9w8YiXobTxMF7BRjnwhlIEnNXkpfapHWQdTqd5pc8D3XXKbjvNy0ty2kOgFLXbdH1ScVynVm9b3eCAT7sW4g/aHVgsnz3VaIj9k2nh4/sb0RgXr8oJCKUXpzFAnTkudBPxTV1cUxIZ7ulWyM3KGGxlyqkpXu52Sdoa//ytPg6K4ihNwGyhzU6QEBPMIJ5Fc2T97WwJutswpQOE4dA/bzIXkIr0QBlLNyuHKjB18K+umCJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=elz7D37a3ZiLAXRZlHwCyxY51A/9P6yZ/J5c0jvhHCM=;
 b=af6fSQeQOnBmhFOepQfgGKg2hhP9HSG3a6TasAzNwspmbZIv0fZ0ojCH957+TwV3L/uSl4dd2k3aMEAE0fGj+P0JNM9oCFnyP/lGJeKGqPe7SNO+TnW1FrOny6gBUIzvaqPOaxur8L4rqzFIBVEJ1Y7E0Ey3dk+zNas+MXxAH7WODY+6MYyMXf2IUOM6b6/f8CCUrEuqOUnoR3Bwsj6JG5uGxz1NhZB3gIhTfJ6UtCdHUsHWYGzHW3oFBp4JG9D94BLLTfGhS20UaBMYs1gYcZMqvwIpXq1Dl9r/t5ubqBnEHB7m7ILBoSaMMeLIcTDJBixfj49kXMW70fEg8A+emQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6519.namprd11.prod.outlook.com (2603:10b6:8:d1::5) by
 IA0PR11MB7861.namprd11.prod.outlook.com (2603:10b6:208:3de::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 21:47:16 +0000
Received: from DS0PR11MB6519.namprd11.prod.outlook.com
 ([fe80::c336:8ed1:4b09:4414]) by DS0PR11MB6519.namprd11.prod.outlook.com
 ([fe80::c336:8ed1:4b09:4414%3]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 21:47:16 +0000
Date: Wed, 25 Mar 2026 14:47:14 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>
Subject: Re: [PATCH] drm/xe: Always invalidate TLBs on userptr invalidation
Message-ID: <acRX4oSHxMJ09yUA@gsse-cloud1>
References: <20260323211743.285064-1-stuart.summers@intel.com>
 <acH1IT6MBYvSf2GH@lstrano-desk.jf.intel.com>
 <0e9794ab3a16896d0790289750f56538602798e6.camel@intel.com>
 <dbde50462394e808b4de52974f9c7c086191e35a.camel@intel.com>
 <acMj9+JZ2ONGa1yH@lstrano-desk.jf.intel.com>
 <b62e8f960ccab92bcd045627e77a6d0d14c5cb18.camel@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b62e8f960ccab92bcd045627e77a6d0d14c5cb18.camel@intel.com>
X-ClientProxiedBy: MW4PR04CA0141.namprd04.prod.outlook.com
 (2603:10b6:303:84::26) To DS0PR11MB6519.namprd11.prod.outlook.com
 (2603:10b6:8:d1::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6519:EE_|IA0PR11MB7861:EE_
X-MS-Office365-Filtering-Correlation-Id: bd3bc5e1-c72d-4180-076e-08de8ab81500
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: 604d+LjS4WyZx1qj5rrBbOh+SfFEvnqni5YsXtla7xSMz5fi2Tx7nN7WSocYmt6l90lwmXnAZtqiLYblQroKbTguK/8HZue8tzeXbY65sYPw1K7fa5D6HaY4WWZdicb0IxGrvnmfgcz5jL4G2UpO+GpMlcffo8LxtX44/S4l6OCTGCgHZkCDlLyynZsYFrxVoXCYxIWX30KylPDVt3xxvXw0+quClcgEAK6yxbK/aKMRpepDfPeBxE4zc0HjshnS/Slb5NBnuKon6O2OMC2uYYZj0Yh0H84wBQmWPoCmNxV5f3Z9zFwxkZqzShwrkk6xfS58RrBU8lr/+b/i/hZF8WAj7UmQCshx4VFy2jTeHLuxhW+mqv0eIRWImlFRdqulXMrNzUdQBOdO2yEjXRkU2ltteNkoRJlJVZj637xmns3+sGSS04dhBRryFUOcIF7KcWbLBnHvyPas+Dmcg0FCAy99ec/SmmWg7cl5I2Xi/a7Pyb5dGAf8Aw0VcDHrBjbjFlO/czNQ8SbgN0x6F00laV/t6871P3IjAW+Io3NAUbqwKbS5EIY+20jy9QrvJDk5ZufrWQM/zGp3Ab6MJviQbaPxotBkTNYvv426ulkddB1gCYnvjuNmvQmK3n8mFj099fXTkf5MAeHHY3XK+k2STrBGyeY4uHdhboxYakE809cSwzSSEwyUtyp3HbFc8+jw
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6519.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z241NHliVitYSXJFYUJxL08vNjdldUg0R1lCaTF2a1FZM0dsekgweGk2S2xh?=
 =?utf-8?B?M2FTYm0wZWFGbC9CWTUwWjNMU3paY3hVM2Mwekx1SUxqdWpid0pZOTUrbUZo?=
 =?utf-8?B?UVNId1dPT2NlYitubCt3RW1kQkZtWVlsRGhEdUdXeERZMksxa1BCa0lxVGh0?=
 =?utf-8?B?N1MzUjdDeVpRYVcwVDZxb1laOGZXcXRhRTVJQis3dElyWDg2d2JRUGFNUEVE?=
 =?utf-8?B?akpDNnNhemJzUmNOSElZTmRsZG9NbW9idnovMmo5eER2ajZWdG50THFMaCs3?=
 =?utf-8?B?VjNKajdLbFRYRHA0bU13Ymg0OFpSN0FTdzNBa3VCOE1yZG9HTkJCV3hnNGRX?=
 =?utf-8?B?UUxvSHYwczgzSlFwalVaeFlVQ2dYVm9IRzBXREpMTU9selJHMXJISGVCOFQ3?=
 =?utf-8?B?UUo5TnRZemxKN3FPbFRPeVQ2OHFJbm15YWNGTjZtZzZPSDI3OExqaXFoYjM2?=
 =?utf-8?B?MmhCSy91ZmVRbWxYM3FqVVdGOHBORytMSkxjT0NyNlZmaXhGd0I0ZW51T092?=
 =?utf-8?B?UWk4R3hzZXVRQmtBL05VK3JVQWI5S3FjdjFGVTdMY3pUWmRHc1pqOUZKR3lD?=
 =?utf-8?B?NmlnZG9ocS9DZ0ZYNmVYQ3NGSGZ1aFc2SG5tTWx2VVhlTWZTYmEvcUhtY2t5?=
 =?utf-8?B?TW1vbFRsWERFV1pYOXN3Q1pUaHFTU21jR212MVAyek5vWkpDdjZVV29pTWc5?=
 =?utf-8?B?emNxaGVHRUJodlllMGR1ZUw1ZHZkRkhxdk9pMUVzR0x4bDNBREh1cC9ldVo2?=
 =?utf-8?B?bFIrSU10RDRJaHJXZ1diMlhZNnByckZBeEdEMzhFK2lyQVFTZldyU09CQ3BP?=
 =?utf-8?B?U2VPWWt1bmc3N3FDVThGUFNtUG1SM2lIKzE5Z3AwL1oxWW1hb2cvSU16ODEy?=
 =?utf-8?B?K3Q3dmo2RUlhcHU2dTF3Ujd5QWE4OGtpaXl6MnI0b0xuYnBEZlBvdEV4YW5O?=
 =?utf-8?B?ZGZ3N24xKzl5OGs4SmJXM2NPc1ZLbGxXY1NuYnoxSDVnMngvaXMvRlBiT3BM?=
 =?utf-8?B?czVOa0hLWDgrOUdnZ1ZMYlhGZDZpMUlyZHlkZDZzRURMMkFnWXhwZStWSFlk?=
 =?utf-8?B?Q2VCVm5Mb3h4UmNBeHRzaW1FSVh4Q0hxeUozcXFDN1BXcGdlZTFLM21PdzY2?=
 =?utf-8?B?QnpvbktrQVMxNFFWU3B1OS9FSzFWenR4MnZ4d2hqelBMZWdvaVdObU9vVmxH?=
 =?utf-8?B?TkxML1djRkNxMUNHYlF5MDlWQllidUtNWlltL2V3SWx0Y2cyZWd6a2pJTVdo?=
 =?utf-8?B?QUtweTllaEo3b2ZoUXMvQWlFVUdYS3ZGTGNJc1lBUmxtU2xBOTdEejd6OTZs?=
 =?utf-8?B?Zm1uUERxT3lUT21tcXBKeHF6SVA2cUl1aWdpUHlQZG9QOHdQSCsrM3Q5eXIr?=
 =?utf-8?B?Y2w5NTY4ZzAwMlFDV1hkRml1ZmZTWnZyOGIxNittbitIZEt5UVMwLzJDTXJD?=
 =?utf-8?B?Ny85ajFEOXFqcTRXbGtTVmhjcXZINklYV3FuUHlpN1JjRjdiZlpaWnd3ZHR3?=
 =?utf-8?B?c1d2VTZIbVo3ZXNtcDl3YnFiTjJ5UmZFUHdjYk1wT0J4K3FybDNRMG1CUzRk?=
 =?utf-8?B?dkdnRnByalhEcUVIWTZhY3lnOEFndFQ5U2p2dnhFQUdxSUMyU1NrWGgveXFo?=
 =?utf-8?B?a3U2eERHb2hwM0JhRVdvQnY5RUNOQWNYNlQwNEJVYVZxS3NuTVM2cjJPbi9v?=
 =?utf-8?B?ZnpOeE9KbFRyM3FvbURUU2NXc1JQZ2lZbFFUVHBDR1BkeHdBWW51Qzl1Sm01?=
 =?utf-8?B?MzdHN1NUVi9KVVhyVW90UnJHdE5tMGlNR3pGNDNrdUtVRlluS3dna1YzbGJi?=
 =?utf-8?B?aE55ZkhHN0Y5dFRHQXRNdFArRkVBN0NGLy9xbW16VzlscnlsZWt3SmU0dWlK?=
 =?utf-8?B?SXp6UjRrWWhSdU9ybS9UV3ZaY0lIZ0NIS2EyRDk5Y3BqdmF5QWlVSW1aclNZ?=
 =?utf-8?B?Ty82TjRDNkc1ZlZJeCs1bzNnLzJBRlV6MERoVlJKMlcySmJ4b2R3RGJycVNL?=
 =?utf-8?B?QmlyM2EzVGNETjVKb0FMTVdIcDd0QzlwbzQ5WEViNHEwSllhaG5RTVlGKzd1?=
 =?utf-8?B?cDFabU82cHcwVmxLOTZISkJEWk5TcGVxU3c3VTFRRnZNY0lrMFBKR1U1MWh5?=
 =?utf-8?B?emFVcTMyaG40QUZkNTNjUGd2SHRheFpkZEhHQk8yZ1ZpS3hKRzNjUXQ1YkRu?=
 =?utf-8?B?NmNVcjYxa1I3L1RRY0tCVUQyVkZuTjBaZVZDQklscCthVGFmdngvRndYMERn?=
 =?utf-8?B?U0JIajBJZ2k3Zm03dVp1MXhxUDE3S3Q0UVMwMGlRL1I4Z0hPeDRvNldmeTNZ?=
 =?utf-8?B?ZXBnalhjSzVHdDFJR25JMklhL2lvUkdCdWM3dDhtNU1tTTFEK05GQT09?=
X-Exchange-RoutingPolicyChecked: cgDQgIUBxiegj4bLbxZkHyUugqGi2JxjuJlT5aLaFkSADahNSJPDs1fqDuQRzSnwWGizVyeUUANRWfldcTh231acLP2uY9rIof9Re4tkeehL/8VdAAnBBjlyFEmxNouXk/VSNmhhLqSH8xyy6PliYk3EkDRLFU3Lqrxz2zrFyGyzuy3Jn08zknRBOoC/FzSJPd0LqR4XpZywKl8+HOlFMm4aYP/AsRitF1wGSMeBc4cbd8e7klA/NhNPE00POGXeZtEf2sS3hJwFgoPaU8BGsw9iHDPJuG+bq+KvdDN9UjUHweAP7ubZd5ixZquQN3QP3P//iVHlurHCW1ByFq+z9w==
X-MS-Exchange-CrossTenant-Network-Message-Id: bd3bc5e1-c72d-4180-076e-08de8ab81500
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6519.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 21:47:16.6167 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yv6pxqoReR9DCNTvBfHlQeT6p3UddaaA/MgvkdzS55/aHaxD4ra9zzthqbJTTG7UpTXA7KQRyvl/6r6Pbw8MJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7861
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

On Wed, Mar 25, 2026 at 02:35:26PM -0600, Summers, Stuart wrote:
> On Tue, 2026-03-24 at 16:53 -0700, Matthew Brost wrote:
> > On Tue, Mar 24, 2026 at 03:51:18PM -0600, Summers, Stuart wrote:
> > > On Tue, 2026-03-24 at 14:53 +0000, Summers, Stuart wrote:
> > > > On Mon, 2026-03-23 at 19:21 -0700, Matthew Brost wrote:
> > > > > On Mon, Mar 23, 2026 at 09:17:42PM +0000, Stuart Summers wrote:
> > > > > > Right now we are only invalidating TLBs when we are
> > > > > > running in fault mode. For non-fault mode based userptr
> > > > > > VMs, we then rely on context switches after an MMAP has
> > > > > > happened to ensure the TLB is clean for the next submission.
> > > > > > 
> > > > > > With context based TLB invalidation, we can no longer rely
> > > > > > on the implicit invalidation happening during context switch,
> > > > > > so remove the fault mode limiter and simply always perform
> > > > > > that invalidation.
> > > > > > 
> > > > > > I was able to see this behavior using the following test:
> > > > > > xe_exec_compute_mode --r twice-userptr-invalidate
> > > > > > 
> > > > > 
> > > > > Hmm, this implies that preempt fences don't issue a TLB
> > > > > invalidation...
> > > > > I thought we landed on preempt fences do a TLB invalidation in
> > > > > offline
> > > > > discussions.
> > > > 
> > > > So initially I was mostly focused on the xe_vm invalidate cases.
> > > > In
> > > > hindsight I should have done a little more focused testing here
> > > > as
> > > > well. This came up after some more extensive testing internally.
> > > > 
> > > > At least in my latest round of testing, I don't see any issues in
> > > > BAT/FULL after this change. I do think getting this merged (or
> > > > something similar) and tested more broadly would be interesting.
> > > > 
> > > > > 
> > > > > We may have more work to do here wrt context based TLB
> > > > > invalidations.
> > > > > 
> > > > > I think BO move path likely also needs to be updated then too.
> > > > 
> > > > Hm.. I haven't seen any issues on the BO side, although it's
> > > > possible
> > > > I've missed something in testing of course (like this LR case).
> > > > I'd
> > 
> > You'd only hit those cases if you run an eviction test.
> 
> Ok I'm manually running through some of these now and I don't see any
> issues so far (evict-small at least). 
> 

Try an evict-cm* test, but looking at it now, that probably won’t catch
the issues either.

Our eviction tests just aren’t very good — far from my finest work.
Looking at xe_evict.c, each BO is only touched once by the GPU. What
really needs to happen is multiple touches: the TLB should still
reference the old BO, it gets moved, and then we touch it again after it
moves back into place.

At one point I wrote a better eviction test [1], but it never got
merged. We could try to revive that one with this test case in mind. It
would need to be updated to run in preempt-fence mode and fault mode,
and I think we’d need to call touch_all_pages twice in the process
sections that trigger eviction. Also the way I VM bind addresses would
need to change too, as this version is using malloc and we found in
xe_exec_system_allocator that doesn't work.

[1] https://patchwork.freedesktop.org/patch/588613/?series=132251&rev=1

> > 
> > > > really like to get this tested more regularly in CI if possible
> > > > and
> > > > work through issues post merge. I think most of the remaining
> > > > issues,
> > > > if they come up, should be timing sensitive.
> > > > 
> > > > Also the fact that this isn't enabled in anything in xe_pci.c
> > > > right
> > > > now
> > > > means we shouldn't cause any major breakage otherwise for the
> > > > feature
> > > > generally. Of course this specific change impacts everyone using
> > > > preempt fence like you said. I could add a has_ctx_tlb_inval here
> > > > - I
> > > > had thought about that. But to me this seems like a more general
> > > > case
> > > > given the discussion we had about intent of explicit
> > > > invalidations.
> > 
> > I would add knob for context switch == TLB invalidation.
> 
> So basically if (fault_mode || has_ctx_tlb_inval)? I.e. is there a
> reason not to just tie has_ctx_tlb_inval and has_ctx_switch_inval (what
> you have below) together for now?
> 

I think it is fine to overload has_ctx_tlb_inval but maybe add some
kernel doc which indicates if has_ctx_tlb_inval == true, this implies
GPU context switches do not invalidate TLBs.

> > 
> > > > 
> > > > Anyway let me know what you think here.
> > > 
> > > Little more detail here on further analysis...
> > > 
> > > So I had found this through debug, but looking a little closer, I
> > > think
> > > the reason we need this is because of the xe_vm_rebind() function
> > > with
> > > these lines at the top:
> > > 
> > > if ((xe_vm_in_lr_mode(vm) && !rebind_worker)
> > > ||                       
> > >      list_empty(&vm-
> > > >rebind_list))                                    
> > >     return 0;
> > > 
> > > So basically if we aren't in preempt fence mode (lr_mode), we
> > > always
> > > invalidate the TLBs in ops_execute() called in the xe_vm_rebind()
> > > function later on. If we are in preempt fence mode, there is a
> > > corner
> > > case here it looks like where we call the preempt rebind worker
> > > that
> > > then calls xe_preempt_work_begin() -> xe_vm_validate_rebind() ->
> > > xe_vm_rebind(false) and hits the above case, causing us to skip the
> > > TLB
> > > invalidation. If we add the hook here, it forces invalidation for
> > 
> > Kinda, if you look at this comment in xe_pt.c:
> > 
> >                 /*
> >                  * If rebind, we have to invalidate TLB on !LR vms to
> > invalidate
> >                  * cached PTEs point to freed memory. On LR vms this
> > is done
> >                  * automatically when the context is re-enabled by
> > the rebind worker,
> >                  * or in fault mode it was invalidated on PTE
> > zapping.
> >                  *
> >                  * If !rebind, and scratch enabled VMs, there is a
> > chance the scratch
> >                  * PTE is already cached in the TLB so it needs to be
> > invalidated.
> >                  * On !LR VMs this is done in the ring ops preceding
> > a batch, but on
> >                  * LR, in particular on user-space batch buffer
> > chaining, it needs to
> >                  * be done here.
> >                  */
> >                 if ((!pt_op->rebind && xe_vm_has_scratch(vm) &&
> >                      xe_vm_in_lr_mode(vm)))
> >                         pt_update_ops->needs_invalidation = true;
> >                 else if (pt_op->rebind && !xe_vm_in_lr_mode(vm))
> >                         /* We bump also if batch_invalidate_tlb is
> > true */
> >                         vm->tlb_flush_seqno++;
> > 
> > We explicitly call out that we rely on “automatically when the the
> > context being re-enabled by the rebind worker”
> > 
> > So another option is to adjust this if statement to something like:
> > 
> > else if (pt_op->rebind && xe_vm_in_preempt_fence_mode(vm) &&
> > !context_switch_invalidation)
> >         pt_update_ops->needs_invalidation = true;
> > 
> > This would also cover the BO eviction case I mentioned above. Also
> > avoid
> > blocking in the notifier or BO evcition code on the TLB invalidation
> 
> Ok I get your point about the notifier path blocking vs the inval jobs
> we're creating in xe_pt.c...
> 

After the notifier runs (or a BO eviction) the code in xe_pt.c will
either execute from the exec IOCTL (dma-fence mode, vm->tlb_flush_seqno
covers this case), the rebind worker (preempt-fence mode, this new if
statement will invalidate TLBs), or a page fault (TLB already
invalidated in notifier or BO eviction in existing code as we don't have
any fences to wait on like the prior two modes).

Matt

> I'll give your change a try and let you know...
> 
> Thanks,
> Stuart
> 
> > which in general speeds up the entire kernel.
> > 
> > Matt
> > 
> > > lr_mode also.
> > > 
> > > We could just add this xe_vm_in_lr_mode() check here, but I still
> > > think
> > > doing this across the board is safest so we aren't hitting some
> > > other
> > > corner case in the future if we decide to rework those other
> > > scenarios.
> > > 
> > > Thanks,
> > > Stuart
> > > 
> > > > 
> > > > Thanks,
> > > > Stuart
> > > > 
> > > > >  
> > > > > > Signed-off-by: Stuart Summers <stuart.summers@intel.com>
> > > > > > ---
> > > > > >  drivers/gpu/drm/xe/xe_userptr.c | 2 +-
> > > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > > > 
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_userptr.c
> > > > > > b/drivers/gpu/drm/xe/xe_userptr.c
> > > > > > index 6761005c0b90..dfd679dd98d9 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_userptr.c
> > > > > > +++ b/drivers/gpu/drm/xe/xe_userptr.c
> > > > > > @@ -102,7 +102,7 @@ xe_vma_userptr_do_inval(struct xe_vm *vm,
> > > > > > struct xe_userptr_vma *uvma, bool is_d
> > > > > >                                     false,
> > > > > > MAX_SCHEDULE_TIMEOUT);
> > > > > >         XE_WARN_ON(err <= 0);
> > > > > >  
> > > > > > -       if (xe_vm_in_fault_mode(vm) && userptr->initial_bind)
> > > > > > {
> > > > > > +       if (userptr->initial_bind) {
> > > > > 
> > > > > Should be change this if statement based on hardware support?
> > > > > 
> > > > > Matt
> > > > > 
> > > > > >                 if (!userptr->finish_inuse) {
> > > > > >                         /*
> > > > > >                          * Defer the TLB wait to an extra
> > > > > > pass so
> > > > > > the caller
> > > > > > -- 
> > > > > > 2.43.0
> > > > > > 
> > > > 
> > > 
> 
