Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1EC9CCA470
	for <intel-xe@archiver.kernel.org>; Tue, 30 Sep 2025 12:39:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FA5E10E2B9;
	Tue, 30 Sep 2025 12:39:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JQwmjT+M";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B87F10E33A
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Sep 2025 12:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759235980; x=1790771980;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=dfEN6BIkKsYSgSv+kMbUgqbc8hhPzPAbGTsJ4OgPL5U=;
 b=JQwmjT+M31CYiPBqAPNzYpni0OEE9meGFqu6waxO+D3KmNE4+nupb0HP
 H/PTotAf2DPBKqaimRUMKNP/n54/bey9+61WmL0eiurEKwSh76taCQnc5
 UEt8pulqzVEJbLJt+BDOISHWZLtN+R/hmtoSlO4kRDJSls/jyWHgkX8jM
 3Yhj7CJ61T+is+M0pV3gXNfUKAjFsXjkh8bCttutTebnEL2dkehWYpmuV
 mx96nXTjS9/HAlrHpCgm1QUCPyL9x7rUuxWJBWsYXrxfsaBdMfPRfikeE
 xencO4/roAhuT5gAuN0lMJKR1piqcQFlK/ZUzOZ8CRqyPlGwMOc+xu0J+ w==;
X-CSE-ConnectionGUID: hMbIxikgQ46ejvqV8+Zu7w==
X-CSE-MsgGUID: YcJclkHyS8WoScvcW2dtQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="72915769"
X-IronPort-AV: E=Sophos;i="6.18,304,1751266800"; d="scan'208";a="72915769"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 05:39:40 -0700
X-CSE-ConnectionGUID: /uPHMpLgRTq1tczWumYnzg==
X-CSE-MsgGUID: 83pzlM2tTyOevKsx7le0/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,304,1751266800"; d="scan'208";a="209223478"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 05:39:39 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 30 Sep 2025 05:39:39 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 30 Sep 2025 05:39:39 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.3) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 30 Sep 2025 05:39:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aRAUTeVb1xXLAP6lTa/Jp95q4JMNSUaL0AeJB0eZljUgzGjgd4Lg83GKPYuwI440OJa3jF170qbv39tIOSaADLh2eWsA1jCXPXSA2A9nWaxcR+6NA5k7ZkLd8Ss7nb8F+iFt9EO59vx4LSFCwWDWrnthIgpPC6aNGcIIW0yW8aG59idDnKyV+ndVlKDbXmCsEgyuO2dpRQVBofN8ZYt4lgK2YDL5TJP2j7Bkm7bhIQL1bFZk1V3el9IMwJQc03XytW4TLL+HZJ04seFbbkf8hvmvqDTWtg21NXHGlPdzBpclmsRMm7NfPqk8hS7EkaNopRX59QUmH52RfUrJI3/slQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NaWqeSVR5ZnSjV+KKgRMUKyLJ5S46h7tYxGOroRNFik=;
 b=GwEcUfeAwod0WIdgAt2aPALTBqOow2lle+n8kNIOZ4Fa0DNuDbikZEVNjSMVRILx9fVzaWyhBiRDyqkobzCV/SroetrzvzejzoUdddgbku12aNudY84Dz9ZiNidqJi1hhM7rR72d+esE6zvgxO41hdYPngbeYZWyBj9a+U4KgHPAmxiPdZ8U8Zyw/Q2XP5gXSlPFlikrAx0nEpF31+/yQzOE6ANnuhoyI3TZNAFrcomSrg5ckwxuMfvGd9zBOFFafDZJU8FGM+PLRZEueUuELkTppe7cj0d8mGZS/VPPC1zlP+8HoJyJi1KLqSiIdROfa+ENHa9dODDAM7l16PIpiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB7681.namprd11.prod.outlook.com (2603:10b6:8:f0::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Tue, 30 Sep
 2025 12:39:36 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9160.014; Tue, 30 Sep 2025
 12:39:36 +0000
Date: Tue, 30 Sep 2025 05:39:34 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3 36/36] drm/xe/guc: Increase wait timeout to 2sec after
 BUSY reply from GuC
