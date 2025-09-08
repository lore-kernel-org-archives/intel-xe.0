Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EF15CA1016
	for <intel-xe@archiver.kernel.org>; Mon,  8 Sep 2025 22:39:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C738A10E123;
	Mon,  8 Sep 2025 22:39:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KCWkUwDA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B23B110E123
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Sep 2025 22:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757371196; x=1788907196;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=orXS6Ln9Iz2tavfdtuVHjAE25AULGuI1RKwgWt1Py4E=;
 b=KCWkUwDAblHl0iTRSo31q/GSfR1bsYRRzKKoTuCg8w2u0l8WGbfZxO4N
 j80Um24sSBWO9vtlBm7jskkVS2AyaVLl1/1Srma1pQGVwAi3CHZgSFeaf
 tLhedcXUJld9W4ffrRkGtNxHMMEM5PsaMd3W2ZoV4jIzbQWWl8LYxiVaO
 Njo6z7hSnt/uoIX9/opzKKygsa+gUJHHXAcODnB6Pkn0+++SZEKr8r8jZ
 3oqjy5q02JIT/LEKMw0K8HQohQJn50BcgwwzfoCYZt+DkInaNi4HVFLy6
 KN+SjmOY58Fqp+VCZG3S3oqjHsulxcVoKeKaDSmcx6K8swLRNouLunjCE Q==;
