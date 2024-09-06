Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84376E6FE4B
	for <intel-xe@archiver.kernel.org>; Fri,  6 Sep 2024 23:12:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40F0310E1CC;
	Fri,  6 Sep 2024 23:12:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cEXFmLXE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FA9610E1CC
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Sep 2024 23:12:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725664350; x=1757200350;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=vPV08vHeAH6BEK+Dsnvt/kryCM6oT6GLZHrMck3Owqk=;
 b=cEXFmLXEyCOYFGe73oMyaxWXXu/iLPmXM4JtYzovzo/LnEYAL6ZlY4dq
 CNXhPpvI6gi1UIdB00sUxcrof8hUHORnbI0SoSuinpP6j867SFdc6Hnfv
 sszPEaiw5vz01MqUYMoEseMoV0uOBtKbEVa3RcIA/amRtLE9uiCZtxbTh
 KTlMGxyk6s1TU4PwpySdzG5lmIvTCNBVHaacraE/s0iz1vlfHdE8pSa+0
 7+6uK3tbKLS5MRQb8tV35BIq8eL6LGT4l4p6l9u4/FpCWyikKB+Zd9L3O
 +C8hqpdgiQUScrZK6nRr5+02xCP5t59i4AiV0E5Z97kVUEGZNRUAyYn6a g==;
X-CSE-ConnectionGUID: ZHcZC3sESG6n5znArK+xxQ==
X-CSE-MsgGUID: gmTMIWOlQ+axhFBNclvPzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="23994766"
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; d="scan'208";a="23994766"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 16:12:29 -0700
X-CSE-ConnectionGUID: d08UiZOLTv+cFtyhf+G+yA==
X-CSE-MsgGUID: M4fuVHGhRbSaTFMOb1SHRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; d="scan'208";a="71050443"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Sep 2024 16:12:28 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 6 Sep 2024 16:12:27 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 6 Sep 2024 16:12:27 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 6 Sep 2024 16:12:27 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.42) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 6 Sep 2024 16:12:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uOgxFcExxoAXX+/9to4Nxt9TIhHWkPfif7whxRssw1b7VnQ4xRRMaPEs33E+s6DI6Ugjnh3CYZSeVIdBfKFWoulaW8u5i5rDOqn/U092F0cX042D10h1SPevRQi4bRZZCNTr505fxJxnATlKMSDzk1c1Ac6q6dkSv02ZmTlI1lwtt+DEx2DGOwmqowPqgPCatskNr36Gk8bNkLmT4L5iMYqGAq4S2mnABFVkGEV7qZm63jARie3ksGET+vLWmm+641DID+aDCpujiiJx6Gwx6WRV+q8khpdACliK3WbJA+BFz5fFY2lESGwLcIfTyZVy0q94zooO5fop5/Urw5ymyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mMustcBapSs9BaOwYZltD/SJmIqLq6Lhj+d7CpAiMqo=;
 b=YifZE8Tc6IBOurpbxKNQgI+WVRg9WxlCHo8Rm/TOlm86FiZwl+3vL4kfYlnyWsRWTazfOIki2YNVTF+7SH1yPDrMgyqiKkn6hLVGf/Ker4Yd4S8PcR6bBBglBAwX4pmUrqO3ha57nPVY0IlmAnx9yqNaUWO22O9Y6jI4cG+ekpvPAA92yR0jdSwfwCIhSdlLdEkWlu20Mrwok4lDuLVVmerNgYL82xCtzz/dsIXU3UtI9oB9VmHb5DxN/ljzAV47GkBr5tUC7yxm+nHTma6WzSNHGN0WYpnSoQi5FB0jo03sJaxG69ONmVq1QV2kw1fcxBCo3kb/HYAza+EYtXxz/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CH3PR11MB8139.namprd11.prod.outlook.com (2603:10b6:610:157::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.28; Fri, 6 Sep
 2024 23:12:18 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7918.024; Fri, 6 Sep 2024
 23:12:18 +0000
Date: Fri, 6 Sep 2024 18:12:16 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: Matt Atwood <matthew.s.atwood@intel.com>,
 <intel-xe@lists.freedesktop.org>, Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH 1/9] drm/xe/xe3: Xe3 uses the same PAT settings as Xe2