Message-ID: <aNvPhmgEhCpGSGW4@lstrano-desk.jf.intel.com>
References: <20250929025542.1486303-1-matthew.brost@intel.com>
 <20250929025542.1486303-37-matthew.brost@intel.com>
 <7caa086c-d90d-4ca8-ab1b-7241e9d8c0df@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <7caa086c-d90d-4ca8-ab1b-7241e9d8c0df@intel.com>
X-ClientProxiedBy: MW3PR06CA0017.namprd06.prod.outlook.com
 (2603:10b6:303:2a::22) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB7681:EE_
X-MS-Office365-Filtering-Correlation-Id: 21dc7920-4725-4e6f-686b-08de001e6a33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?yLUkrTbkX1txKm8TjuTE6C3JBYZFbYNBMtnrNbNiBJAqwj3k1h/pqcGC8LgA?=
 =?us-ascii?Q?xBpgLuVLOIgrWYBZmgRupzulq7iiXb/rZM3BboyKndNBA1dM365NVl+nK3yp?=
 =?us-ascii?Q?+EgVgGAboWaLEOyaTMWFr1GiWLtbtVQ+DR794wWwIxYMBTweOYgvHWlMeug0?=
 =?us-ascii?Q?Av2tc5EEgWjCoYCxQONruH+gvLaaYqPLeUXh3OUDoOcMhtbQ4I6oviJFGA1/?=
 =?us-ascii?Q?1RAxQOCZfEPQV0CzOYREz3iHkszTYkSRqTBMeBGwa72QxiN+bhg0m/z/c36A?=
 =?us-ascii?Q?8pUXQcbWURrWtZ7u7kz68Aj4ha1QaeirJBVo2Q9C5ocllXObWu5CCcY8jrK+?=
 =?us-ascii?Q?i6SyZ91/9MI9c1aF9qRB+HRX7GVo/tDtLsjZLvogxL2OrMF9h+J/sI3LhNIC?=
 =?us-ascii?Q?BVnN7znW9uBLgszgK2eud1pWohlxJMrjwwbiiH5O6Y5fACtQ32k0V1JipQaU?=
 =?us-ascii?Q?AshvuNrwOSI/NyuVXNRLJ5pdgFaFmd3rj7CAeDccBp+oOvJiktFhVWldxrYH?=
 =?us-ascii?Q?tsTmg8Vc4oBpIsW6+KLHzc3/EmI1wYS9F+OKWO4lXQrICuLbm/uF8Bpol9G3?=
 =?us-ascii?Q?ra8TgBvSYM27GElfpgmCD6GoXjwuavfeH0PwgqBHHahrkWyWJyA/bXkEvOzX?=
 =?us-ascii?Q?Yx9DilssYN2yfz6o+jSDGgq4umExwUtrQe5iedhnzRJGRsXGTeTMzZwRBLqj?=
 =?us-ascii?Q?ppUrvCrBIqWNGxPwH+U3GIGaR4G6J9O5yxDAQvLyss5SAyRh/uxqb3QHLvKo?=
 =?us-ascii?Q?sJQxjZ2DyMnhkdKsRd5FntlZq4Jezqjvft1f0IfnJQlY++heho1MJFr7VL8l?=
 =?us-ascii?Q?IbV37xpyJafRfvo9vYL8Cs/TQVjOf4LJu2Sj9TCvJs6h/ZbKVVYzm0rxqbxj?=
 =?us-ascii?Q?WW0nHQR5kb8SFiGve+OsOQvaR5Np+uiw8f682t0Wge2/yJR+7d1jdhZltdU6?=
 =?us-ascii?Q?2f5t/ZhLHlClxShO9iYe+NrqmoPOhkRaC1H3KARRpcT/GpiwlTG1MxUaCbIm?=
 =?us-ascii?Q?yOepf3pirVHezM+03sYPKbHuPrWMqiRag/+qGEV2N4sQgLTNdtXWqrqvWKNW?=
 =?us-ascii?Q?66DkREgrEVFpDhg14QqhkYQM+kUbpI/nNi2+qlVq+jDOCWWRM9orG6MZDLdv?=
 =?us-ascii?Q?MYMuEhCM9xpb74/A1o6Ij5SnlEqzLALixHpg0IatFmqeyp0/iiAhhQVXLSyZ?=
 =?us-ascii?Q?mOARYGtpTDkPG4wBoJVsibp6SE65Gy1Oxh35HE4pUEj/8Mw/3ULfgbezUO6o?=
 =?us-ascii?Q?UvuZ/KQBJM1zZhlGpD5Nbh4UOGJnVVbX+QQD4ZWnczUqdQqfRfRqSGfiGG1Y?=
 =?us-ascii?Q?pSQvQR3YnxhgIj22hlwltpEV0M0AStq1FHPFrCKVVHa7ehGcuQwTWjlVBJZX?=
 =?us-ascii?Q?HAeQzBPVdsta7zeosyeslQ+N+32TfvYhZ/5cKFjq+fK9nedgZwn6v3xxxFu0?=
 =?us-ascii?Q?mkxWxlusuxNzF3Ew3+xQ5xjdSulPLAQ3?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?l77rpM6if888bIi+u1nHt+X1rKY9rjFhCT1x3om8T/XM1oh+vEa28upduq83?=
 =?us-ascii?Q?ionn+knBso4vLdOrQ32k/61ZvgepyAkf2O+MQE0VJ89hOmA2xIVziBMmDrkW?=
 =?us-ascii?Q?bClvI8ToxedDGrGz5txEy0YBobiRUlnvmKM47CNFnBrymUMJKJ75Huv7H72M?=
 =?us-ascii?Q?Je3cm9Pa/DzqeXnWzAKmOlo5G7mq66n334E58ewKg0yaHuFXx+ZTmsw4tOKS?=
 =?us-ascii?Q?08J2PzBzgjHviHl7wDZhdTwyCgX+zXbmcFnT4hwHETK8GMsIKC460A/tzt/H?=
 =?us-ascii?Q?i02Rh0+994cHeFskUk9w6/pGVD5raxe8N1T4+9+TsUdXXi9hZm8LT268y9sY?=
 =?us-ascii?Q?sPMRru0FnjoqLvwNegoLKGTV7E/koeYYALmJ2ufK7P+h5ymsw6V1e0Z0tlJw?=
 =?us-ascii?Q?IMhvMWI/VWCrhmSqgbA5zgZ48q/ZOV638uefzJh3XJZHqZJFEPkeIZXF9LiR?=
 =?us-ascii?Q?RMsdXz0d3z/+7ctjyoP8IX/beyhVdf1K53oR0mhI3XBhEsez2aaTUWO8ctg5?=
 =?us-ascii?Q?46ZdSfigEgc39lcxtlT8M+8Z1J/IbShVyPl/00SXhGuR6gnOk7bDxQ/OUs2Q?=
 =?us-ascii?Q?KHRO3W0g6dK3CBWF3Z6a7QAnM1OsqNRQMKkyYawKyEHLVX/ceQW/a68twtcw?=
 =?us-ascii?Q?OYZWxSv3Jp/zpowp/5hKpFzNSrBnX50or6Dy5XrVB1E4E986DcWiHl5jKjVU?=
 =?us-ascii?Q?0n12JpTmXCgD3xXtmIKjg7z+ZA3M59mRSN9v2DGK3ljA6TGTC2OyDNJBQQwE?=
 =?us-ascii?Q?f3K4pshEhLgPem5RXN8fEsOmtEU2cSgsubtSgNtbLd2OYg7JVLEaayW0M/FS?=
 =?us-ascii?Q?h2utJcbUh76uewd6KvaVNaNuq/66rT3zD0M+vcZd3ThBQ9d9W3EFbqgTeXVO?=
 =?us-ascii?Q?u9Vi1FXODyWE62Yk/b2lg4E+Xo1f7vq4A5wZaZS70EKe/2TxVLwBDWEKDD4n?=
 =?us-ascii?Q?cwYo6rCOJdDXwloYZrOckHHygNYGY3KuSMissLZS4BdZUUCvnrgSVH/0VjJ5?=
 =?us-ascii?Q?uNz11LPLCU3RPiozhLuZVt6SCShGWU+lfp3CY2bnFMrcN6wDmrBC/vNkOzq5?=
 =?us-ascii?Q?4nvSIRA6fQlrJXxIXwM4Tf3oXH6UpFp1oUNI/YmUzY68gwu1xPCGT7qUh/4w?=
 =?us-ascii?Q?HmzkxKrEmDj3OUYM7K26cE8YeD/C/ItW06qieSasw7c3Ftwvhvyujp6sDlmQ?=
 =?us-ascii?Q?TbK/m2kWRxb9Ildq5xaP5wurEONZG8stakDjXNnDcIMDevuud4B6OPeRd/lJ?=
 =?us-ascii?Q?yVQoxqN72XKdrfKAG0Be/jmjMwfpB3IDSl1bXgpOupIpqb4IqCcBPNgrFzfs?=
 =?us-ascii?Q?5xjIYi0hDtwRr66rzF5LR2/iZ+uRaDg0ftLa8Macx9QYMzcTHQPN4roQnjKu?=
 =?us-ascii?Q?LuEep+wui73Loji3H+Il6KkmfoHhlJCQGqqwSEc0AuCat4K1Ck+k9KHRfEK0?=
 =?us-ascii?Q?9tWDSOtm4B7znKzfjWfvSR/WYBGQlNfmMOt2seafld5rqFCFRfN9zuyw+EM5?=
 =?us-ascii?Q?mHWfw9zPyWCKbBSu6ScHYs2x+RXQkG3uWbdXHvRVyZlb2Ad6k23ocmF0WLmy?=
 =?us-ascii?Q?t/fszTAPEN7zvET7CROfwR3/Jt1XIxBhASHEu8K5T37ovuRIcBYdSSni6Azb?=
 =?us-ascii?Q?BQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 21dc7920-4725-4e6f-686b-08de001e6a33
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2025 12:39:36.6109 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 20JhvUP35nuUCYfeGl8GVqdPTOwAOZl82OaYVk9Myk4MRVbxDG4F2ZzM8R7TbJKhY9vLrsidMITkaCm+u/Qmzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7681
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

On Mon, Sep 29, 2025 at 08:47:33PM +0530, K V P, Satyanarayana wrote:
> 
> 
> On 29-09-2025 08:25, Matthew Brost wrote:
> > From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> > 
> > Some VF2GUC actions may take longer to process. Increase default timeout
> > after received BUSY indication to 2sec to cover all worst case scenarios.
> > 
> > Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_guc.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> > index c016a11b6ab1..f0de1fa61898 100644
> > --- a/drivers/gpu/drm/xe/xe_guc.c
> > +++ b/drivers/gpu/drm/xe/xe_guc.c
> > @@ -1439,7 +1439,7 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
> >   		BUILD_BUG_ON((GUC_HXG_TYPE_RESPONSE_SUCCESS ^ GUC_HXG_TYPE_RESPONSE_FAILURE) != 1);
> >   		ret = xe_mmio_wait32(mmio, reply_reg, resp_mask, resp_mask,
> > -				     1000000, &header, false);
> > +				     2000000, &header, false);
> >   		if (unlikely(FIELD_GET(GUC_HXG_MSG_0_ORIGIN, header) !=
> >   			     GUC_HXG_ORIGIN_GUC))
> 
> LGTM.
> Acked-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>

This is your patch, so can't ack by but anyways:

Reviewed-by: Matthew Brost <matthew.brost@intel.com>
