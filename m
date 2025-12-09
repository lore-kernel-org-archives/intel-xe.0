Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E9E8D3B994
	for <intel-xe@archiver.kernel.org>; Tue,  9 Dec 2025 20:32:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E961410E0A1;
	Tue,  9 Dec 2025 20:32:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G8DzcET/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44F2010E0A1
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Dec 2025 20:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765312330; x=1796848330;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=fRxebg4ZNi0UpznCCYmou5UcaaK9+livLAYjk8vZJ3g=;
 b=G8DzcET/FeT0aojo9qBZWUxWK/EWuSZ6Zn7kJJZFitLwN8CVlItF0JbS
 PLOtE5PG1zNV8OTFCsd/ePEwl9Cu4K7sOjS+Lkcc4Dth6/dIkqmNlIkwO
 VJimAywzgp8wQaXzMg4Lihtk5z3SpDOgt+OyWVP3nU3uXqxexQRC1USlB
 DCAjiyZWsuX0UeJwqM7ncd3iqnRomGTB5yKOZnNtMTwIe7bTKi//cEc7M
 aPvqSUwkxhamnsF8rQnd0jFKc2GZNegg1ZKlMHYySkqbFPlLkezzT56vj
 WkJ0tfFiHcDD7vUNG0SQhD2jyZf4UpskQ57ctQEoOx737ryUHt7xgnknx Q==;