Message-ID: <3aengnxcrwxe5xrowtef5cdtykkgoo4v6mrxst4deyyzmmroqm@3xiuytql4zom>
References: <20240906215153.31210-1-matthew.s.atwood@intel.com>
 <20240906215153.31210-2-matthew.s.atwood@intel.com>
 <ZtuEqnijkOrN-gkN@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZtuEqnijkOrN-gkN@intel.com>
X-ClientProxiedBy: MW4PR04CA0243.namprd04.prod.outlook.com
 (2603:10b6:303:88::8) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CH3PR11MB8139:EE_
X-MS-Office365-Filtering-Correlation-Id: 4cab70ef-0aee-4e50-8b85-08dccec95a4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Xc1DvpUEy6fqiFeYoqGgopypeT0Gy+SK0JqPYvY0BhdZFUgmkkckpNjdwTzB?=
 =?us-ascii?Q?De5mkknPOqBWSm0qz+5cUdAqTJE0eloHyCrsElyRXeY4NnCRcZjNGLX/X5XX?=
 =?us-ascii?Q?iTYqGn4H9RArHdMpa81+F6Bg2H3YAbdR96/9K/6S5rr5prHPfCyGTuSwOmWa?=
 =?us-ascii?Q?1FlZL6LgTA2icxAXN1zZCECDpZhCsslJruKgyy2M57gBvvvbgYpUTvK1w13f?=
 =?us-ascii?Q?Vd+FXGP/wxGB/qgGtvc+s5yfb0sej9Ba1BJgTUBtusc0kilhithmuzqm2yz5?=
 =?us-ascii?Q?hhq43FMbOHFj1JjTkWB03Va9kdI0Rl8Kfph5/YEqhArtgJBIT4mygbsTEZga?=
 =?us-ascii?Q?bhO76MovcfWu9BRHAExssP/ovo9pLj9s0plhMLz8hEQNFP7ZoDXIJQ1r4INy?=
 =?us-ascii?Q?tJaoLRjksED7GjXhcWnVWMj3KbNk7IsvImJFeuqHO2Nt8PTPEs8HKZutgudV?=
 =?us-ascii?Q?5n4/vWm2sdcIHjYL4NZIcc+P5IqXP6jLKN7MamvwGOMO+zYbfK01y+xe3wyJ?=
 =?us-ascii?Q?TbgXEEp6CkPfVFOX6iWb41Cw85Ei+2iHqcP3zsz3xnuySK5nGM2C0pYCy4bA?=
 =?us-ascii?Q?k2W8XkLUuGokg2o4RhyZKbEXToCiJPL+R4JA1BdXAqUo2LQm1Hc8YPjGDMZs?=
 =?us-ascii?Q?DAGiaxrPgfF/Kaa0vWGRQJUQzrKikQKKTZto5rBqdRVWszhW6EkbzA6JEE5y?=
 =?us-ascii?Q?Weizu6uxTc/V9QaN3mvmKz/k/629KKdWxBUi7Bj3N/0CUG8PIS8FYnYeXTyi?=
 =?us-ascii?Q?QENkep66tsLa3G5K9WajnU80vOZHuhcwKOyvINaF8X7SHisUyVDIQ2BH+gC+?=
 =?us-ascii?Q?toikFmOIyypX8V4TmLk9bnFSLz81s3Sd43wJXAfbpsMiG/jfbzLERm+Cj+qL?=
 =?us-ascii?Q?b/SUCYcr4sgP7SHrwD2/sAylulbjyHBjKBNCBijRC+OE2fTprYIFlxQnGRTy?=
 =?us-ascii?Q?MQyQ9OJcEZGg/hlXvWXv4kEq/YeFqF6gEvEu27LmninHlHKsaWJIKx+dY4CQ?=
 =?us-ascii?Q?wgnvA2QVJVvPJrMcatXOdbqAkPZlu62CBhIAwD6HWouT4TuhLSfXYXk6SN37?=
 =?us-ascii?Q?E1mIwXybLIdXxMUQLEdOTbZ00AbR1ugWU9D2wVgWteeeX2CrJsv0AGAugJkm?=
 =?us-ascii?Q?71Lb1hRlDO/Pwq87iYGkYDVTe/033LtqfosmAnCRXDZGT/UcIis6qz+E96O6?=
 =?us-ascii?Q?ydQuQzUgK+iThu6LErBSLfYcJg8HpaHjVAmEbT2NDIg4BT9dAQNCi+Yme5Aj?=
 =?us-ascii?Q?An9cuWKkHyyJ8nFPO7DaDGC/nX4SQFlZUB8h6Yb7WVIKsDjO9sNpNdcFE2Iy?=
 =?us-ascii?Q?L9CwmeycKeMwxi/+1ceToFGarMsdeCP5OF6/qjf7C6W4Iw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jKiKkIGnCsaGxzPUoBE2ynzUYbyJaSEa96hlw96ebwCOjeBgpLIxVBxORsDb?=
 =?us-ascii?Q?9nG8MDUX5Ukf2YNXOfHWGuV8zoZk/BeazvSTzw0hDwaocD3upYSvLOD4tHnb?=
 =?us-ascii?Q?Shddp7Y8t/UbWQUsdp7Q0kNq/rcWdH4vTd4M+j7Z42eFOA+4CxLR1+edlJ9U?=
 =?us-ascii?Q?eY/xAVVFeqfwNaK/aaPlXgUW4+fy446NiKbLu26hFpB/QQ7Kth2NgJbzP+zj?=
 =?us-ascii?Q?dJL3J1F7fnPfoYuAgt7tFHUO9OqR+lkUoSDUkHm6Ydxt6UN08BbQGnCP++Up?=
 =?us-ascii?Q?RVAgnBlWPfKCaz1nUg1M29+Amu1IzYYPklMY2t1r6kN+Tirx7xiUOLFlf/c3?=
 =?us-ascii?Q?UY28PGuA2Li1ukpCZAprvjJUPaN70QY5M5RQT+KUOi3Fwr/4vLcGbgxTceh3?=
 =?us-ascii?Q?d5AlBjHbrjSxizWat9wqOwFO9DEJ1y4dnCtuyVik5rXDMmaEA2nnIU0BW5Jg?=
 =?us-ascii?Q?eOMfDK013NeSUGA0aA+TNqgu4iKB0SAqhLax8MBl62fkQw9KkY1ErfUiIOFa?=
 =?us-ascii?Q?B61/KtGEUHjewPoRhEVhbs2Lpw2Bxv0wUkRiRxxR0fZzWikEdZJYl47Ss1Nv?=
 =?us-ascii?Q?ixDQ0a87cD/u/SXINfZUWu2Q2SICMsBlwsO2Xa9FgzUHPXv1dpi4MEp2FXon?=
 =?us-ascii?Q?GUhelbmkHkstaNpRdcx/lyiEpfYd/g+5LbnPtIZMWCF50pXswVuYRGdc+cku?=
 =?us-ascii?Q?GeZ1DpV6/ElnqierCkCBXT8Zb8ebO6bSePVOb/OoU0hwuWC2lX60y1xTRfLJ?=
 =?us-ascii?Q?3xYuQIJPyUGMFSt9wRlpMjSnTSnD9Ps/BHUVXCY7m++dZOqJxKLAnZVazJr4?=
 =?us-ascii?Q?HlGWLqMSFkILZaWuYg64T0sBjNh1z1GOkX0/HawU3CEUAxyduXR4guxGNU66?=
 =?us-ascii?Q?i7U5ug1hGK2Ix8jTgAg2Oojr6/Us426wnbhbSlbvjX1sY7rddF5q7910+UCX?=
 =?us-ascii?Q?4I7UxK2LABhVCma9II7VBU4Lz5HpXgMp+c2soUpavCYXlcLNFhrtyFZHpLxX?=
 =?us-ascii?Q?nOTqIxMwYIL0fEaOpM/E4112kR5YxgZGwlr7R7qOxIu6v46+hCnZ0x2pA5A5?=
 =?us-ascii?Q?QADkRd6F6Vn/u6yMJVt+EyEQWegXBBis4UfISTP/wFoN6jywsqX+ynNXOikT?=
 =?us-ascii?Q?Qb1cl7fwn7E8jCkEOMsVtZQFFX5a0zdRcSEPzXnmryo+LMUCjtIHbSp+NUV1?=
 =?us-ascii?Q?IvjQg51SFOdQBFvi+9vXjRtBoS/w0fdUmt3O7O368t9tN9zPwo/PVLV7MD7P?=
 =?us-ascii?Q?82dyHpEdLXkbd0zI1wf2+d46PAQoOhamzsMj4523fXYniSuvwoB7d5CASM+n?=
 =?us-ascii?Q?bVAt7HnwKmec7Rdsh72uS0qNOdiS6H5sUQP6HE7RlC4Vvv9Qh2m9fpMpp9m/?=
 =?us-ascii?Q?OQHr/0PmKTr5jaEh3N30KvHShgYOpN7XtWu9yfh4h7f6NM7JAykgNTR8Ick4?=
 =?us-ascii?Q?gJQFSrZfojNHySuzQ1fGDp2Z8hN4PgUlbUAeTAUtoVjcxvfPKY5QbazYuxwA?=
 =?us-ascii?Q?LScSNpCpSp06mpKxDdogocckFAI8AriHPmhatLybbPEc9a9xA34iAiMxTTYJ?=
 =?us-ascii?Q?FuamPID3Ba/B1gykeqoSXW0DCzc0eRN+fLjZH5XT3hX42pPm1Of95s7MlEvC?=
 =?us-ascii?Q?Sg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cab70ef-0aee-4e50-8b85-08dccec95a4a
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 23:12:18.0568 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yJx8sTteJq6HwHXsUi2SA28KKGiR9v6CzoG8XUadCy2d8JEx0R1Sgoj5Dccodd1Xs7iwBJBfuqTp2zC6etQi5IQgZPW7QiWbtmWB1YzBatI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8139
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