X-CSE-ConnectionGUID: 5PiJCctSShqtn7Sz0ivLqQ==
X-CSE-MsgGUID: VX8+hfdOT4a1MOhzw9vNIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="63285806"
X-IronPort-AV: E=Sophos;i="6.18,249,1751266800"; d="scan'208";a="63285806"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2025 15:39:56 -0700
X-CSE-ConnectionGUID: 0iQqFZ7gTSioxNJjRs/g/A==
X-CSE-MsgGUID: OYJxH4WEQVyyUx9FQVugrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,249,1751266800"; d="scan'208";a="172098576"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2025 15:39:56 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 8 Sep 2025 15:39:55 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 8 Sep 2025 15:39:55 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (40.107.96.65) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 8 Sep 2025 15:39:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RXqmJfcE1NujN8yjEwdnDAZr2wHn9ercJiwfIRhDxLL23dPphHIJ90SVSDAI05oAURLk0CKPWon8WPsVXNhzZ7kXj6hmcV/nS5gsA6gp1azWcqRXuekzw7GGL7HZTCZZcklVM4mntsBYVnJDIz5B/Ju54mAwLTOvBp0cQ7Q+WcTCB5nSEm9IqASwU8TbBtX+bg9whIoO2U46nXMxn+kMpdabq0nmfqcibZRHJIDhcBX6Zu7+6gIEuIuH+cf3EJUMofuTdfo5dm8piahTzZqQrG3nkaT8FQqES8S4tSPGc8t2HBWfwj4JFa0A3cMr2ZLb71ifwxTdsgq/nhi/NjM9oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r8nB4YOoo8CYECOL7ORHBYf92LkwP6Bv5/AMYmNtEe0=;
 b=GfSW2as9tkYqc6ASbbDqPsci4e+aEmubN/bqTppIIuO+0eY8mTOIu91UWtLzt4VWWGJ00VbBiB1c3piZWU96Cem9W4rAWa1CHf1YDg7hkXnQtTW/Aidul/1ntzECvHKSJfhGEEZb171Jrafbx8vn3jwsujeNBxAPL4IowTo58tvToFUfLl7ingHs14EAh1JJkwt0rMTx04M70MtYkEcjruHhhTwRQQm5mMlgzjpixgSqNH1vApdY2qiUEtg17193j7jAE92A1RImSKjOebW+84Z+WF3oLTUbnjO0xCsisY4NO2qGYGeWJ1jgeSO5wp4c9ijny9N8zqAQNFtmli/pDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH7PR11MB5982.namprd11.prod.outlook.com (2603:10b6:510:1e1::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Mon, 8 Sep
 2025 22:39:53 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.9094.021; Mon, 8 Sep 2025
 22:39:53 +0000
Date: Mon, 8 Sep 2025 15:39:50 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Stuart Summers
 <stuart.summers@intel.com>, Riana Tauro <riana.tauro@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Umesh Nerlige Ramappa
 <umesh.nerlige.ramappa@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Raag Jadav <raag.jadav@intel.com>
Subject: Re: [PATCH v3 6/6] drm/xe/configfs: Add post context restore bb
Message-ID: <20250908223950.GB150955@mdroper-desk1.amr.corp.intel.com>
References: <20250905-wa-bb-cmds-v3-0-3da2b7bdc73e@intel.com>
 <20250905-wa-bb-cmds-v3-6-3da2b7bdc73e@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250905-wa-bb-cmds-v3-6-3da2b7bdc73e@intel.com>
X-ClientProxiedBy: SJ0PR05CA0136.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::21) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH7PR11MB5982:EE_
X-MS-Office365-Filtering-Correlation-Id: bbfd059d-4564-490e-17f8-08ddef28a08e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?mByrGo1i/eVFs3Aa/aZVFeRmDUnmyaxep1humpCrq9ScgFeQvztUMZy7bzHQ?=
 =?us-ascii?Q?exyPlAQVh9ldr1BxiLbDxRrsB+P4UuKOS42fZ3DMi1jUTibYFypQu/5sAIlz?=
 =?us-ascii?Q?tnaIn03FoGrNn26ttcpR3yvUOSwYvkgP/v3aEOwB5d/m8p6fUP0ng7quGLfY?=
 =?us-ascii?Q?QZP3iYTB7Oq+r2sye4MUUWf12Jh6rs+LpDUuASVfZjhtql5PfNKVab9qCNSh?=
 =?us-ascii?Q?CI7RJlGkqzXeoaDBX7uL6dwcN/amsE5c9fJCYZO4KLCZsepBoOfmeCYPX8ZT?=
 =?us-ascii?Q?Oq9VlmF6fpqBAAsn0wcNALXOEF+uQVsXHBxsv6UKEnX7iUk6hrk7+tgoWHDg?=
 =?us-ascii?Q?pzJVMXX7LLAiEB5IYbWaE7BPw8v0/FTVq/srPueMb2LCPRPH1dcjX8EuEsr0?=
 =?us-ascii?Q?gquE8vVSqUwacb8VSs9yYE5JqyoUJcZeXjHoFiZYwzQwjReYq/D6SiO9w6/y?=
 =?us-ascii?Q?SLO1yBIHOi+ttbEmk+hsL4doPqs1n9RHN7J5fwdANT9YpfRBGyn8Ld88qjcp?=
 =?us-ascii?Q?vgJbibm94YdufH75vildtc3tPxQFCilLUgZApN72LKZMR+igNmGvFALp2100?=
 =?us-ascii?Q?WvmbgjNgzwsLH32KPIZG/hSFawl6n1fyFjrZ0UlNSrU9FNsSYxIR1DN7vgOF?=
 =?us-ascii?Q?KGiJIY4B08rQ7mhxZvKt+zfzHE07+trnJ6otO7fnHd8lixXqjHEWkxVAmZPc?=
 =?us-ascii?Q?1B+m+DmDErvS9HuK94LnF6k22swJgtuAtXMd/13RDwPkdNr13h7y3NBb4MTt?=
 =?us-ascii?Q?WqoOxUE7MIpLJxXJmcEpCDziGApb3J1hpFPFgzp1CP0/3jz+sAu76Er6hE1+?=
 =?us-ascii?Q?9DRqdV90fHr0tx8Bi/+7duXhWVxO1zhFPqTdqZbfuY2W3WaiRC2lNm2dGJxL?=
 =?us-ascii?Q?62RtUKIjnSh7xoDtdXnN42czz9IZCPyIEjkUH084LerH0kxFnoVkI2xa7jPD?=
 =?us-ascii?Q?6rFdDFxJXZoaPIFrA2HNV4j4LkLeFDiW6Y3SoR769AORbgUU7/IuoouWzNiX?=
 =?us-ascii?Q?Zt22+yD0FXbq4VjF7TqFJXfFMgTBGvKeL1iA1MzHPxVMB6HbAsr3XsyCmcm1?=
 =?us-ascii?Q?MeOXX8h4vyCoKLv6EqE/t0xMRJN3DZaDWVbegtFPUbIP6ARSnfVykkT+jzG2?=
 =?us-ascii?Q?50/phIlAU8ncyBg1bSDe839BE2bFxJRPGmDybrwVLGUd/4tEAPkl15rvrU7c?=
 =?us-ascii?Q?guMFejXFlYaJUbJ3t1owyPDZeMwe2NzCrkKGO1sM7pNwbf88kyu8cWoQK0fO?=
 =?us-ascii?Q?n0sfqjYOZgq3OjsOqxW9effVvvoiQIwT1BtSa9NrHSxGM5nI37HSK3Qn35lQ?=
 =?us-ascii?Q?mXnPn8zPvsaov+RRSl13enlJgM1Bznq9yFeaDLjJH+V1od96GuqQjvc9cpq2?=
 =?us-ascii?Q?rtSXj6g=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0L5ts93QxsyQTyq9EzatJu0AneHGzJ2R+2E+NM7qKmaHWnQToJTMvGNBgDF9?=
 =?us-ascii?Q?RqXdKS6AyiLSTvlQXXCD8uqZzQRKJvyvwb4gUEaabF5V4gI0XFC7vk5DpMT4?=
 =?us-ascii?Q?L5kl0UzCj6d3Zq71P5k+W9jKC4s9qbVcBTdMg/pNmpNqnr8ni5MIuc+PfFER?=
 =?us-ascii?Q?AC2hhYLpfRRmi4sz3Nslv2Kg3NNSy+n1ByKsR3xePNDqCp7kmitj/a7H3fA2?=
 =?us-ascii?Q?DAMkCAJMUurXDLSphNSFs7e6pHWynlCP3rv3JKLPn6v1rZtSNfo7Ah9LGipf?=
 =?us-ascii?Q?QPfeO9Mq4yaEds9z/fuqXMrjqXUxF2cDStzmbsJhCXy/q1xYwgA4my6d7EKt?=
 =?us-ascii?Q?ZZL5gBFQPRPTzYD2ooMb4TwSBY5F5YiclEhrtuGr4GMWlRyA7LYFo9k90Nqx?=
 =?us-ascii?Q?JUspGVfDpU2TFP1X91dS3HtgjXB94esbsasU8bkGbrVGHMxJx2dJx4I0SrT9?=
 =?us-ascii?Q?acbbwN7PSkkj9VUE5wNDnA9f8rzSu9LbZHXYjUatVpEEZi+D74GN7jb+qC9d?=
 =?us-ascii?Q?LKUFoOKPan4ckm819S3SvA7G+xMQGmPnfzGQIF4XIgmevBynIv/nss3gV20s?=
 =?us-ascii?Q?//WtmbAmZ3yxZgJZ3aJrbAxC8C3hD380SwfML09sTuJSdo+Roxjxieql3HBf?=
 =?us-ascii?Q?HguNGX2yj1QZ6JDDi6RymuWxVemcx+myegjkvt0hT8NvVr12g4tu3kzcROrk?=
 =?us-ascii?Q?um2VoRXSjBvJHOEvkU3KSSaAhCYmzMl3VRTQo7qWAiSNukpQUoip8AJgxTmG?=
 =?us-ascii?Q?TM+poiJ3d+bz4r7fhdwqAcaQTM45bHbDfGmQTo9rUBNDGntl4MSpGaLZKGgc?=
 =?us-ascii?Q?mgcPs/bmobCRuwPExtCNP8zFE7OVSRNb2x0fJOhhNhOpLkYq6Z7Hcavu0ZDA?=
 =?us-ascii?Q?qzBmRSUroRTktPmzksiTuQB8Ekr8bSgiKF8ZoyrJTNcOcVla0It6W2uoM25G?=
 =?us-ascii?Q?xxIP1ekLbZIiNwUibQ24W1m+HYkQT1vCNnHozhEQ50o5HdFFywILU2KeJkmD?=
 =?us-ascii?Q?YOPtgsuKc9BM8957tW1TYbUKD/eZFtbNTfyGUabFU5qmrUi7zJ4+Ys72m6Pp?=
 =?us-ascii?Q?AIDvkJw5WRnsde3nu6Zo6qf+Bv0WCRs2ELGHCXQZSUkcGV7nhzrNLXXmLrzO?=
 =?us-ascii?Q?2VoeyLY/pHGCJxK6YNrL8plvCFTkBf0zcbXt+Awp2+njJFRb5VUWH820wuyu?=
 =?us-ascii?Q?cjb6gsXM1+wRcd8Cim5aP0pRN+ml9QYnenwrf4GTYUj0aEFkm2w3O2keGjSy?=
 =?us-ascii?Q?zfQdbEoLWP+bDxHsHHsmRcbU3T0StaV0+Pu+OwY+1Fi5z6NHAIg85JmrL++6?=
 =?us-ascii?Q?g8UZuiCeNKWoRoZ25oLiXM29kFrEzXzwyiGG1f229KAERPS9hb/v5fyhMbgU?=
 =?us-ascii?Q?ISqtAXWIzFFSUPwkbhtCvqnXM1wklAnP1cvSMrW0P5XMVoZFRM5qWmT6rcKi?=
 =?us-ascii?Q?x4HIXis6+y42sdGxqLCLtvJ6vRqI7aYJJIvpONz7B8beEM8zm0YkybEPFMVF?=
 =?us-ascii?Q?NlVJ7XMi16vNgWi+40iv9pKnXZJDNs/IHLsuqofsD/KPLafSqHP8dNebcPj8?=
 =?us-ascii?Q?kDHTPEQZysDzVAnbulIr+1hKNHgDZYIUaMqLqlAvPtQnja7R+qZun/3fp+nC?=
 =?us-ascii?Q?Og=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bbfd059d-4564-490e-17f8-08ddef28a08e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2025 22:39:53.0205 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W4EL3RCsh2hJaEHXAYPzYrzIn5/WLDL2b/RiPrqdK3eKqifIg43pHKQYZ4yKmpDTpyZbzIvDygY82KDO/ILQDsitk/5YRjXK/Cvt5S9R0Ek=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5982
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