X-CSE-ConnectionGUID: 66GXAlVySIuma0zRdD8dZg==
X-CSE-MsgGUID: a/QG9FPwSkiR8ykEVM7npA==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="67318572"
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; d="scan'208";a="67318572"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 12:32:08 -0800
X-CSE-ConnectionGUID: c7UM093nSmqzzHosTB2uAw==
X-CSE-MsgGUID: iiZyaG3LTqm0wxorbBbAmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; d="scan'208";a="227356230"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 12:32:08 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 9 Dec 2025 12:32:07 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 9 Dec 2025 12:32:07 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.20) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 9 Dec 2025 12:32:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lM0p+N7eISzdfttUV9PqPutW3rrHR8F7dx7uDv4VhJbh2l+7uRjnTI/jOSztICq3cOBcX2+sNvYKV08qfNe+xPYXARy4tO2cqa4MkXGEajPXV9rhBvc9zGo30QNlnovZ6rAsXleGFVJvLpHgiY9uK5QZmOrtnuFF4FOxPiRMczMiWdOQYZdGaLiTBwXeq1TpMA9EMnEFfupOKNQIgy4VqwHllIw4sDmoplktrCwpopzwTh6Lqqa7U2IKKo3tiYXj6z6VzKWndzsBIqOtCdK3/kEbJ4ivjrG3wqzIAktDbaSkRj47w8dgpYkWm4NkZNmEbd0MYo5NOcg5JjH8ptZOOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ah9CsvCl1IxM3jIfl4NOHurAEQP3tnQz/Q1xRDRMDEg=;
 b=TcGnhUJ88YHM1tfxCkjcOFrEHKrmDOf7YykNflImWoxLlarvgwD9N6hTcsa4343oDmIsOspCMjaodefMIdfmSvSHiMX8i4XHF6VbG2DZOkFMwT4HFZ+bMaxC3+8my4AJYE8CtfJorcOg3Nm0DR5Qb7nhlSeW9jaycL8TWVai1DVCKEeazAu3VzDxWIO30xDwCundg6FtEK+D6H7Njist3rj2+A1cBb6yy9zxvhLyJnG+6fTDIb7iQMtLbwV6wv5C1EmRiLyTtXd9X6KqjUcuvawTh2EhASP2meH0qclm+OMwW/39MBW6WyVw5D3NzJ0xVcJhY7BvPsWxrJIcIOVz4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB6742.namprd11.prod.outlook.com (2603:10b6:a03:47b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.6; Tue, 9 Dec
 2025 20:32:05 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9388.013; Tue, 9 Dec 2025
 20:32:05 +0000
Date: Tue, 9 Dec 2025 12:32:02 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Brian Nguyen <brian3.nguyen@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <tejas.upadhyay@intel.com>,
 <shuicheng.lin@intel.com>, <stuart.summers@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>
Subject: Re: [PATCH v4 07/10] drm/xe: Prep page reclaim in tlb inval job
Message-ID: <aTiHQkJ1Z2QkfM0x@lstrano-desk.jf.intel.com>
References: <20251209200815.2570770-12-brian3.nguyen@intel.com>
 <20251209200815.2570770-19-brian3.nguyen@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251209200815.2570770-19-brian3.nguyen@intel.com>
X-ClientProxiedBy: MW4PR04CA0243.namprd04.prod.outlook.com
 (2603:10b6:303:88::8) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB6742:EE_
X-MS-Office365-Filtering-Correlation-Id: c8b9afa5-8d06-4d6b-4cb8-08de37620434
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?U2cX+qTGpZ4NPYrTwPGEJNiGOChmLEZVf+XVgmL+obRFPtLJj9nxE2xMz1Kr?=
 =?us-ascii?Q?4jGjKx/Ta5EryoPYo+zhFh0ag0sv6nrWHDqCXuMmWu88RqRWKVRxDZaf9xWL?=
 =?us-ascii?Q?vHMvP6y+CWW6Zy1c5Tel2dGnRnXfDqzcliouRjGzbPy9HwcJKQSPJbMbIo/t?=
 =?us-ascii?Q?DYztcYVRoHx7DI7xamOTGkH+oDfLoFFJQM0vOWWrOul0blhF0YgQ2NzKSRDZ?=
 =?us-ascii?Q?3kwpIdiE4yzY2L95w2Btgo3Pme50Gf7l0boZVf0atHLCmA3Vlk4CvF3+ZObg?=
 =?us-ascii?Q?cCDY2FelHrDKJPQN9nwsoLeM0xtp6K+vRemxHUdRDEo5Z4F0+TB45JFrWH3C?=
 =?us-ascii?Q?geO2uFK8KIdLyTnPzFuxpJEmJoFYdcxfJcACFu991J5nLAxP6hfSbK5HGCGV?=
 =?us-ascii?Q?DpWhiZdoD9TNcYjbW4K+XKnaGxMGKrqEHXzr0jrnZX5CHCJyzGPzCFOgUM+I?=
 =?us-ascii?Q?/tYPQV8UesOfECxW7VguRU3zgbuH0TCZ8CuHFg8lVKPYm4BftVE7mSUL1OBE?=
 =?us-ascii?Q?rT1aEMQC0TPyzs8BSdxM6hgQeBvsbVK2JEocaW8EVhYD6Bo147lrFBLMgOAx?=
 =?us-ascii?Q?+Ue8Ttg4sBtbf2Vg7sziyA2twDtu29CfdnKcF62iWWNncfuP+llm871OGih9?=
 =?us-ascii?Q?jRbsXnFuFwZQ7jMMb2MRqqIx5EbPafCpPtuhwih3olM9wTasmMN6GmmPqvKv?=
 =?us-ascii?Q?VbQOxdA0scm+sBNHVl3DCsygFU9KJ3Ibar84RDUTzJ89+LgfOWrN+9vSd+w8?=
 =?us-ascii?Q?lR2DALc9CbaZUWtxkf8mfQ435vQVn5dwwDM8Db9MedaJe7frZY3yA17A43g8?=
 =?us-ascii?Q?mHkd77QIf6Qb8juZGX0M9wOg0+RbjCJ1/1MkBNUA0RJ+YlaIAs1H8MIsvaQ1?=
 =?us-ascii?Q?89X1ONj8XiQ16rPSBwspZU/qeMxJvqSMZP0Soz3SMl1Nlefe5N3gmuWdhcyl?=
 =?us-ascii?Q?jLW1b2LVXBKFBv5diDYCZxwYbJ6PwqQ+W6zLPd7AFOBv0O/E8YOpr+YiRD07?=
 =?us-ascii?Q?4r8/x0VIg90vU7ZvHOMFBrniqz8X2a+MvHMvUX9Wb3NOY0jvPxn8cWb7kWEG?=
 =?us-ascii?Q?GdmNoctLdUPx2NW+nC0KTAEHDorVTi3YRDZRFE9WomvaIuFCuTMlDzj9WTVM?=
 =?us-ascii?Q?wRnZBAR/0jhDsj9dGDtWMtDNXWuOKikjCexxlsiM+wpUNWVFo844vkV8qWFL?=
 =?us-ascii?Q?FC+qRSep26poLA+K6J8e2WtNEzo0TvNYXXw82bBEpkMKMcmjfUgmKXdJ652d?=
 =?us-ascii?Q?ly4SFYABwC3ARw0aNvMTJgzq6Gwp2Aw3nyxliNWCkvVh+s+F0MJsI+1v8bKs?=
 =?us-ascii?Q?rRsdeQdyAEnFBxqEltjBipiG+BDGz0sfcfycVzU3IMV/S98HZdn/DwqDpJ9d?=
 =?us-ascii?Q?J/oSwDmdsfRa3L05h8ugjIFgrm8YLUNsjQhHe6eFMY2kYO7qeeyq8NcOypXa?=
 =?us-ascii?Q?wztus/niDl6GI6uex+I7xJaEWpO5N6nf?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oQqL2JzPUU32SyIwDkivpMcTwKsOfFR/tJdRAyZCKl2C/ErY4JRGmEVcENam?=
 =?us-ascii?Q?FlWgN6YDY5dFycM8Id26BwSAGYMWV0/L1YpViLwoRBJT/OqKqH2tihvo4Srx?=
 =?us-ascii?Q?vC77ROkqIcmFA6TPom98zAMmvIMwMlHqVtGXY09hzvD57Egg8MYZ78tQYtjh?=
 =?us-ascii?Q?/UlB1zxaK2AhrGw7RaIlgHL0Dvorq3a7vxaZdVHwj9AR5jssjuwjluOVKXzK?=
 =?us-ascii?Q?nKFjFB1z+yOO/xBukGkpLjCk9WpIcB33J2un4F2yXqGLfnDIuEiMXGtmrkPa?=
 =?us-ascii?Q?uNE/meEgZKc7lBsidHpG1mOUDabPK0ee/flWzes4Qj74ZzXZHM/LalvTXxsI?=
 =?us-ascii?Q?bBzSeDCEnFD0YfC3IIUb7Ep4SV4vMyycijWNFUAhyXmTi8j+tgmoGB8/aS8U?=
 =?us-ascii?Q?qFEfaeXKT8DRqQzLBmLJwWTQmuFxAQCLgp9s4ogBpyqNQ9cJObitEzUaE3X/?=
 =?us-ascii?Q?xHOradmOLAzz44Z2r6gehcPpImVmdyKKyiyzDS1OhtkV+zbD6GVRTolLhe2L?=
 =?us-ascii?Q?s9zG4Ehep+tqUenywcIT7LnDpvvUtP97j4MgalRMEVxLb+NckIoWJWDs5Iwi?=
 =?us-ascii?Q?9DYvJ3mFZ2lOp3R1/8D+lJtdZYFw6kSMBCKQ6pl2e9vuUq0ceE9/ErVGr2ym?=
 =?us-ascii?Q?0d+rrtKE2/ed4yxsU+/c2aK9T6iJFIG+gJUzqMAfJ014X828IFHEQOdUoKZR?=
 =?us-ascii?Q?AS+H+zzf1wie1VZuXwhMGi/DG9VYzRuNfG70JcxlT52ooHvZFQri2PAslHdt?=
 =?us-ascii?Q?ywUDtE8cXGgGpJC6x5Ubt3jqYsnejF1XIjSBHLDk1UMXBXSoYuH5WUtD2zzQ?=
 =?us-ascii?Q?BQFKDQqxpp8Z0k4eRy7wEteqRVXlIOoMVY9xJ31H/gbdfmIwoP6MP1vPN27/?=
 =?us-ascii?Q?sdrrzm+v5AkH3OhFJimISSE9LTKE9/nOGYS0iJofMQMBjXVGhATPbexVW4Wl?=
 =?us-ascii?Q?zT+Yw1O2wtfJu28n3zrJHdclL53UA7ysLYZbSOn99qq8TxnK9Bzqf1DtfKUI?=
 =?us-ascii?Q?Ibpj3HgeF/OlldAIPoLcLT+iO9mp5IwxKq0q30RG2Kb0rawb9JRsex3N1yvQ?=
 =?us-ascii?Q?8SKwJYS18jSRIc82o2DY1TrBGulAAIn0OZxnciv0bqlmQKM4OhzueEz9LrUf?=
 =?us-ascii?Q?xOl5eFIt4X/TEy7Pizc38AY/iYYnh748CK9Rw4yuhJuC/zYOm5WzC6SuTjOz?=
 =?us-ascii?Q?b6moY9kYqHf8Hm6XMqO+AEHmlzGIbqB3K2tQ9g/ahPcWyU3lv79EtsWUJeiI?=
 =?us-ascii?Q?8hANA05AaJr/LhRsu4xAt2L4tPXHXriiUSEn2b/KzJfJjkRs9inOOE73sjXM?=
 =?us-ascii?Q?4/ZUThf7IRnlTrSSm2C4HYvs+GcC/v3z6O3uSkfwdAq3DOR8sF3DNPp/WFPT?=
 =?us-ascii?Q?4zG14gGvjXY41BTYRXM7j7dutqIB/oQr4yp/CD2Fdisg389hO5zjiddP7xK+?=
 =?us-ascii?Q?upK2HCcStmJG97CrnyD3T6wWTZU2C7TGlOzMp+g4ygL+mULcmfjca3Qn6BG5?=
 =?us-ascii?Q?Ka31Of8irn6ffktSP54/fVsA2DSbIer0/pWdMrL8OYZgjuYEiPaGV6FP74qP?=
 =?us-ascii?Q?Ac3sqsdvG7vP4dTeyWpjMGYz1A8Hdvjm4FDdQpb9Zs8FPZINLxphQ9sypbtI?=
 =?us-ascii?Q?DA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c8b9afa5-8d06-4d6b-4cb8-08de37620434
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 20:32:05.0918 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pNDC6Ur+Kpo5LHDf+hySL7P6Cy4rC/AcGd3bp4UWEWId5W8K0u55sRBbfqDlCqpySDN0Je/EJXwi54EjTeRLBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6742
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

On Wed, Dec 10, 2025 at 04:08:23AM +0800, Brian Nguyen wrote:
> Use page reclaim list as indicator if page reclaim action is desired and
> pass it to tlb inval fence to handle.
> 
> Job will need to maintain its own embedded copy to ensure lifetime of
> PRL exist until job has run.
> 
> v2:
>  - Use xe variant of WARN_ON (Michal)
> 
> v3:
>  - Add comments for PRL tile handling and flush behavior with media.
>    (Matthew Brost)
> 
> Signed-off-by: Brian Nguyen <brian3.nguyen@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pt.c            | 12 ++++++++++++
>  drivers/gpu/drm/xe/xe_tlb_inval_job.c | 26 ++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_tlb_inval_job.h |  4 ++++
>  3 files changed, 42 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 5f27d0a64013..b774195e32e9 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -2509,6 +2509,18 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
>  			goto kill_vm_tile1;
>  		}
>  		update.ijob = ijob;
> +		/*
> +		 * Only add page reclaim for the primary GT. Media GT does not have
> +		 * any PPC to flush, so enabling the PPC flush bit for media is
> +		 * effectively a NOP and provides no performance benefit nor
> +		 * interfere with primary GT.
> +		 */
> +		if (pt_update_ops->prl.num_entries != XE_PAGE_RECLAIM_INVALID_LIST) {

I hate to be that guy, but would a helper like this be good thoughout the series:

static inline bool xe_page_reclaim_list_valid(struct xe_page_reclaim_list *prl)
{
	return prl->prl.num_entries != XE_PAGE_RECLAIM_INVALID_LIST;
}

> +			xe_tlb_inval_job_add_page_reclaim(ijob, &pt_update_ops->prl);
> +			/* Release ref from alloc, job will now handle it */
> +			xe_page_reclaim_entries_put(pt_update_ops->prl.entries);
> +			pt_update_ops->prl.entries = NULL;
> +		}
>  
>  		if (tile->media_gt) {
>  			dep_scheduler = to_dep_scheduler(q, tile->media_gt);
> diff --git a/drivers/gpu/drm/xe/xe_tlb_inval_job.c b/drivers/gpu/drm/xe/xe_tlb_inval_job.c
> index dbd3171fff12..40e689063a57 100644
> --- a/drivers/gpu/drm/xe/xe_tlb_inval_job.c
> +++ b/drivers/gpu/drm/xe/xe_tlb_inval_job.c
> @@ -7,7 +7,9 @@
>  #include "xe_dep_job_types.h"
>  #include "xe_dep_scheduler.h"
>  #include "xe_exec_queue.h"
> +#include "xe_gt_printk.h"
>  #include "xe_gt_types.h"
> +#include "xe_page_reclaim.h"
>  #include "xe_tlb_inval.h"
>  #include "xe_tlb_inval_job.h"
>  #include "xe_migrate.h"
> @@ -116,6 +118,7 @@ xe_tlb_inval_job_create(struct xe_exec_queue *q, struct xe_tlb_inval *tlb_inval,
>  	job->start = start;
>  	job->end = end;
>  	job->fence_armed = false;
> +	xe_page_reclaim_list_init(&job->prl);
>  	job->dep.ops = &dep_job_ops;
>  	job->type = type;
>  	kref_init(&job->refcount);
> @@ -149,6 +152,25 @@ xe_tlb_inval_job_create(struct xe_exec_queue *q, struct xe_tlb_inval *tlb_inval,
>  	return ERR_PTR(err);
>  }
>  
> +/**
> + * xe_tlb_inval_job_add_page_reclaim() - Embed PRL into a TLB job
> + * @job: TLB invalidation job that may trigger reclamation
> + * @prl: Page reclaim list populated during unbind
> + *
> + * Copies @prl into the job and takes an extra reference to the entry page so
> + * ownership can transfer to the TLB fence when the job is pushed.
> + */
> +void xe_tlb_inval_job_add_page_reclaim(struct xe_tlb_inval_job *job,
> +				       struct xe_page_reclaim_list *prl)
> +{
> +	struct xe_device *xe = gt_to_xe(job->q->gt);
> +
> +	xe_gt_WARN_ON(job->q->gt, !xe->info.has_page_reclaim_hw_assist);
> +	job->prl = *prl;
> +	/* Pair with put in job_destroy */
> +	xe_page_reclaim_entries_get(job->prl.entries);
> +}
> +
>  static void xe_tlb_inval_job_destroy(struct kref *ref)
>  {
>  	struct xe_tlb_inval_job *job = container_of(ref, typeof(*job),
> @@ -159,6 +181,10 @@ static void xe_tlb_inval_job_destroy(struct kref *ref)
>  	struct xe_device *xe = gt_to_xe(q->gt);
>  	struct xe_vm *vm = job->vm;
>  
> +	/* BO creation retains a copy (if used), so no longer needed */
> +	if (job->prl.entries)
> +		xe_page_reclaim_entries_put(job->prl.entries);

Nit: xe_page_reclaim_entries_put has a NULL check.

Matt

> +
>  	if (!job->fence_armed)
>  		kfree(ifence);
>  	else
> diff --git a/drivers/gpu/drm/xe/xe_tlb_inval_job.h b/drivers/gpu/drm/xe/xe_tlb_inval_job.h
> index 4d6df1a6c6ca..03d6e21cd611 100644
> --- a/drivers/gpu/drm/xe/xe_tlb_inval_job.h
> +++ b/drivers/gpu/drm/xe/xe_tlb_inval_job.h
> @@ -12,6 +12,7 @@ struct dma_fence;
>  struct xe_dep_scheduler;
>  struct xe_exec_queue;
>  struct xe_migrate;
> +struct xe_page_reclaim_list;
>  struct xe_tlb_inval;
>  struct xe_tlb_inval_job;
>  struct xe_vm;
> @@ -21,6 +22,9 @@ xe_tlb_inval_job_create(struct xe_exec_queue *q, struct xe_tlb_inval *tlb_inval,
>  			struct xe_dep_scheduler *dep_scheduler,
>  			struct xe_vm *vm, u64 start, u64 end, int type);
>  
> +void xe_tlb_inval_job_add_page_reclaim(struct xe_tlb_inval_job *job,
> +				       struct xe_page_reclaim_list *prl);
> +
>  int xe_tlb_inval_job_alloc_dep(struct xe_tlb_inval_job *job);
>  
>  struct dma_fence *xe_tlb_inval_job_push(struct xe_tlb_inval_job *job,
> -- 
> 2.52.0
> 
