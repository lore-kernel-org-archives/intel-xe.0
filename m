Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C47B0CD484F
	for <intel-xe@archiver.kernel.org>; Wed,  4 Sep 2024 14:55:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8588010E008;
	Wed,  4 Sep 2024 14:55:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QC0v8sw/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBD0D10E008
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Sep 2024 14:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725461704; x=1756997704;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=xlZLMHhK1X9cYmCMwH0B4mIDGt9w/Z6d0SONkWGOMMc=;
 b=QC0v8sw/uEJ6c1SgfF4K/vk9bbb2emeksylGL/rBkdd1ydS2sLs0M0pR
 vjyjBobn0l4CgCu8XR7DNUyphdp157dIurpKoV2FCo3Iljbv1matkrP4G
 0j+kDBV9MARKt9nUtgCt5FC5DUcNU9Ojq5b/38pvd66unwSKEEhvguEW6
 oKRiSwixqOLC2NE91UlYiVmNfbvDulBEqYXQVdw5gz8JpARHjwa8TaeGJ
 4ocEnqbzi1qbm+ZiT94m4vy+0dFQWT7+lIn+2AsXTCm0bEmyL3AKG6Tym
 aWQ4Q2D43Wb6vyeM7UB3PcITN6qAVOx1fR+xd4Y3BFjyAsl/7b9ocqxgG w==;
X-CSE-ConnectionGUID: mXLHOTSgQIi5lLxrKr9hyg==
X-CSE-MsgGUID: eRrQkuPlTcWkXZT4DTUvBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="34697848"
X-IronPort-AV: E=Sophos;i="6.10,202,1719903600"; d="scan'208";a="34697848"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2024 07:55:03 -0700
X-CSE-ConnectionGUID: AHg9yIXdSASGWrZ/QYNipA==
X-CSE-MsgGUID: ZvvH5nqJSquulT9UB2LMkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,202,1719903600"; d="scan'208";a="69708678"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Sep 2024 07:55:03 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 4 Sep 2024 07:55:02 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 4 Sep 2024 07:55:02 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.48) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 4 Sep 2024 07:55:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e2q5O3lmNPeoxpqueMTksYOcYg72OG5vDEllMi5mPiN71D6Qvial+M/tBOd6YkhBMY6j9vCOErI+nTuxrodsJmKQGxJzh46eVwyRyMJQaBzw6Wmjntl/1/fMt5jaPA23iHvrvgsueKa20n88EpaUwNdZujxJyBnZaY/IjRiXpOu8iNF+Nb2Il06evZRFGrMK/GCFtG5xxHn2j4vhisi4/P8lWwtbApbXq9GYWNzGgjjhjLMftkf8ySB/1np0WGa/NCxlOni7eCF20o6N/lr1PgvQaqpbRPVZD3bfyQwI01pofoSEK+R3Fhr8df/gqgfqvXMLXXYi/pI1tFvJEr1LJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uc3IUctZy/6Bq7f2R+gzR/mEz44Q9iJ5RndNPQjyVaE=;
 b=yxCtfYC/pc6yjgLwkGLM6R1bN3pzAs8In6iXeAa3Ogr2FC7/LkY/HChm/mboSwCuWyvY4hQlCWXTU3ZDMyN2CWaYMWazFJX32w/9WxFdmiSSV6l1GEOK2cl0otrn6Sli1/8sTCR2CxUTmAM2tmZk6/I5BXbOOE5ZdOCo754Yr/7x/dauqlqfm9nbZmwVEovLPSAvxo1aIZnUUHZI9oSKsSYEYNNY0dKnFj9C0+2j4WsN0V47TU2uhYC5quPhz00E0/vGZsAmy9B6zxstaur4QoFTgac0o+zsD5zfziBNjC87yL4hb/bayynRp4mbVKC/y9lV5XvgAjnF/5AZjEkyWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW4PR11MB6713.namprd11.prod.outlook.com (2603:10b6:303:1e8::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Wed, 4 Sep
 2024 14:54:59 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7918.024; Wed, 4 Sep 2024
 14:54:58 +0000
Date: Wed, 4 Sep 2024 14:53:08 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, <intel-xe@lists.freedesktop.org>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH] drm/xe: Kill missing outer runtime PM protection warning
Message-ID: <Zth0VCj7ab0bOOG1@DUT025-TGLU.fm.intel.com>
References: <20240903223822.380841-1-rodrigo.vivi@intel.com>
 <23623c0f-f3e5-4227-9a84-7490ae3978ec@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <23623c0f-f3e5-4227-9a84-7490ae3978ec@intel.com>
X-ClientProxiedBy: SJ0PR05CA0167.namprd05.prod.outlook.com
 (2603:10b6:a03:339::22) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW4PR11MB6713:EE_
