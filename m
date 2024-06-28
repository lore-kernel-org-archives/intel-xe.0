Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1700CC2BD09
	for <intel-xe@archiver.kernel.org>; Fri, 28 Jun 2024 18:46:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C01DB10ECFD;
	Fri, 28 Jun 2024 18:46:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BT7TH5gO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5FD110ECFD
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Jun 2024 18:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719600401; x=1751136401;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ibHier/qZglWYv6/hdltXcO52/RDWuczIhnbqWFrtiA=;
 b=BT7TH5gOXaGm80fqlszRe+AXJMzCl98IaMjLQZLTW3mC+mM5eAFfMeN1
 Y0w5SgnmGAuteL5r0eJtJN1RSwLHqm2V28aUoSoSNiE5n687X0tistrjw
 RTyuYMYmak0Z82Drm1gavO681/jIKkf3ULSaqoabBLlxaTBePXDXmYn/3
 zL1jwLeXFHEubonGPYdQA0ai1pkUEnC+Our5PrBXmRmH88CMG06o5c9x4
 slCXRQvLWw/x5k4OqH35MBlUSspP7m57reBq9eOE9VSebrVGet0fDzHyV
 JxS6CqSIBm1DgUH2gEQvkkQwhW0UAJe6SwGeeE9p1+RFVBWLP6zsMTjmr A==;
