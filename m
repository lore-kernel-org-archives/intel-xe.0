Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6F34CF9C6B
	for <intel-xe@archiver.kernel.org>; Tue, 24 Sep 2024 15:55:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F5A310E060;
	Tue, 24 Sep 2024 15:55:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZsK+fKgv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 123EB10E060
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Sep 2024 15:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727193338; x=1758729338;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=K8Ehmv0EuF0p1XoyqJDAY0WkA9TdiSITEdNWfTHJt2c=;
 b=ZsK+fKgvdok9zRJpUksNH76sp7bX9UrVKGyxtExGd5Zh9jPj00NhSQ1+
 C0qTbQMIqS9ujaW4I436zNVjFrDBQR5k/wi98wVI7J/lNZMM2ITGpbawp
 CQJfdDdGj3KmZ1ZGQBT/5pLXZm94bKQ4d1gDC9dtt3Zmje3Qa7k1nDDzm
 Iuuo4tCIMVdEtRUphS16tixVJas45zV3NhI3IpDnOaHsuufdJ1HTNiztg
 6dvB8DB3L4CykjIyRwFDlMkUlw+G5VoZs5hw6NekCNPEf+WjquuAS0+kd
 HJUjLmm1Ky/NZilvsrbeQ9rItxbWlkH5SYEq5oM7fGil6wEwlH8288FgU g==;
X-CSE-ConnectionGUID: zJIYlAJ7Ri69OYVazkTHaQ==
X-CSE-MsgGUID: q1GY36XOQ6KySV9C/vkN1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="26017189"
X-IronPort-AV: E=Sophos;i="6.10,255,1719903600"; d="scan'208";a="26017189"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2024 08:55:34 -0700
X-CSE-ConnectionGUID: xIg/NfLvSoymq/l+vsCEFg==
X-CSE-MsgGUID: kiojWyDqS+iGEtBMuvmntQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,255,1719903600"; d="scan'208";a="76225067"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Sep 2024 08:55:33 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 24 Sep 2024 08:55:32 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 24 Sep 2024 08:55:32 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 24 Sep 2024 08:55:32 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 24 Sep 2024 08:55:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UWY8J/6hnyxOxrKhHr0KdMSLAaXLfKIdXn8CIzju+Vs6HbQTiou0pEmbkbsRTrEADW5o/501azQLdooQLfuhGVP2uKDTE5hLag/M6elKChKPdwzRbhFKdu6u0cXz1rYG5VKV1ndcZl0NPV+ToPWVP0tWVW7xEWUHQ/dnXG8OOl4mp6IotKcJthjW2mM+LxZCu78mtRdvmmTu7RHTNalq5UQVnHlBHyTM2cU5UIp/WEDvfxRMUc7ZZDDvtr703fSbhFXYGC5kBAi/A79qqJVbh5mJSU0WDRpOWV9QZViXVDrL04JiknxRXCGnnWDLeLLRKdBsCcCiSnjI4DgL1S0MCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5qLkMWaOjfzH3gij/qGHoLRdPAlYH+kEB0J9bVGFHF4=;
 b=Pk1TL1DcOjD1URVKW6F6/neEv8czQIhVAiwYtpONJPT8WbuXBkFDnVVow6FnFJfxq7l/pfbRmlNx8E6BlHwTwPX7ikiD156IEPnvieB/Elda4x75ZMgue8fTYm9PGXpC7ptpK+2VnUd3yz0vhSeLvglvYgSBdFXmHRRrpMVwS64FAh/CF99g/5u3oe4p5O0sZo4L7qJQxcjhhdlSZyyWwAZCOb22lLqf7zlVKQCYeZcLJ64eK0HwWHq4COBrorIB2w0r3KjWBCD8wGEanztTUUu0mnScc4XCLE2NedAeQb201h6Z6iVAmHs9XaGUjnFCs6J1HGV/r4198dOZofh7Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB7853.namprd11.prod.outlook.com (2603:10b6:208:3f7::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.25; Tue, 24 Sep
 2024 15:55:27 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7982.022; Tue, 24 Sep 2024
 15:55:26 +0000
Date: Tue, 24 Sep 2024 15:53:26 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/guc_submit: add missing locking in wedged_fini
Message-ID: <ZvLgdlZq6s6TB0pi@DUT025-TGLU.fm.intel.com>
References: <20240924150947.118433-2-matthew.auld@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240924150947.118433-2-matthew.auld@intel.com>
X-ClientProxiedBy: BY3PR05CA0048.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::23) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB7853:EE_
X-MS-Office365-Filtering-Correlation-Id: b1a92a00-33a7-4b75-b1d4-08dcdcb14eb4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?OFCuNv7Wqwtj8CKXgthGJSlgeCnvNEWIZFKSlNqFKFV7TQ5ZpXKzGSam31my?=
 =?us-ascii?Q?idgSCP+b8gtgub7Z5jioAm4KmHfLHgDBEc8PVxHWU/hKBkxkA6BbVlsJa/w6?=
 =?us-ascii?Q?Xvb4CIbx1GtlZ1Vc6uPA5VXf3uFoTzUXGQIl2bT9jnkHU54GaDPWen0qqOW/?=
 =?us-ascii?Q?FzrnKtbo7tKylBPIAU5NA6RyEc7w1eB7L9jeLM0+EXULJiletq/5GNzJU90D?=
 =?us-ascii?Q?eMJ2Pt/DixUW/tAWJ1GK+AMPDHWvt5XnE6lFvdaLID+gKkQWrV24lNaqaOWH?=
 =?us-ascii?Q?hQ1fmoOb/o5QpCou/aOfr+j3xRAYHX+rfHDIETcx236Eyfb2OJ9MKUnH6yjk?=
 =?us-ascii?Q?ZbYuNRX3XYqSLIc1MpUr5a9rv4W/CBa2Tb6Q2Bso+DgUvjMQRnn3fZBnegSm?=
 =?us-ascii?Q?XXps+0tzZn5BqY90VaWSwcA4Lq9g0dNScHWspw9Sh77QSPgunY30A1oOMWqZ?=
 =?us-ascii?Q?UtdZYUqhyAFSwwZ/7xb7bv4AK5rcvPN+qIZspX02zyjLdlZULWaa14jjBk9W?=
 =?us-ascii?Q?qSMIkl5yD06IVA+JtLIguLyHn6vfBoWoj5Db7pxL2Sh3IjKf87A1fHfyRZrJ?=
 =?us-ascii?Q?XQqfYlv61UkqAtWvSqKcKpHbdUe1dXnZqBckr0JDpjU11CqDl4hzRlsfXFFP?=
 =?us-ascii?Q?5GtNapQdtVXI4OUcjsBhtSazwSQIWLpREnIYl6eQtg6h+9ttnGnAqjeFVrMV?=
 =?us-ascii?Q?/8K4q4Mel+UBSSeSHLhcvzgFUnlRu1/BZQ7lF+mBmgmgn9j33wvWRFp148wO?=
 =?us-ascii?Q?yaxDynbv45e7a5sQvApS5R7KLmNv6U46K2BBZgExKasDo3wR34bK9ZkrDPf8?=
 =?us-ascii?Q?Pgjhc603noZMc81ytsVIA8nlbuMbRZjf3zkmvtSug3cNUsZBIhkn4iD87bh1?=
 =?us-ascii?Q?caaWS8+TaNTSSa9G/K72MEj817wA7ny10wFiCnhBLDLeJJIsxL0kzove2Mqt?=
 =?us-ascii?Q?KZEAFw52dIs9OegrLggL6i/DsH89lSG3d1UMwLEnXD1AUXrZJsED5S1o+a2y?=
 =?us-ascii?Q?vaKlSdPu/Swafrc25NFFGb+RNdPvFymQHuL5rIX82/4cDONYrfgWRKuaBD5d?=
 =?us-ascii?Q?kB1fEhEBoZvqkmMSiETAQa3puASniUOoqpRWkRPEopGpgMgo7rxPvUJBifsy?=
 =?us-ascii?Q?mymdftySRqwn41l6DfnvuQj84RpcvXZ/dqQNoPFN0NEDan8TPcTv0PbVt2qu?=
 =?us-ascii?Q?FCnHNFpSux2gmWI0pon/beuWYAQEyQHZKiGktBgkIUBDnK1PwC4A969ohcrx?=
 =?us-ascii?Q?QPnJvX68oC/KMfVfStnEbnH2gJUARMeGg+TRvEz53g=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?y6RDO9O1/SiUFv55ntSkQ7Ci0sT7X2UReXhbzHjsoPJBrSl79UxCVqrnZcQe?=
 =?us-ascii?Q?oXMQRXOjafodWfXoCurLzQU39lBGDEBdSBwvHMy805NEK1WcbRoNr0HAn4RZ?=
 =?us-ascii?Q?v1iGjArEFXb9F0B07uyJNqnT8Jrmt5ds1t1BuU8K0s3pVsueg2KB2Ed9D/gM?=
 =?us-ascii?Q?0NOfGOJzGyzMbZ52jz7TK5jSK5+6pKaadYoo46yEi7izOd3f3MWNKL8AQnTR?=
 =?us-ascii?Q?m9y9IYl32dPJt7vRzfaBsDq5NgHSHa8L0iXQ6WkHx37FhrDdNJGVlUpNYhjs?=
 =?us-ascii?Q?uUzreY8MIJeq193NGIrPJUn6NYFi8O4fftD+UoSHIg+DuxUtruP7FtOtoJHC?=
 =?us-ascii?Q?T+j3ILbak9hWIoSjHRiWY4NG+QcR11FOV1jgUIeLcjkVJnZ5Mkgp4RSjyxEf?=
 =?us-ascii?Q?xJakvoAlzukUn9Dv6iZu/9PI/ZaQcUXtU5lAhOcuL7HZc1yda623RIj78uOq?=
 =?us-ascii?Q?FW1j4vBHR+kmGEtIiilWO/kv4iH2pulFf69amfCpWY5nEjOcr9NrJxOl82YL?=
 =?us-ascii?Q?lMFpV25hj413OBftsNkBywmQfK7qMVpbcwVPp+CtN4IFXDFSYrFTGUPD0fBs?=
 =?us-ascii?Q?9ws4zX4GgMcRMqzfi4DgcPxSwNrGMWTSsPYS/ZeU5InS9YKzPqiCouChV0sv?=
 =?us-ascii?Q?hJ9HrHchRS+HZoonzP6l3B6H4Qrc2rMrjOfI1mjAC7mZfDoUkZe5KwtlhDed?=
 =?us-ascii?Q?//eJk+Ey07EVi0KND1MH6qeaWNIJrK+rYQAxlWpUl2i87q4bCTGhmXLGmqSw?=
 =?us-ascii?Q?ePx1Wy5F7eafLyWg5Llt/xwcloDUI3OMrNYvREsHUUzz9oBqg+6yVltEH+kQ?=
 =?us-ascii?Q?WZmllKj4IR//SVR7+5jq63mLH2k1Kx40U93DXZUeJSZc1fZm2JjAwtiJH9xL?=
 =?us-ascii?Q?tT5RfKP57F+8GWXdTMd0AUnW3zDHgGPaLk4btcfpdcCXT4drRXC87udMWDV2?=
 =?us-ascii?Q?Is5vLPcbfUOejqJ2SNN38WgU7U/yyAb5dMhIAb9E16/CBYcYRbTxyIPKQ4Ws?=
 =?us-ascii?Q?ihhoAxYkzw5bJknN4rwvinoaHXEMx0onU1mVvMATQMuTYIQfIhJbuYyvapn8?=
 =?us-ascii?Q?wP/uN7BvhlG7b1pQfHLNlBZF+F1/nGtfarwC+Mutl792BefkoNPUwWo+VjAU?=
 =?us-ascii?Q?g8Nqxi0zx35vMmBqSUvwiD6y1hQAaE98jCKtMLJoUtqfwHe1newzl9IqniRv?=
 =?us-ascii?Q?QnzK8I04vt6DbP4m8pvD+s4H7KhrqSqRcz4iV//RsNCCafZmFQop6aVgZbDy?=
 =?us-ascii?Q?7+34KU35AAS2JhbuwaOdozROoG1U5xJQdwDDSMc+pPDyT0KmelEPLTFnKPhL?=
 =?us-ascii?Q?A7c0ImHScn1NL6q4BF3HLRKmcCLe9PJuDYOjySnP3NSuHmWJBs1UVPaS9SRn?=
 =?us-ascii?Q?JLXdFROI1F3++fLmk1wLBLtbhhGqn3v75PvEkf0z0hSs7mcjfPzmF3F8CiON?=
 =?us-ascii?Q?f8gINpzLS3yyO/AvePSNFM7ycIHSiaP0KQUhp0A35y8EPyHaXtxg+ZpZbpoJ?=
 =?us-ascii?Q?EXqGS6cWcGyZ9RKqAf/OPsEh7F3Op7L8DYt/MEboEnmTkQZY8lbzzEqeWS2F?=
 =?us-ascii?Q?wgK8/riV+CALJkrM8qpxGXsLef9R87hw2gCPggex?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b1a92a00-33a7-4b75-b1d4-08dcdcb14eb4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2024 15:55:26.8934 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JbTH0dBzEDULhz0CUmA2Tcvvv8D5EebQ2wT9INWwLB2VadQk9MguwhbI5PuEPgL+Pov8ccL7HY8hnpCPLbzCJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7853
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

