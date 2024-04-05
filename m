Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EAF6CD11C2
	for <intel-xe@archiver.kernel.org>; Fri,  5 Apr 2024 17:36:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39230112AC1;
	Fri,  5 Apr 2024 17:36:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CafeC+jS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68E4211200A;
 Fri,  5 Apr 2024 17:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712338613; x=1743874613;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=FqZqxg1MVf+uzT8EYOxsnE7vTJmoO2H+eSvQ6qoKHsA=;
 b=CafeC+jSh4vfj5j/2qACHssXjAg15yonc5t9OVHRp7FzcGl6q71LLgeX
 +DfrwISpZOnuUGRalMhHw00Ig2p2h+qwb21cMHHUDXInJDmyrt0Lvfgvl
 q/L0cv8ZoWjWNhDBe2zO3WfFO2GJUn/RFiUX9dd/mxk0m+wsnboh5FKAe
 cjuybDxABdKXvFK8hWVeu4uo0D147Waw9LHLTUhtVdSL6eHKBrOIagaOB
 d3YFaPBfHzRoVL1IBmvKYpmvo0dvoyMxiOdJhzcOJKv2B3V97bzF4DpUp
 gmJW458ro2Fbw5t7pI5YfcRzfggFP0O3QaFlk+QHSwYpXim9hspqNUu2q w==;