X-CSE-ConnectionGUID: 0vFwOKYNQuG+ueS2J/aXvA==
X-CSE-MsgGUID: vwgL4SxnQ5aoQDb6ezDBDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11117"; a="16931506"
X-IronPort-AV: E=Sophos;i="6.09,170,1716274800"; d="scan'208";a="16931506"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2024 11:45:32 -0700
X-CSE-ConnectionGUID: 3mZoQRtMSzaM/QwuSJUq7A==
X-CSE-MsgGUID: 2U5DSg/WQxOmI15g8/pH4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,170,1716274800"; d="scan'208";a="44732268"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Jun 2024 11:45:32 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 28 Jun 2024 11:45:31 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 28 Jun 2024 11:45:31 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 28 Jun 2024 11:45:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lf8VJZtYXuimwBGxOpXP5ccpx4PYhdKvFyX1Zx/5SSkMIfPgfK7SNXvp/EgX/CsdFOP+pmB4Oov/MaO8Lp92ptH4jpXdp1i3DZEjfCTKx22r6i/vp3zymaV6ozL2a5kss5LxIIFsP0AhX1Fy0GPgswJBL6G71S3Edqul2A0Dz0enco2IUrtwX5dKn33GEQvx7wR+9q3IEy3DEwJxtpiItyEuiDipx6X8LvXtu2UtKcclFyKe07IRttqkDd1cexNibN2jTerYJgwy19r6BelorTNdoqwAKWEEuk9kqPJqBpAosdq+/lKNMQ2KfOlUBsfyTPQ9L9OMSI8NZ8fhxmuRTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pg4I9Dvg/dG28F+WcD77Rls3tUVE75kBrrVn4WstUL8=;
 b=DjgZUuxFzhgBinVW43jVYUKnmH8j7IPkQoQLHZrTfOC+dXBC1ubMDmVKXdcvUYX7IM0HGNQTVRuMkSZHEE6/QrhBUVKoC8CdNwvdPTdjWdxUqtGGzUs+LHYKTvLnhWoI5Yff6o+2SIGKzV0bEU6+aLO3EWqW95LKm35fqaNCJafcDqiQZuB+4f1kFFvl11aaorMgTQ6KIZcMACUqbzfIpqj9yY+geRpitw/U1bwJUv1i+G2IQQ4jy9/XTHbwBPHdyNiSyJRqCDyk5kttq+Yj+bvzAn7UH2kk3csZqqy0trX9s6OwCO12qh4TYZd9wI48rgeGCXyMTa275+YzM4wCkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB6945.namprd11.prod.outlook.com (2603:10b6:806:2a8::19)
 by BL3PR11MB6507.namprd11.prod.outlook.com (2603:10b6:208:38e::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.34; Fri, 28 Jun
 2024 18:45:28 +0000
Received: from SN7PR11MB6945.namprd11.prod.outlook.com
 ([fe80::205b:6aa:9bd7:2cb7]) by SN7PR11MB6945.namprd11.prod.outlook.com
 ([fe80::205b:6aa:9bd7:2cb7%7]) with mapi id 15.20.7698.025; Fri, 28 Jun 2024
 18:45:27 +0000
Date: Fri, 28 Jun 2024 11:45:25 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Process message queue upon submission start
Message-ID: <Zn8ExeiFEbKSvfIG@nvishwa1-DESK>
References: <20240627072055.15553-1-niranjana.vishwanathapura@intel.com>
 <Zn2pAfj/bmxxcT1K@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <Zn2pAfj/bmxxcT1K@DUT025-TGLU.fm.intel.com>
X-ClientProxiedBy: BY3PR04CA0024.namprd04.prod.outlook.com
 (2603:10b6:a03:217::29) To SN7PR11MB6945.namprd11.prod.outlook.com
 (2603:10b6:806:2a8::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB6945:EE_|BL3PR11MB6507:EE_
X-MS-Office365-Filtering-Correlation-Id: c1eb8868-6f9f-49b2-ac4e-08dc97a27a97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xyfG1zBVxQad0rifCsU14NPpjIS1fTxUQKYDkoP6yW6xPN70pwgiudiY4fyb?=
 =?us-ascii?Q?rHS2H38FLU41xWnv0ap+qDKqKGaW4L4oT93sGaIUM62t2r6z/9QIdkwE21SH?=
 =?us-ascii?Q?dVII2Qp7giUvX1q26WpT9OAi2KmDS5ldtJYHOdgRdlfsdKa9DX4EkXdDS0Gd?=
 =?us-ascii?Q?Kri4CX3wTugOaGjtdg2Rw+36mnB0hlBXfkBJvi/j28VNfz4mfPHiQM1UtFH9?=
 =?us-ascii?Q?ai5dPJulY196Zgxi3/Ttle9k4UcbCqYfU/NtMF55Mw2JxmCSXRCN7/1srjA1?=
 =?us-ascii?Q?pun8oxWUj1CHynaqz01q03x8DDELMM66Yx64CIlTN2N2PFOLxrusq1TmltrI?=
 =?us-ascii?Q?3+TGLAn9MQbNFQ4KzCqV6oTIcCO5uvfeJaforkSXWuIGRsZak0nITuwSKKgQ?=
 =?us-ascii?Q?AH63rpVOrT844tPseODjfl4AePku74b19f5MvXc87zImKPTWrJa6XkzIw0rf?=
 =?us-ascii?Q?GR+tqIyrl/004JL4CXhtjY0XErxZN+KYTmZSaZeWBmxgSYehlD0eetmYI/xa?=
 =?us-ascii?Q?Cm3eEyMeDD8tSjvlZFzKU6Hn4kZfE4JB/Zt5vgQmMyI8q/CXdwe/4EXHch8W?=
 =?us-ascii?Q?tlst1JqJzGAU+NixB6swGlJuT1V+wz8cSkLhzJoUQRwSgI0aPSxRURR4vzte?=
 =?us-ascii?Q?gI1YXNWQvvhVW46qQGTGOaB7PqtEnIiizHPfDQ29CMDHKGauNdvI2QlPWrH1?=
 =?us-ascii?Q?OkczJdDLQhUsU9Y5Rtv+/uc11CAWGWMR7d0BXVyvxJNEtSMufdvc/POCFaIu?=
 =?us-ascii?Q?AjklP72bm5knE2Rn8tma+3xNL8jRRdhVtE6g0/9nHvF23pQqU5dBh1qUnA+M?=
 =?us-ascii?Q?iTgAiSlncURiW2/FmzqkFUJqQe4XKYPdXKK8I+M4HgRBsSMZBPU6RZae0yHt?=
 =?us-ascii?Q?e/fyt55L40gHrTDOAp05B9/kA5AiHPvz+fMy9wE3a0vJP9uFbZMAPzrj4kGc?=
 =?us-ascii?Q?0ToeOTvBjFcYE1vyM+oO1m79bDJm0qwrnZ0KYB+EctMuUEB6W19WJZYkvrg9?=
 =?us-ascii?Q?ugg3mTbTZUbQmZCA7lZVSDgd/Y1e1M1H6rbdQUs/Xdkmff3xFoagupiHXbOn?=
 =?us-ascii?Q?N3Z4y+FzCiHNRBUYxL7fCqS9LdBGKDs5tkfnJBKVdPlZ5zKT84hG8Ta+3EjM?=
 =?us-ascii?Q?st+ramhvlFPrecAe2pkOFAkNhgs2YsMiY48hKlpiW0jLOr5J0uazCDtw3Yh3?=
 =?us-ascii?Q?WFq5ixmUG74C6ADcYImwpokJH2DBvdrGn8jvMyp7NlyB7BDgTpMEzW7WQ2lO?=
 =?us-ascii?Q?t0XpoS4NHa+3Qdls+f9xMVj1y+GLkI9J+Tl83cfbHGc4Fh7WkjYTdccH65Nu?=
 =?us-ascii?Q?E49buGAhG+HGxHtoKIOeySnwZPkYfKac1eX8iAawm3vZAQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB6945.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iVZyjqwEOxG946Hnl4CMCHyGEj8wir/4s73PY6RchSHNBmD6KwniowR99pq8?=
 =?us-ascii?Q?YWba4zhaKl+uNUjD8vkU6zjfgtequ+A9f7QooasIUqQEjBkquoKfnnpFhaYe?=
 =?us-ascii?Q?3I8SXQ2apdiElygTJECmYtjPP2L4EvWUMpvkWs4HEWSd7HjOpdmCVO2EaNpo?=
 =?us-ascii?Q?M2ajLEv28kLHXDNnUtp9xiWFUVGqvDJvJbj5m256qZiNvTfMCQUoGvhpYgjH?=
 =?us-ascii?Q?WRUGUtaTDhuNOs9IRtDL2lNkMDVfoAwpjlkiIUDVnHparyjk6B0jcvnPuWZu?=
 =?us-ascii?Q?kijsM1GKonk5tHgr2O4YxqZTzxYkxf0lniow0w8CsbUvV7pvC+/6Q9vuoMIG?=
 =?us-ascii?Q?8yMtMVdlKyX2pY2AoisKjicKHI0pU1rVo4PFrX5ji2FCUwY1T7XUnYHKepyb?=
 =?us-ascii?Q?HgLVgMFvC9U1aLP9fhg59bLrYqVTBa3cSiPRM4d0Kk+HvIRD38vRWSOj91gr?=
 =?us-ascii?Q?sU6ulaZzA66k+qh5yPKppZJcjYQDeJPt8J49L+78bwukK2qHYeq6y6jH9F7q?=
 =?us-ascii?Q?Ptef0xTtUNk/XdAkNEg8DQaS/Ks8xKGUJl7LnMgzQbcqtLecxUK5XcFAjCXv?=
 =?us-ascii?Q?F8+FLHAin2ORHV0HN7j07PIT/uS8Jvmyz2RxRicEYZezNFwGDI8WbnFIDQV9?=
 =?us-ascii?Q?wGikt8Q3mdhHW6mJE9dfYUt9cTBxeC+DK1nN2EaZr8Qv6QxBzakSgibM4oQj?=
 =?us-ascii?Q?8jw9l0wGBdTCT9QRiqlcdW+l8DA/HnA7DhFKibKlz9hja01vxay3eP4F0lA+?=
 =?us-ascii?Q?yP3VF1n9lwJHtXGZ4NPooWECHfgIsu9ZrAWu4aDlBvo1dYtJg1WhMOEN6bC6?=
 =?us-ascii?Q?OUjT8rI6J2wMEpqntWX5cfrL0NBBwZ1wDsU0Zgu3WrSYAln/SXMiCgfnqVRG?=
 =?us-ascii?Q?CJegTInmdLlFYmHwt8mIfKN6pPFy4G5EKXpi4enCgLhebP4R1fLF7b5pHNEZ?=
 =?us-ascii?Q?A6QxmdXqFRqnWdSjW2kEnrlTT/QtGoKnoKStf2r536pEFki1LGukvhCsHped?=
 =?us-ascii?Q?eD+w47lc4bCfa/HDbjWRTkWgzVhEv5caiqTMm3VGRrjv1J2Xk/Bo1WOOz8Xv?=
 =?us-ascii?Q?rpH11mVA8VNXdeK5NXHYrzgb9FeCJHW4exAt7BU/uAWq2vcBFpJucgNCb94C?=
 =?us-ascii?Q?Cq7+5/p0cS48YHa/LWXpglIgdVNMtoFjz4BiinvGaTWtyxKj3upfhpYJ3bT+?=
 =?us-ascii?Q?uWOt5EkAcBxxIWY1hrK+0UwEu5hZu9XK266ar8D7Vmt2D+gn3j22yQvQ3uVT?=
 =?us-ascii?Q?84YWosPajM4Ewhz5EUVaVKvaEsRr4z87CYR521y53pg4FFY+JvBKWWfudx0k?=
 =?us-ascii?Q?Usg9OAkK6FRuK1xDf/KPPoZSSAuDF7rCLOtKywAp140SdfTybVm41pWPl9LH?=
 =?us-ascii?Q?Vu2BdBVFyJhkx/qVCR7i3U3tEb9ubnvda0ucdUoB56YXxi2LNKhjx6Fil80T?=
 =?us-ascii?Q?AaFDtRlBzHpx949w93iyUilrDnPRqRk1qKPrMUpFa4gpVYU9XdjvACwrbRPK?=
 =?us-ascii?Q?JnwEeKhyyteaARLzIXXRoiB9xhQd4X1aI6jhgwnXA2U7BW4d8sJNNzYgDWmn?=
 =?us-ascii?Q?KCpckkoHbKBwjlx6o0Xrc0fP1+lSRury6ZnCC8z69rTozQ2XRHuOPxLSESzk?=
 =?us-ascii?Q?CzHQbheMME3QZLtKqbp0KK8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c1eb8868-6f9f-49b2-ac4e-08dc97a27a97
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6945.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2024 18:45:27.8005 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bGUPlVCGfGrXf0rEkNCJpko0fVEZrm1tOXVGeunKDW0ShHFJKbCpjncejZksP+QUI/3h1Qrhg/k6aqHdx4cbjSbkETA9EgWhtAVsnGdsS1ZI/0X1djkGavEnulCTZ6/K
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6507
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

On Thu, Jun 27, 2024 at 06:01:37PM +0000, Matthew Brost wrote:
>On Thu, Jun 27, 2024 at 12:20:55AM -0700, Niranjana Vishwanathapura wrote:
>> Stopping submission also stops the drm scheduler message
>> queue. Hence, when starting the submission, also process
>> message queue if there is any message ready.
>>
>> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_gpu_scheduler.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.c b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
>> index e4ad1d6ce1d5..a77a018fd8fe 100644
>> --- a/drivers/gpu/drm/xe/xe_gpu_scheduler.c
>> +++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
>> @@ -82,6 +82,7 @@ void xe_sched_submission_start(struct xe_gpu_scheduler *sched)
>>  {
>>  	drm_sched_wqueue_start(&sched->base);
>>  	queue_work(sched->base.submit_wq, &sched->work_process_msg);
>> +	xe_sched_process_msg_queue_if_ready(sched);
>
>I missed this in the internal review, I don't think this is required.
>
>The above line 'queue_work(sched->base.submit_wq,
>&sched->work_process_msg);' does the same thing as
>xe_sched_process_msg_queue_if_ready unless I am missing something.
>
>Can you double check if you pull this patch out internally everything
>still works?
>

Yah, looks like it is not needed.
Let us drop this change.

Thanks,
Niranjana

>Matt
>
>>  }
>>
>>  void xe_sched_submission_stop(struct xe_gpu_scheduler *sched)
>> --
>> 2.43.0
>>