On Tue, Sep 24, 2024 at 04:09:48PM +0100, Matthew Auld wrote:
> Any non-wedged queue can have a zero refcount here and can be running
> concurrently with an async queue destroy, therefore dereferencing the
> queue ptr to check wedge status after the lookup can trigger UAF if
> queue is not wedged.  Fix this by keeping the submission_state lock held
> around the check to postpone the free and make the check safe, before
> dropping again around the put() to avoid the deadlock.
> 
> Fixes: 8ed9aaae39f3 ("drm/xe: Force wedged state and block GT reset upon any GPU hang")
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index fbbe6a487bbb..715c761dc7d6 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -290,9 +290,15 @@ static void guc_submit_wedged_fini(void *arg)
>  	struct xe_exec_queue *q;
>  	unsigned long index;
>  
> -	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q)
> -		if (exec_queue_wedged(q))
> +	mutex_lock(&guc->submission_state.lock);
> +	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q) {
> +		if (exec_queue_wedged(q)) {
> +			mutex_unlock(&guc->submission_state.lock);
>  			xe_exec_queue_put(q);
> +			mutex_lock(&guc->submission_state.lock);
> +		}
> +	}
> +	mutex_unlock(&guc->submission_state.lock);
>  }
>  
>  static const struct xe_exec_queue_ops guc_exec_queue_ops;
> -- 
> 2.46.1
> 