X-MS-Office365-Filtering-Correlation-Id: a8417366-1395-45f7-1788-08dcccf18bc3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?YB6oDP6Rs5vTXGQun304kZ7Jscdmko18rKXXfyAzBFySgt2td+Bd8ex6jR?=
 =?iso-8859-1?Q?JA9w3VbWucirR2OvsEN1xIxTD7yK9jSm2axu1g4rkWHTfZCl3AyimhItjM?=
 =?iso-8859-1?Q?NOP7UNqqFB2+UuYLCwyO9Obwih9h3WWHnJYZ+jiHQqSWdWDLCPZTZpwzFk?=
 =?iso-8859-1?Q?zgNG7u6gs11uYoqKOMAGUT3QRmj4ERLbsjEmKZfwr7DFHGv8INnunjjAFR?=
 =?iso-8859-1?Q?KFBlO3oxc893k1XNWRrYE2r34iavILWNga8ugiZ6JVuIsEf2Z+ttyLXvT8?=
 =?iso-8859-1?Q?Lgk4uffyZ1SekRzuUL6gL91+EfHQb1TZwnctxeIxSC5TYe3wXhJDv9VOuw?=
 =?iso-8859-1?Q?LSSKxll7e4X8THGVeSLseL4/f/Kfmdiu9bwkD+N4HlNNM3301ovZjdOyOH?=
 =?iso-8859-1?Q?9RdwJlXl6MHPDGH+l4RG54A4Rqy7mX7yXL+ZspzgFZ1QIOzoq3TTfsJL9/?=
 =?iso-8859-1?Q?8jOOeMGcWD+x5LkdxXXl5w5H+aiAgWXXgig9AoF7xxLNw79eVrB2USmL92?=
 =?iso-8859-1?Q?pp53TY48+siubdWMKeme+Y7IynzMhGmetUzyr5ZOG1KU4AU+tKCzgAb2V9?=
 =?iso-8859-1?Q?bFJ4SlcFuk3Pgm+5R+UIJVDLhF9mx7uEmrp0iPw1WOkRCOUdKET095p93g?=
 =?iso-8859-1?Q?sHlLDHQ2Rkw238FG0VATCMWr1wTvkNfKd1FR8sTGXUS/d4braQ3Q+WQRfe?=
 =?iso-8859-1?Q?yp+e1MdPUdnmhaGoukbsIAC5LckkK/Wy/6xkqiZSdqNTOmvLwVTkGnwANu?=
 =?iso-8859-1?Q?3HZKlmGfjO2TCtfjKKGH5LWJ1TwIRIWoGQhIG0PpsXLe5oTTTadylXCMBR?=
 =?iso-8859-1?Q?R59+Qyv4FT+n3e91GX1w7+2TKSXVwPdGVS1vAn8nTEWvCnUWRM1joqtU1Y?=
 =?iso-8859-1?Q?dAAgbXW037nnpgidRTmjYu34BewNBIfrhkV8Gk3ok2cCgp45XcZ1KPaW/c?=
 =?iso-8859-1?Q?ldvf3jw2emNLoCI6gQSM+ScQqSmKjF6mSlU/mNCn8rhRBfy/oXeTg6di7s?=
 =?iso-8859-1?Q?Hm2Pdoh6uwSwphbt9Mc1YxYQ3+qOirbo2sUDDax4Yf9N3NqAaEUtA1sQTS?=
 =?iso-8859-1?Q?1c05vvrYA/0iNaU0As35QEmOnQidD4sbEJw8AlZu8/FNHuiB8hgHl9OoRP?=
 =?iso-8859-1?Q?LEnx3c4dQ6QTXX7Anf0xLUUyPQ9dmvZvJrpwHVIZrcUbNDXazRyygSu1y+?=
 =?iso-8859-1?Q?mp0fM+wY0HVJ+47Xhoiw+CNx52h1MtxqvRYQG0jAyNaBZjUJ9t9uqHwSaE?=
 =?iso-8859-1?Q?PKsN1m+MwIQNpsZbgnzSceOPRCI6faO/Ll3LL/TujIGbrT7pfj5Atqqonw?=
 =?iso-8859-1?Q?IyqfaSdJsuu/aLgnC65D5auRD6wAV6dI2TTiQ74KC+kXEtY3LOzZXPk6Pk?=
 =?iso-8859-1?Q?E/e7Ezf8xpjHQJQO4tbf7gyJpwx6qb1w=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?qEk97cctY70wFIV6DLjQpfkSaWbVtTasA4CUIRy6tkc5r3IUZSb+BCLRmj?=
 =?iso-8859-1?Q?pWeHCqY83PXr70JAl7GhMOGKJoEJygcbClK9AF59SDjIDrk6o6wNgtn4bt?=
 =?iso-8859-1?Q?P4jvifHrTPp4EYRtinMi1v3K3k5zEskOIVpm/KcVSmIn4gnMYwIvN0jzVP?=
 =?iso-8859-1?Q?yZEsP46bxyWLajN4MFek2/GeWb4e5qd6qhXLgwcA4agUKfZTCWjBSWKEeQ?=
 =?iso-8859-1?Q?UzD/gqBeUJTKhccmZoKF637p56pWGVN9H3D7xkK6ZtU6fOSHkREFroklN/?=
 =?iso-8859-1?Q?Vxc/IV5yGvZPIq4zXNdKFnHJ566ZjDOYNJbEkY7LkcK02Nbz1ISlT66Aig?=
 =?iso-8859-1?Q?LY0Qnv4SbXUo05IUpuYJt8v25ZmodCDSdinlRV2JfFgfsyAJPuzBGWB3Hg?=
 =?iso-8859-1?Q?bWw/EQ4SvH4j9mNxw9QI2EEVLlIPmWKvuylFxa3tsh8ORbsKDV0iidvnOO?=
 =?iso-8859-1?Q?Ml/boHlROBCct832xsI3Y5i4T42GBzV8dVQdeGbnv2MShFfjMxukIiMW6S?=
 =?iso-8859-1?Q?batyRbAHzcycvB+HtgHiXvlc/cR2kRSru7ykUlfwT5U3vnwd1RDtBay9T8?=
 =?iso-8859-1?Q?YLO/5CMA7fbEke6uy2uDxiDVoSnaHP/f7dsaZJcHQ8VbLJ+gC6BECcUtz6?=
 =?iso-8859-1?Q?D37PHshJVYvjsGhiYnhcaUxZew7P0aNWMuRm5dZwvL2FPaw3+tE4Xd22h1?=
 =?iso-8859-1?Q?Vc5kFbGZoCtYm7C7mvTUXGGgstAw1gXf7nmpL+JFP0Uq+BMpL0r01OavXy?=
 =?iso-8859-1?Q?Pc8JPNbnInj2XWnlc8qkanZuSwQaRQ7cURrmeyXgULTNh6IRgzJ5CDm4e+?=
 =?iso-8859-1?Q?xVd14mqvQnGYb2gkQYuQDkBZTctwrLqlws1xhZe6PAPK3GhOQjPUkiPd83?=
 =?iso-8859-1?Q?5NHInB29PpK5VE2dBRUPJkWWz0D+ai3zMZOZk8Ysb/LZYSYtNWi5Wm8n+U?=
 =?iso-8859-1?Q?GuUhXJrWX/aqdwipDwgn2BI5qV7I/tN9SKu5uFNBEoKX/W/ukk3Im7THTq?=
 =?iso-8859-1?Q?eUllcP7967gc6G45QnXx57w509dtRpYqVmOsXNaooTMr10HhvuJCmV6V6h?=
 =?iso-8859-1?Q?hA9Lq+QdWdGY9KjMPco53JsdQEn6bppi3HbK/7/SxXGGomTcIfvA7QCOUB?=
 =?iso-8859-1?Q?lSuZmJNeKawuppNIqp/HksUd8RFoqX5GarZ8QKbUPiFRrX3C5SedVpSqxY?=
 =?iso-8859-1?Q?+eis3L1bx2HncJ766XC4yM7SRTLS+nBNeeIYJNDXSuL2//fdWzfN/NbJNy?=
 =?iso-8859-1?Q?FG8pqz8gJUO2K5B0G2bYv3xQOT4qYzy2f6Ada9x/Q+wl7I0FAROH9ezhTS?=
 =?iso-8859-1?Q?Jn27LzZi9syGeG2jYuZ6dc2jUF9YjeJYT+PodXGnzTxqdg8OQ5jXhKxdPb?=
 =?iso-8859-1?Q?BrALLA/4w+3bSzlbl3XrPfsIXXhw30pO+wpOoyPyHDdcPoGtsdoaHT+Z7y?=
 =?iso-8859-1?Q?E7KenH5qYchOaabJpFU8qSTVpcp6ZPjstWZCRNhP6jKWrS7umoocPQ4Zoo?=
 =?iso-8859-1?Q?pxH/zCMWHNTWggHsQSYAGM0MCKl0rGAVkYtsISLwGamrnWxj+0QGPjc04/?=
 =?iso-8859-1?Q?r6VbLtKr6oHxUvVqaftMZ7E6delle6NsJr4dX54i16E5R94SZkyDXP0lTF?=
 =?iso-8859-1?Q?bLdyOPzrFfPu8FWXNkKWqqhc5daXePqLqyrx/khjBzNzIktM8GrPCIrw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a8417366-1395-45f7-1788-08dcccf18bc3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2024 14:54:58.4956 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kphW+rufu9ywMD5QLcVklIi7+Yd1/dSw0kMULLXFL5GZemmnZEbKSErZ5bhku0XRRUiVgPj5Lik/0CmRVVJzYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6713
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