On Fri, Sep 05, 2025 at 10:50:34PM -0700, Lucas De Marchi wrote:
> Allow the user to specify commands to execute during a context restore.
> Currently it's possible to parse 2 types of actions:
> 
> 	- cmd: the instructions are added as is to the bb
> 	- reg: just use the address and value, without worrying about
> 	  encoding the right LRI instruction. This is possibly the most
> 	  useful use case, so added a dedicated action for that.
> 
> This also prepares for future BBs: mid context restore and rc6 context
> restore that can re-use the same parsing functions.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
> v2:
> - use bin attribute to be allow multiline
> v3:
> - revert attribute back to a simple attribute rather than binary:
>   otherwise configfs only calls the callback on the file release and
>   ignores the result. With that the user can't rely on the return
>   code to know if the setting was accepted.
> 
>   To still allow multiline, a method that uses just one syscall should
>   be used. In bash, echo will end up using more syscalls. This can be
>   workarounded by using heredoc, or simply writing it in C
>   (rewrote that listening to
>    https://www.youtube.com/watch?v=1S1fISh-pag, you're welcome to review
>    listening to that beauty too)
> ---
>  drivers/gpu/drm/xe/xe_configfs.c | 278 ++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 276 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
> index 21fd153666db8..f5fa0d14af38b 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.c
> +++ b/drivers/gpu/drm/xe/xe_configfs.c
> @@ -4,6 +4,7 @@
>   */
>  
>  #include <linux/bitops.h>
> +#include <linux/ctype.h>
>  #include <linux/configfs.h>
>  #include <linux/cleanup.h>
>  #include <linux/find.h>
> @@ -12,6 +13,7 @@
>  #include <linux/pci.h>
>  #include <linux/string.h>
>  
> +#include "instructions/xe_mi_commands.h"
>  #include "xe_configfs.h"
>  #include "xe_hw_engine_types.h"
>  #include "xe_module.h"
> @@ -115,6 +117,35 @@
>   *
>   * This attribute can only be set before binding to the device.
>   *
> + * Context restore BB
> + * ------------------
> + *
> + * Allow to execute a batch buffer during any context switches. When the
> + * GPU is restoring the context, it executes additional commands. It's useful
> + * for testing additional workarounds and validating certain HW behaviors.
> + *
> + * Currently this is implemented only for post context restore. Examples:
> + *
> + * #. Execute a LRI command to write 0xDEADBEEF to register 0x4f10::
> + *
> + *	# echo 'rcs cmd 11000001 4F100 DEADBEEF' \
> + *		> /sys/kernel/config/xe/0000:03:00.0/ctx_restore_post_bb
> + *
> + * #. Load certain values in a couple of registers (it can be used as a simpler
> + *    alternative to the `cmd`) action::
> + *
> + *	# cat > /sys/kernel/config/xe/0000:03:00.0/ctx_restore_post_bb <<EOF
> + *	rcs reg 4F100 DEADBEEF
> + *	rcs reg 4F104 FFFFFFFF
> + *	EOF
> + *
> + *    .. note::
> + *
> + *       When using multiple lines, make sure to use a command that is
> + *       implemented with a single write syscall, like HEREDOC.
> + *
> + * This attribute can only be set before binding to the device.
> + *
>   * Remove devices
>   * ==============
>   *
> @@ -123,11 +154,18 @@
>   *	# rmdir /sys/kernel/config/xe/0000:03:00.0/
>   */
>  
> +/* Similar to struct xe_bb, but not tied to HW (yet) */
> +struct wa_bb {
> +	u32 *cs;
> +	u32 len; /* in dwords */
> +};
> +
>  struct xe_config_group_device {
>  	struct config_group group;
>  
>  	struct xe_config_device {
>  		u64 engines_allowed;
> +		struct wa_bb ctx_restore_post_bb[XE_ENGINE_CLASS_MAX];
>  		bool survivability_mode;
>  		bool enable_psmi;
>  	} config;
> @@ -371,6 +409,227 @@ static ssize_t enable_psmi_store(struct config_item *item, const char *page, siz
>  	return len;
>  }
>  
> +static bool wa_bb_read_advance(bool dereference, char **p,
> +			       const char *append, size_t len,
> +			       size_t *max_size)
> +{
> +	if (dereference) {
> +		if (len >= *max_size)
> +			return false;
> +		*max_size -= len;
> +		if (append)
> +			memcpy(*p, append, len);
> +	}
> +
> +	*p += len;
> +
> +	return true;
> +}
> +
> +static ssize_t wa_bb_show(struct xe_config_group_device *dev,
> +			  struct wa_bb wa_bb[static XE_ENGINE_CLASS_MAX],
> +			  char *data, size_t sz)
> +{
> +	char *p = data;
> +
> +	guard(mutex)(&dev->lock);
> +
> +	for (size_t i = 0; i < ARRAY_SIZE(engine_info); i++) {
> +		enum xe_engine_class ec = engine_info[i].engine_class;
> +		size_t len;
> +
> +		if (!wa_bb[ec].len)
> +			continue;
> +
> +		len = snprintf(p, sz, "%s:", engine_info[i].cls);
> +		if (!wa_bb_read_advance(data, &p, NULL, len, &sz))
> +			return -ENOBUFS;
> +
> +		for (size_t j = 0; j < wa_bb[ec].len; j++) {
> +			len = snprintf(p, sz, " %08x", wa_bb[ec].cs[j]);
> +			if (!wa_bb_read_advance(data, &p, NULL, len, &sz))
> +				return -ENOBUFS;
> +		}
> +
> +		if (!wa_bb_read_advance(data, &p, "\n", 1, &sz))
> +			return -ENOBUFS;
> +	}
> +
> +	if (!wa_bb_read_advance(data, &p, "", 1, &sz))
> +		return -ENOBUFS;
> +
> +	/* Reserve one more to match check for '\0' */
> +	if (!data)
> +		p++;
> +
> +	return p - data;
> +}
> +
> +static ssize_t ctx_restore_post_bb_show(struct config_item *item, char *page)
> +{
> +	struct xe_config_group_device *dev = to_xe_config_group_device(item);
> +
> +	return wa_bb_show(dev, dev->config.ctx_restore_post_bb, page, SZ_4K);
> +}
> +
> +static void wa_bb_append(struct wa_bb *wa_bb, u32 val)
> +{
> +	if (wa_bb->cs)
> +		wa_bb->cs[wa_bb->len] = val;
> +
> +	wa_bb->len++;
> +}
> +
> +static ssize_t parse_hex(const char *line, u32 *pval)
> +{
> +	char numstr[12];
> +	const char *p;
> +	ssize_t numlen;
> +
> +	p = line + strspn(line, " \t");
> +	if (!*p || *p == '\n')
> +		return 0;
> +
> +	numlen = strcspn(p, " \t\n");
> +	if (!numlen || numlen >= sizeof(numstr) - 1)
> +		return -EINVAL;
> +
> +	memcpy(numstr, p, numlen);
> +	numstr[numlen] = '\0';
> +	p += numlen;
> +
> +	if (kstrtou32(numstr, 16, pval))
> +		return -EINVAL;
> +
> +	return p - line;
> +}
> +
> +/*
> + * Parse lines with the format
> + *
> + *	<engine-class> cmd <u32> <u32...>
> + *	<engine-class> reg <u32_addr> <u32_val>
> + *
> + * and optionally save them in @wa_bb[i].cs is non-NULL.
> + *
> + * Return the number of dwords parsed.
> + */
> +static ssize_t parse_wa_bb_lines(const char *lines,
> +				 struct wa_bb wa_bb[static XE_ENGINE_CLASS_MAX])
> +{
> +	ssize_t dwords = 0, ret;
> +	const char *p;
> +
> +	for (p = lines; *p; p++) {
> +		const struct engine_info *info = NULL;
> +		u32 val, val2;
> +
> +		/* Also allow empty lines */
> +		p += strspn(p, " \t\n");
> +		if (!*p)
> +			break;
> +
> +		ret = parse_engine(p, " \t\n", NULL, &info);
> +		if (ret < 0)
> +			return ret;

Should we be validating that the engine class is always 'rcs' here?
BB_PER_CTX_PTR is not supported on BCS, VCS, VECS, or CCS according to
bspec 60265.  Or do we just let the user shoot themselves in the foot if
they want to (since there are already plenty of other ways for them to
do that by mishandling the batchbuffer they specify here)?

Speaking of which, should we be adding some kind of taint if this gets
used?  Based on our prior experience with things like module parameters,
I'm worried that people will post advice on websites like "if you run
these strange commands while loading the driver it can make Game X run
faster!"  Then we wind up with a bunch of end users blindly inserting
unknown behavior on context switch, which can lead to instability and/or
insecurity.  And then we (or the mesa guys) get a bunch of
unreproducible bug reports because the GPU state is getting messed up on
context switch behind the drivers' backs...


Matt

> +
> +		p += ret;
> +		p += strspn(p, " \t");
> +
> +		if (str_has_prefix(p, "cmd")) {
> +			for (p += strlen("cmd"); *p;) {
> +				ret = parse_hex(p, &val);
> +				if (ret < 0)
> +					return -EINVAL;
> +				if (!ret)
> +					break;
> +
> +				p += ret;
> +				dwords++;
> +				wa_bb_append(&wa_bb[info->engine_class], val);
> +			}
> +		} else if (str_has_prefix(p, "reg")) {
> +			p += strlen("reg");
> +			ret = parse_hex(p, &val);
> +			if (ret <= 0)
> +				return -EINVAL;
> +
> +			p += ret;
> +			ret = parse_hex(p, &val2);
> +			if (ret <= 0)
> +				return -EINVAL;
> +
> +			p += ret;
> +			dwords += 3;
> +			wa_bb_append(&wa_bb[info->engine_class],
> +				     MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(1));
> +			wa_bb_append(&wa_bb[info->engine_class], val);
> +			wa_bb_append(&wa_bb[info->engine_class], val2);
> +		} else {
> +			return -EINVAL;
> +		}
> +	}
> +
> +	return dwords;
> +}
> +
> +static ssize_t wa_bb_store(struct wa_bb wa_bb[static XE_ENGINE_CLASS_MAX],
> +			   struct xe_config_group_device *dev,
> +			   const char *page, size_t len)
> +{
> +	/* tmp_wa_bb must match wa_bb's size */
> +	struct wa_bb tmp_wa_bb[XE_ENGINE_CLASS_MAX] = { };
> +	ssize_t count, class;
> +	u32 *tmp;
> +
> +	/* 1. Count dwords - wa_bb[i].cs is NULL for all classes */
> +	count = parse_wa_bb_lines(page, tmp_wa_bb);
> +	if (count < 0)
> +		return count;
> +
> +	guard(mutex)(&dev->lock);
> +
> +	if (is_bound(dev))
> +		return -EBUSY;
> +
> +	/*
> +	 * 2. Allocate a u32 array and set the pointers to the right positions
> +	 * according to the length of each class' wa_bb
> +	 */
> +	tmp = krealloc(wa_bb[0].cs, count * sizeof(u32), GFP_KERNEL);
> +	if (!tmp)
> +		return -ENOMEM;
> +
> +	if (!count) {
> +		memset(wa_bb, 0, sizeof(tmp_wa_bb));
> +		return len;
> +	}
> +
> +	for (class = 0, count = 0; class < XE_ENGINE_CLASS_MAX; ++class) {
> +		tmp_wa_bb[class].cs = tmp + count;
> +		count += tmp_wa_bb[class].len;
> +		tmp_wa_bb[class].len = 0;
> +	}
> +
> +	/* 3. Parse wa_bb lines again, this time saving the values */
> +	count = parse_wa_bb_lines(page, tmp_wa_bb);
> +	if (count < 0)
> +		return count;
> +
> +	memcpy(wa_bb, tmp_wa_bb, sizeof(tmp_wa_bb));
> +
> +	return len;
> +}
> +
> +static ssize_t ctx_restore_post_bb_store(struct config_item *item,
> +					 const char *data, size_t sz)
> +{
> +	struct xe_config_group_device *dev = to_xe_config_group_device(item);
> +
> +	return wa_bb_store(dev->config.ctx_restore_post_bb, dev, data, sz);
> +}
> +
> +CONFIGFS_ATTR(, ctx_restore_post_bb);
>  CONFIGFS_ATTR(, enable_psmi);
>  CONFIGFS_ATTR(, engines_allowed);
>  CONFIGFS_ATTR(, survivability_mode);
> @@ -379,6 +638,7 @@ static struct configfs_attribute *xe_config_device_attrs[] = {
>  	&attr_enable_psmi,
>  	&attr_engines_allowed,
>  	&attr_survivability_mode,
> +	&attr_ctx_restore_post_bb,
>  	NULL,
>  };
>  
> @@ -387,6 +647,8 @@ static void xe_config_device_release(struct config_item *item)
>  	struct xe_config_group_device *dev = to_xe_config_group_device(item);
>  
>  	mutex_destroy(&dev->lock);
> +
> +	kfree(dev->config.ctx_restore_post_bb[0].cs);
>  	kfree(dev);
>  }
>  
> @@ -636,14 +898,26 @@ bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev)
>  /**
>   * xe_configfs_get_ctx_restore_post_bb - get configfs ctx_restore_post_bb setting
>   * @pdev: pci device
> + * @class: hw engine class
> + * @cs: pointer to the bb to use - only valid during probe
>   *
> - * Return: post_ctx_restore setting in configfs
> + * Return: Number of dwords used in the post_ctx_restore setting in configfs
>   */
>  u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev,
>  					enum xe_engine_class class,
>  					const u32 **cs)
>  {
> -	return 0;
> +	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
> +	u32 len;
> +
> +	if (!dev)
> +		return 0;
> +
> +	*cs = dev->config.ctx_restore_post_bb[class].cs;
> +	len = dev->config.ctx_restore_post_bb[class].len;
> +	config_group_put(&dev->group);
> +
> +	return len;
>  }
>  
>  int __init xe_configfs_init(void)
> 
> -- 
> 2.50.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