On Fri, Sep 06, 2024 at 06:39:38PM GMT, Rodrigo Vivi wrote:
>On Fri, Sep 06, 2024 at 02:51:45PM -0700, Matt Atwood wrote:
>> From: Matt Roper <matthew.d.roper@intel.com>
>>
>> Xe3 platforms use the same PAT tables as Xe2.
>>
>> Bspec: 71582
>> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>> Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_pat.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
>> index f291a1730024..aad9345180e8 100644
>> --- a/drivers/gpu/drm/xe/xe_pat.c
>> +++ b/drivers/gpu/drm/xe/xe_pat.c
>> @@ -382,7 +382,7 @@ static const struct xe_pat_ops xe2_pat_ops = {
>>
>>  void xe_pat_init_early(struct xe_device *xe)
>>  {
>> -	if (GRAPHICS_VER(xe) == 20) {
>> +	if (GRAPHICS_VER(xe) == 30 || GRAPHICS_VER(xe) == 20) {
>
>In the past we would just start with ' >=' assuming the next platform
>is the same and handle differently only if needed. But I guess that on
>the other side we would take a while to find out the wrong assumptions,
>right?

with xe2 the check with == was intentional since this is an area that
needs to be checked for any new platform and we can't simply assume the
same for next platforms. Same reasoning here, even if xe3 happened to
use the same table.

Lucas De Marchi

>
>Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>
>>  		xe->pat.ops = &xe2_pat_ops;
>>  		xe->pat.table = xe2_pat_table;
>>
>> --
>> 2.44.0
>>