X-CSE-ConnectionGUID: gaL2SEFpSiSMRHCy14i6xg==
X-CSE-MsgGUID: yUduiosxTJaguA8nIu2nPg==
X-IronPort-AV: E=McAfee;i="6600,9927,11035"; a="11472177"
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; d="scan'208";a="11472177"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2024 10:36:52 -0700
X-CSE-ConnectionGUID: nKqNwRnITvGsUE8ENGIrbA==
X-CSE-MsgGUID: u1UYx5ibSYC+h5l+AwNY1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; d="scan'208";a="42409801"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Apr 2024 10:36:51 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 5 Apr 2024 10:36:51 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 5 Apr 2024 10:36:50 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 5 Apr 2024 10:36:50 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 5 Apr 2024 10:36:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QGNZHWmyM68nvvuWUyWxLzuvDrMvLJ3jobSmwgDE61oqfHDu/yqow85ZcgYdI4dV+u1Hxt6D12dfkhxAyoO5DrdJew8dW5stOZgwSdsZw5LYdlg15wa2DtL0k+BF8sFpZWrw3djh7yIpVN0s3II6dzW42pBv77Yi0LqNWfJfn+GLrn3KdkwNR2HMx2Y1GF40xPo0+Virlez4Tqugj0mZsAY4+oVgzt7J9rUpXzBODbe6NLqh1o4ECE49I+MU/PlRFQUepwnYNVUPUSW7/DsWLMB9GgFnA9FLKkX6gWzJm+emLKP9is968UjniTZXcVnz28IPdPQgD9NQJk32tCtx8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=USdikzflDHj2UpD/pkpj3hQGVwsbeDyt1c3OO8Zq3gE=;
 b=MWGyY3oe5UyDUHzUZckXE67HwTS2o1ZSkzmVrP9fbAt2BubCjmWXTqKDqFhpeaBXcXi/IE825pBsE9peQjQrMBbPx4qdZwXI3bHaR6qCSNIksfFqus/ggWFE3+yOlCw93pUrUplTQ+boqWSM22uEJUuaLhhQq4YkEy/dO6xv+ACEv0lejXDMQk748eAuC90cN12Hz2KciW6AS+r1U9mV7pgIkC11DlTRWQQlWImEMDDORkD/8nUPY4qVXVGYojr0ddMf4hDD1V6iMGBdBUZ5a2BPjWD03NUEf6RRZjB3e/7nr9jnwr8jYkDYAS2yQ38htC0OieW6n/VIVnMyyyPPUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB5920.namprd11.prod.outlook.com (2603:10b6:a03:42e::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.25; Fri, 5 Apr
 2024 17:36:48 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7452.019; Fri, 5 Apr 2024
 17:36:47 +0000
Date: Fri, 5 Apr 2024 12:36:42 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, =?utf-8?B?Sm9zw6k=?= Roberto
 de Souza <jose.souza@intel.com>
Subject: Re: [PATCH i-g-t 2/3] lib/igt_kmod: drop devcoredump before a PCI
 module unload
Message-ID: <zwrpstbmzbpkhbu6k7rjv5lm2a6wjvjs5t7msosmhhl5mtk2pq@4agb7ra6ceqf>
X-Patchwork-Hint: comment
References: <20240403151411.113159-1-rodrigo.vivi@intel.com>
 <20240403151411.113159-2-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240403151411.113159-2-rodrigo.vivi@intel.com>
X-ClientProxiedBy: BYAPR21CA0029.namprd21.prod.outlook.com
 (2603:10b6:a03:114::39) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB5920:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: L9/2sLXxJXZ7TyjUlBgSZUe9nk8Ta7mE2ocSm5jjpVyENtrTTQAJ/Q0vA9UyIDFEDYqu2XBzG3+4JwO8tQ3fpnfXZz/7wbvZcKJXCQfdV/w0DcLT+PahbdVPj8f09UWCq/bVIQnKpxJEeMDDAVDfuB+wuD2tWrvWjOqXJx/frwSF+WVpqeT3i6yfIR8NNoZahGogu93wcNFbURIAjkU4+HXNbk3UDmUSh7X12PoqqvHdUau+jYybaay0ykyH7nTx9MNFLp0h22sbUYwE5hPTpOjT7QEv1FGgYfu5mY0vMUb8ulVh194PphmUW71OeMZDw6Ki1QhWUiXflwkPITQZM4mxjk5aWHOD46wEeECOyqTiO1C9pGMRE0WsBiYf570sywYk5Vu/QwTK016awP8E8CpG1iyRktir48nkOgPu2qRmSZoA/IK9z/SHE+juQ+stKfzbv4+wtnZ6HYWL2R7v9HtrptcQCmliZG7HZ7USEsKS95Ug/BrjBTn2dksa1wno88roVr2J3yUT9A+poYetagYiFIO+E4SPVn+6pk8T3zR909FOqWm0YtOnM5/LBMyYTPKSzT6t55I5tp3eAUAm+g5xEeo7SwABfyAFO89I5uMmiVXa57uEKHbi5cN3G8vrEbxo7II+Pnb2UnS/4ETauYCiOQejxdROg3OJPDdXCMc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?fo6CMvAnguC+A7UIKr0Xt5vXUinVoPAu9Bl8dMNpg9sO0r968tOJSJShMQ?=
 =?iso-8859-1?Q?x6E9tHyGzEQl8HTTQ+Q+A4+TlHttfBsWsFuAWEigRJodrSp8ObjGfz5FOb?=
 =?iso-8859-1?Q?crsTBpfGg8oiBCRP5QpPhIEPvROKa6diLB2pPOWNt0LouY+ftiGloNZIpr?=
 =?iso-8859-1?Q?kSc3uZgcBvp5mgnA+/9bik4jTPBB1yhOeYa3yFHRmCM8ZxKtr73IIEQcTa?=
 =?iso-8859-1?Q?EVAdzlR6RVPSXCUOUtK2Ikpykv26U5OsteQrpy5QXVwWMJ3gzzUI1Me/mW?=
 =?iso-8859-1?Q?fcVA2KeorNRIyc6DtTrilThvf/VOvUz6lKxGZQaL0p85aJCMfdgt5XhQfl?=
 =?iso-8859-1?Q?RQuQO7uOK4dVkoyh66bMiaFooFIDf4RrteVMmMIcyBmDFr6aIO9GJ8oo8w?=
 =?iso-8859-1?Q?R7AbCoc+f+pMgV9uKIh3//6x+Etb3ohtq/AzvEY2qqL0RXLRuZIzPhiJDk?=
 =?iso-8859-1?Q?XdGeJKNATaWR+x760AjVy+DsjSwg7W9M23LoDCXa4WI7D4gn1IBSoc7+YR?=
 =?iso-8859-1?Q?/es4wDt3XC2aaInr0ZUmXDICaXSTISbNeuUdBt7uqOMwI5fvoi2WjJWZqd?=
 =?iso-8859-1?Q?u3KGI48Xutmqmn2AHE+9uQ9oZsCVWbH2WgvmwYSU1hgu9s0WBm5Ybp3Ooc?=
 =?iso-8859-1?Q?wpWGGihn/BQo/64qTPN6FJ2GkEWBpEEBMwSym5jtgLBNgnr/pRq+eYRZFC?=
 =?iso-8859-1?Q?Ql/LIBMSMMXzBU+MPkSMI08MDPPNzVODTCKDYLCKWFQCG3TDkGvqBoSrZw?=
 =?iso-8859-1?Q?AnX+JatZuAe+Vj2UUvoJjqs5fTorezuy+/sWDfLNHdpCs1xYgYrqBfgJ+k?=
 =?iso-8859-1?Q?lDs4hijPscx5vfEdZbzHxOYOQgkL18kWKidLeljOMWFUqvzZN6VjXtCW7g?=
 =?iso-8859-1?Q?GrcH7frzjLOCxh562aGHEZUuqXtbF00sIsiGPjf8Ui8sl7FPMNXxaw3ti0?=
 =?iso-8859-1?Q?nZcHa/hTYcWuG/nDYPtyjeAASW6euL6Beeksy8gtmUp3aJ0g4daDk38wVM?=
 =?iso-8859-1?Q?aCt3aULprH2YVcnUjNgneqAe+GYzqSb+HhBk0H3YosTu/CjpTBz2xEUIeR?=
 =?iso-8859-1?Q?aK3QjnzEqdcV1ADLOZe6Wn0ND73kL1ZEh7Avvvtqe3gURDeH3EsPSeEYBx?=
 =?iso-8859-1?Q?Ep/VrHsx0UGSF/DmyqIGP60ZBX5XvYpThLL3kY5snPf2zdLwyi7PuXqTBi?=
 =?iso-8859-1?Q?bnCk1HOdH8SJeGSbm1ZO3zX1rBBFnrp4+n+cu+4dUi6wTm/4/wY6AUsPW/?=
 =?iso-8859-1?Q?UPmyP/tsvcg3O3UYyuRUquVxN8kvpTl3OAs5A0LQX5GXtEwonMMIRN9rdd?=
 =?iso-8859-1?Q?P7qVTIG6j4wMH6db3eMN3Gnyo3a1fgZXdfnX+EB0VlBwWguwcbW6jXPCD8?=
 =?iso-8859-1?Q?Popl54XyemhrOidLthMMDOZHcqOSufkxJBUYOuNwxP836f8QRcnNHrwVai?=
 =?iso-8859-1?Q?P5fhRD6d49kVMmZiTZsMs1ISuXSxLHFPNoUtLLtgN2SMOPJmvPzBJ7nfAt?=
 =?iso-8859-1?Q?B5yaakDMNZwnMYhuE+8B6B89N8YxzBGqecBG34/86k0LC0eRikd80zlcC6?=
 =?iso-8859-1?Q?XMz0k9lsEKPGNCBow5c7amFZ7jy/Khsa2TJeWxBV18kr1DgUpqwg0dszJ1?=
 =?iso-8859-1?Q?HKEf59ka8qn1qeE9rzLFbdw4Od+2JeX4Lit8KKwLWdiQ0ez3MTFgjOdg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f64685c-ddab-4f74-5302-08dc5596f833
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2024 17:36:47.9236 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0JaG4IYIFV+Nrj8gOkMSGRmQyTD2z84BYPoSULSzHSWtNPNVeMPKrW3iFtLR/PnSQCCM+STzzUzAqh9Z4S4j49cl/M8++f6lZdE40TOkWBM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5920
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

On Wed, Apr 03, 2024 at 11:14:08AM -0400, Rodrigo Vivi wrote:
>devcoredump holds a module reference, blocking the module removal.
>
>It is intentional from the devcoredump perspective to keep the
>log available even after the unbind/unprobe. However it blocks
>our module removal here.
>
>v2: Accepting many suggestions from Lucas.
>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>Cc: José Roberto de Souza <jose.souza@intel.com>
>Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>---
> lib/igt_kmod.c | 55 ++++++++++++++++++++++++++++++++++++++++++++++++++
> 1 file changed, 55 insertions(+)
>
>diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
>index cc242838f..14d51f4f6 100644
>--- a/lib/igt_kmod.c
>+++ b/lib/igt_kmod.c
>@@ -323,6 +323,59 @@ static int igt_kmod_unload_r(struct kmod_module *kmod, unsigned int flags)
> 	return err;
> }
>
>+static void igt_drop_devcoredump(const char *driver)
>+{
>+	char sysfspath[PATH_MAX];
>+	DIR *dir;
>+	char *devcoredump;
>+	FILE *data;
>+	struct dirent *entry;
>+	int len, ret;
>+
>+	len = snprintf(sysfspath, sizeof(sysfspath),
>+		       "/sys/bus/pci/drivers/%s", driver);
>+
>+	igt_assert(len < sizeof(sysfspath));
>+
>+	 /* Not a PCI module */
>+	if (access(sysfspath, F_OK))
>+		return;
>+
>+	devcoredump = sysfspath + len;
>+
>+	dir = opendir(sysfspath);
>+	igt_assert(dir);
>+
>+	while ((entry = readdir(dir)) != NULL) {
>+		if (entry->d_type != DT_LNK ||
>+		    strcmp(entry->d_name, ".") == 0 ||
>+		    strcmp(entry->d_name, "..") == 0)
>+			continue;
>+
>+		ret = snprintf(devcoredump, sizeof(sysfspath) - len,
>+			       "/%s/devcoredump", entry->d_name);

I  think this could be simplified a little bit further

		ret = snprintf(devcoredump, sizeof(sysfspath) - len,
			       "/%s/devcoredump/data", entry->d_name);
		igt_assert(ret < sizeof(sysfspath) - len);

		data = fopen(sysfspath, "w");
		if (data) {
			igt_info("Removing devcoredump before module unload: %s\n",
				 sysfspath);

			/*
			 * Write anything to devcoredump/data to
			 * force its deletion
			 */
			fprintf(data, "1\n");
			fclose(data);
		}

so it drops the TOCTOU of access()/open() and make it shorter.
... but totally optional. And untested).


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi
