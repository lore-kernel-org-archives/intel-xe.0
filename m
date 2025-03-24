Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99AB3C36002
	for <intel-xe@archiver.kernel.org>; Mon, 24 Mar 2025 20:10:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47DE510E4CC;
	Mon, 24 Mar 2025 20:10:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n36zUUOS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 497B810E11E
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Mar 2025 20:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742847024; x=1774383024;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=KlcTPAoJqH36//vcHiSncsXJU9FVN/FP8mPTB88Y030=;
 b=n36zUUOSWN1XJ7cuXEilbyik45KVkyYUn+Dgk4M69L0jGh1y/ouuAhn7
 4QpGcLnamcfVgVivGNNfqUuwzgauKJmx/a7A43uc7xhgqnGgGV/B69fca
 tBd5PnAkpu/wrbmGKOhV8ksxSWkuww+CC7LFFGqm98QCWgons5Ppc1n0H
 aYSf1JBmDQl2ygx6fZ3kX5o6zLWf6Ch/3cbE/TGvtXLW30uijVa/e4aru
 lqIN/WS67vAKuDxejU/vxBvq6W1/mEQkp1tplHHTfIMfXMVKiI17uExr6
 D+j4t2IQopbAO0xw8Ap8QXSjrP4l43s13pfKIlqeu3V2b8A/MwRVkS+ul w==;
X-CSE-ConnectionGUID: WjgV62d4TP+zgi8pq/HTxQ==
X-CSE-MsgGUID: YrYQz4bDTfOZNhYpbnwldA==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="55450055"
X-IronPort-AV: E=Sophos;i="6.14,272,1736841600"; d="scan'208";a="55450055"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2025 13:10:24 -0700
X-CSE-ConnectionGUID: t+NeK3JWRo+MLy4VQy9OAQ==
X-CSE-MsgGUID: ZgFp1avyR9GsLHBK5SQ/LQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,272,1736841600"; d="scan'208";a="128837707"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2025 13:10:16 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 24 Mar 2025 13:10:03 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 24 Mar 2025 13:10:03 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.47) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 24 Mar 2025 13:10:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bfosE823vRUK0yle370g/h2UG3rejDg6COAnCdqpV/JdivYVrua1clLn+2/retZiF3jKdChvtb41CIgB9DoK3AAeMhig48J/sD+1wSsKumWNg8efasxJqcFJl8W9YKJGX6VjcSnofE6rL/1b25b+5m0SElaSC9Izrn95oWzUvniAKC67zkKIE6mZuQrgI3h2CMOC6F50hOrmzyCvxANvMM/oOraRcKHNUWh7vVOK3GYq7wHS9YAaTJWDPBqZbSnTZ+CZAll1ZWB9jabQaTyk8ISX4skCGt6yfIWeEcX2PynGdiYDV2UwS8UaEbCbETbRPPYxnGSOLtt6gBZWF7i7fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CxCyXJ3n8PglVAZv2cy+uKBx1cdwwQL7XfjFbLbN57A=;
 b=huFAoLCHzGy25Q+fYK88z1L6ulr509H6lf2OH1LnY3el2Qb40iwDTGxSEzgwAfsn36U1TB1w0aMZ5XM2clVR0yaD8e7PMPiZKhVJiAdaiuZxSFXjm98M0uEXXTn/GEAbKqSSRqx5DEpMWSsodRpqHIX4dWAkzKDKsTWrNZfc/vQ9Bioze2R4KrPZ+8wFhLBvmcCcwgeL5k9EPIq7Iqpmq8gH3HKi3E7rGbrJCzcSg+EQa2rI8NMMwOTHi4v6p6vKmG4skSCFBGt2fI2/xVp6F7Nr0y0kSFlc1z9AWPqcLwJRKzOduZBeCyJYxUJ0QbxnAoHfCh/USAZM6wb6yUf5aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by IA0PR11MB7306.namprd11.prod.outlook.com (2603:10b6:208:438::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Mon, 24 Mar
 2025 20:10:01 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%4]) with mapi id 15.20.8534.040; Mon, 24 Mar 2025
 20:10:01 +0000
Date: Mon, 24 Mar 2025 16:09:57 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>, "Belgaumkar, Vinay"
 <vinay.belgaumkar@intel.com>, <intel-xe@lists.freedesktop.org>, Riana Tauro
 <riana.tauro@intel.com>
Subject: Re: [PATCH v3] drm/xe/pmu: Add GT frequency events
Message-ID: <Z-G8FXgZY7WnhYTw@intel.com>
References: <20250312001408.804125-1-vinay.belgaumkar@intel.com>
 <vx26ng5q4asspsg6lktrj5ok73gbiy3bfg7icu4fybekyt4zad@5h4bsek2mukm>
 <4283fcec-5ddd-4d06-9eae-8e622e9695ee@intel.com>
 <azol66l3wmb6r6cy6kh2j5ooglx25bduwj2ybifdxtpvpej23d@jxw766ana4kv>
 <87o6xsai7y.wl-ashutosh.dixit@intel.com>
 <iizcoecokne5qgkpr7kp4misfdok67eo2scj5czijpo6vqitks@xs3ehyr3kcbb>
 <87ldsu9z1s.wl-ashutosh.dixit@intel.com>
 <bmooz4uz4lutnr3hnbcjj7dltpnlxmctd2unltcde3wxahcbap@htjihczan7ks>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bmooz4uz4lutnr3hnbcjj7dltpnlxmctd2unltcde3wxahcbap@htjihczan7ks>
X-ClientProxiedBy: MW4PR04CA0076.namprd04.prod.outlook.com
 (2603:10b6:303:6b::21) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|IA0PR11MB7306:EE_
X-MS-Office365-Filtering-Correlation-Id: cb4129e9-05f8-43af-34ed-08dd6b0fdbdf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?z9cuUYjzypNQXMjuBpXnQ88WSbG6xNFt3BGpyyzqP0ec+1GmQBwAzIA8Po?=
 =?iso-8859-1?Q?6ORadLJQEiphHJvSetfE2eHRa2onUzf2R8+D0mISOcuIV+16KmUDiP9YD4?=
 =?iso-8859-1?Q?5guCSHuADxxs+BDY6Jfca/evXvTVxVReYxXDBow/6gbJLH/Dd5RdGKb4Is?=
 =?iso-8859-1?Q?4gKpilR1f7gsZaPwErdairqjcXx69DH10LqwD5D/gYN3usazVZN9vcGJmM?=
 =?iso-8859-1?Q?6Cz4Q2C04TQKy0rph26eQKimCp2LWuEXl5sm6FIZSPGOqPsDhIG95CKUEj?=
 =?iso-8859-1?Q?zpFP/ZL5x73xY/LUDYB7XuBo+9y0dwXBVSwNO64mDc9+hRAS6c9Geow06d?=
 =?iso-8859-1?Q?86TD4EkhY6+y5O1z7D10g8HTKa5PwfYotUJ69j5oIy47wQTMsNUAUqkVAG?=
 =?iso-8859-1?Q?yxiYpcC/VpKLQ1QqTSx8ctrSC+D6VYvvct5w/Jt0LyMNfkMaLj2sAb7Ynr?=
 =?iso-8859-1?Q?uf8p4+vbEtxYbwoUDJg0nOS5geGRXgd7xkPhVd/V3QB0NIjo3IJoHM99sP?=
 =?iso-8859-1?Q?LJeXa75RQmsBjF4EK/rYlWBsLJtVuNYMyh+UiAC8FA6f9Lyi1uIb1yXhBW?=
 =?iso-8859-1?Q?VFiWapF/d8zc737KhPx0bLfhsnnq3rFQG23MdAj7oD8Jx/mUeveoAqRM26?=
 =?iso-8859-1?Q?sfrhiNhbhzLBPvWh7Zz3934yp6eaeoJvwDdqNy4Lr6MAp7QHrCU5ryFXSv?=
 =?iso-8859-1?Q?tzvRC3RhROXld3fSQ2T6Wj2KIEjNs1/xzCmuDeFKC5vxX4MuU69WV1lyA8?=
 =?iso-8859-1?Q?L+gJzC8CFEzXNNMVRi+bbORqMmrn8BuiNO0Erzg3pZ6USLPrs7fEqQOxme?=
 =?iso-8859-1?Q?fzG3slPkZh64e8QDqpmo/rXSWBC51I29OBQ1VnAyCKu7b9Xq1XZp3eQt0x?=
 =?iso-8859-1?Q?wkJ8g8/kR3ImoV1MdBDaQ7/3kYdg1MtgSexvrWClKcUpxnfnG8JLfbsyNN?=
 =?iso-8859-1?Q?hLl3E0BHGvZcxNAGwSaX7V2kxmZv9c1LykaN0fEZK+n2bWOoCDssUxgxcU?=
 =?iso-8859-1?Q?784qtNIJuEka7DL4msQalCY4P1gzRYfcWGET4HDsqQNESXQ5VK2WMSY3yi?=
 =?iso-8859-1?Q?ugU6ULwkqF+3c6OQwWD+cCjxJ784Fv4I1DqEIVS8JPf3ebnGpp4S2msmbA?=
 =?iso-8859-1?Q?3G8etPL4eOBzu9Y2xOsEowdHgOgL72F4T5dgm5vt9DmFynPGVJJxGCZIdV?=
 =?iso-8859-1?Q?lQcLDExtC9HQWOO4zllkmI+flM57lnN5ONDXWXx7Zhel3Z2xFyepircKn0?=
 =?iso-8859-1?Q?5R4A/EoZYY8QrjxRDUjDqUjDdrCtSrgwpu5hTNJo9GPiKr0yUbindauI0F?=
 =?iso-8859-1?Q?beMqzG0a3/EaJmE8Urgqre/xjdgaZTRShAo8v9KM6TzzAayR0IrCM2C2sR?=
 =?iso-8859-1?Q?wQBTAQiBFv72OaauNvbcF9//Zg9H4AJw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?iMVkycFYHAv3k3O6lPmxNcUGqlk1R4Ub87Unpm3oxhs5+gwGeU73XmfH2v?=
 =?iso-8859-1?Q?3aVsjZdApNV22snfaIY4ZwmnSo1OOyYBKvAtY9N8QqstnlsS3WBYkNYbtU?=
 =?iso-8859-1?Q?U3Hond398JTwpDQrenOUJOBmY/DSw116v2dU5xet54Arv+poHt8GBqGwKa?=
 =?iso-8859-1?Q?e0ZeZzRRTJs01w8KL62ukfkYi6CBGQlS03f5y+yVZDT+Ki4X9QH+hGm5g2?=
 =?iso-8859-1?Q?l0c7neJfWEXcJxC1jBpAGJDHCHQq92WG6coJhMRTja2wRteHYh/ESnCJxs?=
 =?iso-8859-1?Q?c5O/PX9EOqQsY9GSp2Rh36FoNGrtaAS+56rJ/qc4RPRGM9anRZ4CS6C7nH?=
 =?iso-8859-1?Q?rF5qnZbE9d3zK0naVizS0LM8bYIs1FQ8VEjDIRW2z/0Km0BqqBSBugmueJ?=
 =?iso-8859-1?Q?Wdrkj6O6jwiucOzh5LXXjDI3UZNnpZ6/HUgpVYeFeAz0lkWHZ73KFEhU04?=
 =?iso-8859-1?Q?ciAZ76FaVc+H6hazMU0ZJw9xSygUp+e039CG4ywnD/nylMqeewOQdrXQ6i?=
 =?iso-8859-1?Q?lX1LtpVDTGRbsZL0XXUwwT04jGU/088pBcmY3D+nSrmVRJFrsCiWbdRK0l?=
 =?iso-8859-1?Q?F33AmwS27YZ2T5MdD1OkEKTFC11JVlaq7bq3Wgkh83VTbOkC93jUAFCJqr?=
 =?iso-8859-1?Q?y5R56t3s6AkVcI3Cqc8pchHWQmmclXL4laE6/4xB8EfXnfxnfZWHy7CMLW?=
 =?iso-8859-1?Q?SjKmv08SY3qMKUviDIB1eHdVYhgbncFhhOgbz+nMLz/5us8wyl8UWesGel?=
 =?iso-8859-1?Q?2lrdt7j65gmofUHxSwW4vRh6yLCJuE071+V4g9Y0AK7sriyIImoOy+z61W?=
 =?iso-8859-1?Q?Chn0TVxsKb92l9+iBtiUMN+q/YdDQ9fYudFRWX47DiGVOUvelIetB7XVtE?=
 =?iso-8859-1?Q?RC+ByzgXDJk+wDjQhAM6vgdZKRr0lqz53fkf8oD0L6Jet8Yd81INkM0K88?=
 =?iso-8859-1?Q?JKxHwXDFFVSpqKMnQi/pJF1aR0zCqskxsI0iJR/n0xfAM9S5PyYK23ikiz?=
 =?iso-8859-1?Q?hQMpLHS6xNwWOqOtvuHaacLyHOPUeZtUfxNn1XkTCslTFFUvgJbzMM8Ybl?=
 =?iso-8859-1?Q?OxcBs9JqHhW8kxVzmgPj+FmHJMoDmQYqc9eAOfU+h5uLwOtiwl2umjuhxV?=
 =?iso-8859-1?Q?KNo2OhFN+NvlfPTw9c2FTXq+CKE/PC6aYpXpEhpzLX9a4fCFrU8yh+v/i1?=
 =?iso-8859-1?Q?oW7OSnX7EgvGgs1+zN5rf6TctIBrGHAL7OPXYnNqDuCKlhs/K+55J53ldb?=
 =?iso-8859-1?Q?3yp9QZb1dT4H33QN6MRvtGXXF4chRe0XqBRd2HUGXsBuIQ/dKUk9Ukk1lI?=
 =?iso-8859-1?Q?kGqB4aKI2I9t9NdJ3TnKFVtSXrt+xLNJYBhnMq0hpyerZ9Pba5i3/UXQNy?=
 =?iso-8859-1?Q?ZykOMpt8QrGGS3Gr7f6/Bp2EGKT9phauIjd7kjz1ihgOd65B05WAoxxwHn?=
 =?iso-8859-1?Q?vqhDD1IOFbzTD/qkpynSyOthj8n/MzkP7RqUVAUSjcRbbyg6HahPv2+TSh?=
 =?iso-8859-1?Q?yKIiwlJAiA2BnYn8LGU7F9r8GsmuBuOCI4hm3/rYPbKwicvBRmk8Ff6Mbd?=
 =?iso-8859-1?Q?e+F/2fCn6Zud/O/jhDx/trh6dY95mvxrmaokol/VUueDyuRJRpnVr1rssj?=
 =?iso-8859-1?Q?7/X2Yj1tM8eaj2zas8vaefeladAR9keVdUXdZ4NzUyWPZy6joXOolJlA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cb4129e9-05f8-43af-34ed-08dd6b0fdbdf
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2025 20:10:01.7521 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IWmtnsMAWZdxNTIuw2Mx5N83tNbarTAq4cSnGK4rx7UlSjz9mCB8jahG1fQYt1AWItEMILho/AbgXLzeAydu0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7306
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

On Mon, Mar 24, 2025 at 02:07:32PM -0500, Lucas De Marchi wrote:
> On Mon, Mar 24, 2025 at 09:24:47AM -0700, Ashutosh Dixit wrote:
> > On Sat, 22 Mar 2025 19:47:04 -0700, Lucas De Marchi wrote:
> > > 
> > > On Sat, Mar 22, 2025 at 02:06:09PM -0700, Ashutosh Dixit wrote:
> > > > On Sat, 22 Mar 2025 05:57:12 -0700, Lucas De Marchi wrote:
> > > >>
> > > >> On Fri, Mar 21, 2025 at 03:45:21PM -0700, Belgaumkar, Vinay wrote:
> > > >> >
> > > >> > On 3/13/2025 2:45 PM, Lucas De Marchi wrote:
> > > >> >> On Tue, Mar 11, 2025 at 05:14:08PM -0700, Vinay Belgaumkar wrote:
> > > >> >>> Define PMU events for GT frequency (actual and requested). This is
> > > >> >>> a port from the i915 driver implementation, where an internal timer
> > > >> >>> is used to aggregate GT frequencies over certain fixed interval.
> > > >> >>> Following PMU events are being added-
> > > >> >>                      ^
> > > >> >> why do you use "-"  instead of ":"?
> > > >> >>
> > > >> >>>
> > > >> >>>  xe_0000_00_02.0/gt-actual-frequency/              [Kernel PMU event]
> > > >> >>>  xe_0000_00_02.0/gt-requested-frequency/           [Kernel PMU event]
> > > >> >>>
> > > >> >>> Standard perf commands can be used to monitor GT frequency-
> > > >> >>>  $ perf stat -e xe_0000_00_02.0/gt-requested-frequency,gt=0/ -I1000
> > > >> >>>
> > > >> >>>     1.001175175                700 M xe/gt-requested-frequency,gt=0/
> > > >> >>>     2.005891881                703 M xe/gt-requested-frequency,gt=0/
> > > >> >>>     3.007318169                700 M xe/gt-requested-frequency,gt=0/
> > > >> >>>
> > > >> >>> Actual frequencies will be reported as 0 when GT is in C6.
> > > >> >>
> > > >> >>
> > > >> >> I think we need to document somewhere, but at the very least in the
> > > >> >> commit message what the event count actually is. Let me see if I get
> > > >> >> this right:  if userspace is sampling every 1sec, and assuming the gpu
> > > >> >> is at 700MHz for the first 0.5sec and at 1.4 GHz, userspace should
> > > >> >> expect to see ~1050 as the value. Correct?  I find this frequency
> > > >> >> handling very different from anything else reported via perf. Other
> > > >> >> than i915, are there any other cases you know of?
> > > >> >
> > > >> > Yes,  user will see a gradual ramp. One thing that could work is
> > > >> > something along these lines:
> > > >> >
> > > >> > @@ -324,7 +327,10 @@ static void xe_pmu_event_update(struct perf_event
> > > >> > *event)
> > > >> >                 new = __xe_pmu_event_read(event);
> > > >> >         } while (!local64_try_cmpxchg(&hwc->prev_count, &prev, new));
> > > >> >
> > > >> > -       local64_add(new - prev, &event->count);
> > > >> > +       if (is_gt_frequency_event(id))
> > > >> > +               local64_add(new, &event->count);
> > > >> > +       else
> > > >> > +               local64_add(new - prev, &event->count);
> > > >> >
> > > >> > This will give us instantaneous values and will not need the use of an
> > > >> > internal timer.  Should be ok to do it this way?
> > > >>
> > > >> yes, I think it'd be preferred. It's much simpler and don't prevent us
> > > >> from eventually adding an avg_* event if the needs arise. Which would
> > > >> also be clearer on what that is.
> > > >
> > > > Instantaneous values would show 0 if the sampling instant landed when gt is
> > > 
> > > instantaneous values make much more sense from the perf point of view
> > > IMO. perf is **sampling** them - other than the same thing in i915, I've
> > > never seen an event that returns an average (not even documenting it as
> > > such).
> > > 
> > > What would also make sense would be to support perf-record so the
> > > samples are recorded in the buffer that is passed to userspace. In this
> > > case setting up a timer to save them (since we don't have interrupt for
> > > our pmu) would be nice.
> > 
> > Afaik, typically userspace calls into the kernel for PMU counters
> > relatively infrequently, say once a second (1 Hz). However, if this low
> > rate does not yield good freq values (say freq is showing lots of 0's), now
> 
> why do you say it's not getting good value? is 0 not a good value?
> Should the kernel be returning something else instead of doing an
> average with "lots of zeros" and returning it?

well, zero is not a good value because it is not real. The register is zero
because the GT is sleeping, but that is not the accurate thing.

but tbh we are already taking this decision to our sysfs interface:

$ cat act_freq
0

But well, for this instantaneous it may be good... we just need to educate
the consumers to see the zero as gpu sleeping in a chart.
but zero is an outlier to the average of the frequencies that it will bring
the mean to a very lower levels and the charts collected with PMU will be so
out of shape to the point it might be useless...

> 
> > userspace will need to call into the kernel more frequently, say 10 Hz to
> > 100 Hz, just to get good freq values (all other counters are fine at 1
> 
> It should be perfectly fine for an application to setup a 10Hz timer and
> getting it multiple times if it wants to average.... I don't think it
> needs to be at the hundreds frequency.
> 
> > Hz). This increased rate of calling into the kernel may be ok for 'perf
> > record' but not sure what happens to say 'gputop'.
> 
> oh no, perf-record works diferently... it's not calling into the
> kernel with that frequency. It's perf-stat that works that way.
> 
> For perf-record it more like kernel pushing samples in a ringbuffer, shared
> with userspace, and then waking it. We (currently) don't support that
> mode in our implementation:
> 
> static int xe_pmu_event_init(struct perf_event *event)
> {
> 	...
> 	/* unsupported modes and filters */
> 	if (event->attr.sample_period) /* no sampling */
> 		return -EINVAL;
> 	...
> }
> 
> 
> > 
> > I think considerations like this went into i915 deciding to average in the
> > kernel.
> 
> as you noticed, maybe there was actually a lack of thought on the matter
> and then later it couldn't be changed anymore... ? I saw several odd
> things in the i915 side. Exposing something with a Hz unit is one of
> them.
> 
> > 
> > Also, if we are going to expose instantaneous freq, if gt is in C6 (when
> > userspace calls into the kernel to sample), could we save and return the
> > freq /before/ gt went into C6 (to avoid returning 0 freq, and returning the
> > last freq as it was when workload was running)? This might be sufficient
> > and remove the need to sample more frequently, though not sure how
> > complex to implement.
> 
> if that data would make more sense for userspace, then I think it should
> be ok. So, let's say gt in in C6, what does make more sense for
> gputop-like and turbostat?
> 
> 1) read 0 from the kernel and report 0 to the user
> 2) read 0 from the kernel and report min_freq to the user (min_freq they
>    can read once from from sysfs)
> 3) read min_freq from the kernel
> 4) read the last frequency before going into C6
> 
> Lucas De Marchi
> 
> > 
> > > 
> > > > in C6. Also instantaneous values are already available via sysfs.
> > > 
> > > with the caveat of a slower interface, but yeah... that's why I was
> > > asking earlier: do we really need this if it's already available via
> > > sysfs? I was told turbostat wants to consolidate all the data to be read
> > > via perf instead of reading a bunch of files from sysfs.
> > 
> > OK.
> > 
> > > 
> > > > Also, the way i915 calculates the average freq is itself
> > > > controversial. i915 computes average freq when gt is awake and disregards
> > > > those intervals when gt is in C6. There was this patch to suggest that
> > > > average freq also take into account those intervals when gt is in C6:
> > > >
> > > > https://patchwork.freedesktop.org/series/109372/
> > > >
> > > > But it was not accepted since it would change uapi.
> > > 
> > > one more reason not to fall in the same trap. Let userspace decide if it
> > > wants the average or not. If it'd need to sample too frequently, then I
> > > think we need to look at supporting perf-record rather than doing the
> > > average (which is actually an integration, using the rectangle method,
> > > and then dividing by the perf_read delta time). At the very least,
> > > rename the event to make the avg explicit.
> > 
> > OK, we can return instantaneous freq for now and if that doesn't work out,
> > add an average freq later?
> > 
> > > 
> > > Lucas De Marchi
> > 
> > Thanks.
> > --
> > Ashutosh