On Wed, Sep 04, 2024 at 01:49:47PM +0100, Matthew Auld wrote:
> On 03/09/2024 23:38, Rodrigo Vivi wrote:
> > This message was very useful to ensure that Xe was taking all
> > the needed outer runtime pm references. However, at this point
> > it is only a false positive. So, remove it.
> > 
> > False positive cases:
> > 
> > 1:
> > [184.983389] xe ...: [drm] Missing outer runtime PM protection
> > [snip]
> > [184.984096]  drm_ioctl+0x2cf/0x580 [drm]
> > [snip]
> > [184.984710] xe 0000:00:02.0: Runtime PM usage count underflow!
> > 
> > In this case the underflow is the problem since we are sure that
> > the ioctl is protected. But something else is abusing the 'put'
> > calls.
> > 
> > 2:
> > rpm_status:           0000:03:00.0 status=RPM_SUSPENDING
> > console:              xe_bo_evict_all (called from suspend)
> > xe_sched_job_create:  dev=0000:03:00.0, ...
> > xe_sched_job_exec:    dev=0000:03:00.0, ...
> > xe_pm_runtime_put:    dev=0000:03:00.0, ...
> > xe_sched_job_run:     dev=0000:03:00.0, ...
> > rpm_usage:            0000:03:00.0 flags-0 cnt-2  ...
> > rpm_usage:            0000:03:00.0 flags-0 cnt-2  ...
> > rpm_usage:            0000:03:00.0 flags-0 cnt-2  ...
> > console:              xe 0000:03:00.0: [drm] Missing outer runtime
> > 		      	 	       	     	     PM protection
> > console:               xe_guc_ct_send+0x15/0x50 [xe]
> > console:               guc_exec_queue_run_job+0x1509/0x3950 [xe]
> > [snip]
> > console:               drm_sched_run_job_work+0x649/0xc20
> > 
> > At this point, BOs are getting evicted from VRAM with rpm
> > usage-counter = 2, but rpm status = SUSPENDING.
> > The xe->pm_callback_task won't be equal 'current' because this call is
> > coming from a work queue.
> > 
> > So, pm_runtime_get_if_active() will be called and return 0 because rpm
> > status != ACTIVE (but equal SUSPENDING).
> > 
> > The only way out is to just grab the reference and move on.
> > 
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: Matthew Auld <matthew.auld@intel.com>
> > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_pm.c | 10 ++--------
> >   1 file changed, 2 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> > index da68cd689a96..e1a5e43b0f34 100644
> > --- a/drivers/gpu/drm/xe/xe_pm.c
> > +++ b/drivers/gpu/drm/xe/xe_pm.c
> > @@ -592,20 +592,14 @@ bool xe_pm_runtime_get_if_in_use(struct xe_device *xe)
> >    * xe_pm_runtime_get_noresume - Bump runtime PM usage counter without resuming
> >    * @xe: xe device instance
> >    *
> > - * This function should be used in inner places where it is surely already
> > + * This function should *only* be used in inner places where it is surely already
> >    * protected by outer-bound callers of `xe_pm_runtime_get`.
> > - * It will warn if not protected.
> >    * The reference should be put back after this function regardless, since it
> >    * will always bump the usage counter, regardless.
> >    */
> >   void xe_pm_runtime_get_noresume(struct xe_device *xe)
> >   {
> > -	bool ref;
> > -
> > -	ref = xe_pm_runtime_get_if_in_use(xe);
> > -
> > -	if (drm_WARN(&xe->drm, !ref, "Missing outer runtime PM protection\n"))
> > -		pm_runtime_get_noresume(xe->drm.dev);
> 
> This has proven to find real bugs in the past, right? If so, it seems
> unfortunate to drop this completely? What about making it slightly more

I quickly looked and had the same reservations about dropping completely
as it has proved useful in the past. 

> fuzzy with something like:
> 
> drm_WARN(!pm_read_callback_task() && !pm_runtime_active(), ...
> 
> That should avoid the false positive, at the cost of not finding some real
> bugs, but at least gives us something?
> 

Haven't completely wrapped my head around pm_read_callback_task() usage
so can't comment it works but in general agree with something a little
more fuzzy is better than nothing.

Matt

> > +	pm_runtime_get_noresume(xe->drm.dev);
> >   }
> >   /**
