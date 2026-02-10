Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 069E0EB2700
	for <intel-xe@archiver.kernel.org>; Tue, 10 Feb 2026 21:22:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC5F810E5F6;
	Tue, 10 Feb 2026 21:22:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cg+NkkZl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACE4010E5F6
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Feb 2026 21:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770758552; x=1802294552;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=FK9eiCIGyQLQ4bfo6cLrF/fH0pe/SK1v/Ufq3HcTofQ=;
 b=cg+NkkZlqZ5SkdgHNcxJJRFPieo+d54RvkqGyhliHm7Hf/1g1ss7+fmx
 04LzYwk0B32z9zjHHAZIOSliSvnqOO7N2/LYstZiGZp8amZTQ5hlIcU6b
 0yt5JzXa5nZmkIJuGOvHXXbf31zFGWGIRfVU79lWX/FFd3dHVuG8Qo0k1
 3ROLQlQRGgOrNfhGRN2pyGUT3Wk99EvFQVvcVeo2QaERoLnp2kWiFPYWd
 EY7l00h95lpqEcSQE6VXlgqVLbTSfo4x/gD92Elb7lMRLT3+YhJ710IxP
 Dvd19zVPhtlhrtZl5NePW9Zz3XnLXECkBdSyUhAMOKwBDpPPzOYbXdoWh w==;
X-CSE-ConnectionGUID: lAgei3hdQ5SkRS4l1j45YQ==
X-CSE-MsgGUID: KDv1iI93TcGyz7np3t11Mg==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="72088245"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="72088245"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 13:22:32 -0800
X-CSE-ConnectionGUID: 2lK9FJSGQqSeUIDIZtxWVw==
X-CSE-MsgGUID: diLL8IBOT8ugJDN+9KoZeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="211868498"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 13:22:32 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 10 Feb 2026 13:22:30 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 10 Feb 2026 13:22:30 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.31) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 10 Feb 2026 13:22:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U6P8kiiczcomhQqtmNGp9gL/ZhqxioFl9V59UEoJRxNnznGIuIwtVxCISxytFrQcy7RKjBLzwSJ5Es+RN3vvKRiscSZFo1Y3Aci2eFaFdSnrPWpd8PtDroxBxiGt+OHF3bCb/XRyZETOaSc0IV4T2S+pqBl63wIQw4pMZBjy+Jl1ih8bKV8ATiAR7AyDDHcMHbrnIK5U8XCO/+g+LYeFedHHmD4QIW/Vu95eP5+sPxMfXJk0cLxqbZuBQAz2/nkMI+TIVS3Q2g603Eov/vpV98YWk8rDmes1boGLoJVhxQ4n6+R6fyLhHPvMsstFaCHkDh+JERKMXNP+Hvhxqdu6Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rxbT/nvWJkJpJqHem6SN4OxhtKlYseiiR403MJ2tgTQ=;
 b=MZjDjWvzO7DgbTm9B1aXxC6zbu/bsguIY+YZAA2mThNLvmaW5YIXL0AB0dEOmHJLphX6x1PPJQWqID4xgmoQiXaxf2zFqkJIL0VsElQSow3WvXYHhx4XLvDk7ZnqxKTTu1szMiSE5+DyToE+TWO/9zRkqg5kvLoBHp0vT1QIw65z24Nf+/sA52MRuAx60ItsL9wnwOEZgE9WycoSq+uHrmpLiWFWdVAKJBtJGBPgnfT7svaFIVrbzgzknNme2yBzifSJgTIyuHV8zYkGfhVg1kQ81JK3yM9trk4k5t3QbTGmoJWjlX5jWd8LMiz/P0Clj1O5Kwu4UwKxZifcaxOATg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH7PR11MB7570.namprd11.prod.outlook.com (2603:10b6:510:27a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Tue, 10 Feb
 2026 21:22:27 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 21:22:27 +0000
Date: Tue, 10 Feb 2026 13:22:25 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.auld@intel.com>,
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH 3/3] drm/xe/xe3p: Skip TD flush
Message-ID: <20260210212225.GD4694@mdroper-desk1.amr.corp.intel.com>
References: <20260210125120.1329411-5-tejas.upadhyay@intel.com>
 <20260210125120.1329411-8-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260210125120.1329411-8-tejas.upadhyay@intel.com>
X-ClientProxiedBy: SJ0PR03CA0225.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::20) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH7PR11MB7570:EE_
X-MS-Office365-Filtering-Correlation-Id: c8542c17-1716-476a-04b8-08de68ea7ddf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?RaOvVmohlZipVvd2wChKRyQVNwqq6JgtfgM7oHV/QriNNfQ4CEQpPi0GKIkP?=
 =?us-ascii?Q?LmRH/+ivjhMuasFHjDBxXk+OJ00AnIr3lXuh13THNTedZdlqC5GzJn+sqwnW?=
 =?us-ascii?Q?+7tcfVwx9tgROrcxWhOM2QdPl4+cJJQ6epaBgSmQ5vpYnlEpbQiNZI78p0vu?=
 =?us-ascii?Q?R6KwoSKZ7KaR8iLSEIWzmR724g9SCvf+YJXXX3hkE6202WiOZc/S4bTDuqdo?=
 =?us-ascii?Q?FYIYZo8vzCFr2MSBhix35M467a9hr1KVQMEHpUIodRwzYCGKn3I34Kh4p6tx?=
 =?us-ascii?Q?q+lsnIo1qxGQ7/BnDCi83qSR2pCuqf+tmHr4oV241tRIXHIKDDYS5AukMb0y?=
 =?us-ascii?Q?PoIBj33X2R+JHkD/JjlxI0vNb0T2yVjBzT3G6jsggVceLvNfGCws3PYmfNCX?=
 =?us-ascii?Q?Bd/vghsMyaRNNwHtAmJhrk1d7Vhh9pEW+lZP4+o7kCpu4EKu+d/r8SsKwexr?=
 =?us-ascii?Q?r2R1d537RdzxKmh4IgNNrGYlgbLLrSMvgS3P/lnkQ7lIwZe6IrdpB9/FHQGc?=
 =?us-ascii?Q?FqgZ50XCpzr4CmQCqQbJFUPlybPIWM4ACCCwq/ZDMyeqN5HCIxRDnMA7rEEt?=
 =?us-ascii?Q?2NrAME8pkfRWSjfCoKSW5mhpCNV1v7nU0Vbk2oyMG+EsLqpB3dxAMMtdpGGz?=
 =?us-ascii?Q?XRN3D98eLYabXNXeK7NqKQS/VA5RT2iCbOUnH7MLSNcGaMQo9kwSeHBv0JFI?=
 =?us-ascii?Q?G+LwKU9gcwyXpS8y4fw674Yfil8q0OAL/K0ziNi+saQ5sDUCDfbe208Dv7I1?=
 =?us-ascii?Q?EznBGdcicU/pTe+euNyCEX/7lSwDUrJtN8UyBHJ8tsn7IuSHCGDx2wwpWGyZ?=
 =?us-ascii?Q?yPH8/K0+xUvuOhFZH+tklqcAVrDMFpecVIFpQ330mhWD3rD/BxqoIIIYQoD0?=
 =?us-ascii?Q?qJ7DlcO38xHexQ6a4Mrqy0OAdN3lqE4gBvUI5Gytw4NGLfwI8rDtnCMaaJeh?=
 =?us-ascii?Q?IV+Yuxbh/+0u/bBc9mlpFR5ITEQI9z64+ca4bTNC8FTbZBNe6q1az25Qhrok?=
 =?us-ascii?Q?b/kyFo4Ch3hWyyxCxsziqlidt7E2yaOnyIyqRGpaS4/5zYj3jbwxNdmaPDfn?=
 =?us-ascii?Q?Ae7Lr4zpHDV0kYCq2NN5QraAafN+UcbYxT2ce1j7HPpkjvxpyTqa6jkEauUE?=
 =?us-ascii?Q?y7Yjpm9Z2fIPIRWGpbg1qFoVZ09I7a++kmlXWDel8yOOktJjByivPNbfiCCY?=
 =?us-ascii?Q?dWpYuwQ2oqanKDY/iiae4n8HTgiAlTYXhooIxAgZ9EIWgsOcKyD2wjtK/rPO?=
 =?us-ascii?Q?z+Hm5dsKFhIYiyuNkblM2Vi0NEXpqKCy+5+SJGGvcwVsZObLVVudLstrMd54?=
 =?us-ascii?Q?LByAta3OFyUG2AKU0X5Ar6ImcFC7kyBayX0USvy0MFi+V12/gRE4XEElUoU6?=
 =?us-ascii?Q?WDKG1yqMCJS82Rw1PGzEc0w2IIe5qfV1O5J/cp3FxVOgzsEEoJ6X97lzCzI9?=
 =?us-ascii?Q?kZNS3Myzs+F37Y2GuHklronWjBOCRJwT097fT5jiwGmxGRGNV4WcY65LCXuV?=
 =?us-ascii?Q?AohxJsvbKvt4WwLmbeFhx6OpymRzvVxXdIw/41gE5S8NViULIG17GuB5fPuw?=
 =?us-ascii?Q?G0ir9UrN1ifTYXljbM0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Vz7he2qYg783M/EMORZ0f9Fu56CcDK18TCXD6BQ8c1ONtEhrHI1Jx32wVtN4?=
 =?us-ascii?Q?So4LZ2fNiWpsIBJ+u3uEuDxTqoM97qQpP24mmlCNYAFyq8wc1c4G/68cUI2h?=
 =?us-ascii?Q?xWWe4RA5xjzeBH3yP/NWC7Zg4Oh9XZVWj7Mma7yHnxwjeEjwh3tEFuPaFcLt?=
 =?us-ascii?Q?isdGxKQA1lVaYdFGEcbqNGegfXX88DWkIKobfg/8AG8JML753nBmgai8YxzT?=
 =?us-ascii?Q?EBwvXDzePT3sMq1O026FDu6+lvFdf1id9tXN/mnluIzKGk3WF2QKkuGetFWm?=
 =?us-ascii?Q?H5wRZ64S7NyFRDC/wunIBkoEvxbcnlHdJUsD3bnCXdqPRJPqkJG5rf/RC8ry?=
 =?us-ascii?Q?AzenKhuyslBmoO3CGkhDTntYJt46/7Y3MHqt6XcM0rRf1yiN9vFQKB1LtEMs?=
 =?us-ascii?Q?1mtSRCVS2w5TB0nM8/axtAOz+Xw6YTsDpUHrel8XenMcfjfriMpgR19wyAsD?=
 =?us-ascii?Q?wR5EZPYndViepwZRv/yv5o+45HO9HZUwA/Za4smH8kuhU73KpQ5SBsaaBnoD?=
 =?us-ascii?Q?boP7hq/Svw5QKMGc2YbjywKArR8E9XS4unpqNcel0xxw+B4Ir7f2Q7AwW+82?=
 =?us-ascii?Q?01pzdPD4EzW0r9DqPqxE1vXOnJd6pG8dUm2Yu2mjdiTTjHY9PBs2OzeeMCGL?=
 =?us-ascii?Q?yX+jVX3uJ7H/Dl7zhdSipBmskEbjwRQ4yfqbNp9xEBPcXHM3xVJiAIyLh94M?=
 =?us-ascii?Q?knxLCxemj4dqDpLOygoQ6Wy71SRZAyKbaHEVPlG1T21LfL6gtOiSCt5ojSqS?=
 =?us-ascii?Q?RFs0y9TUdW0ntrjyDlnow/gk4RiubBTB1nT9WqbO49BXjZBEJmGl3GUH5e8q?=
 =?us-ascii?Q?Rgspj68QzowYughaMdlQeoDwqv2iOi9cjoKxquC6bNWu9737iGjUdolP1Nv2?=
 =?us-ascii?Q?CUOM4S79lBup58QpkcCSvrq+A+DrCV09n7e+/197xuE9VhqZWgEt3aLHop9P?=
 =?us-ascii?Q?FAXyQF3G3Ng04I3Dua1obD9x0S3gV0oGy414nZauNoOQ9rI3VYER5LtX9ks/?=
 =?us-ascii?Q?irazVmEJbn3oeLKNRcz7h6TWpDH+Z+KZshMGkgoIAuCnoKnUFA9J6hdds01N?=
 =?us-ascii?Q?g//EuzRzzjQ5tPtOU6cMvuZnc/c/s4dJI5+YuNtcLMGAvX3NWNcmdClYTC58?=
 =?us-ascii?Q?2Sm/faaxM+VVJaRABE5tJZz0AEXp3xGyy0OhcSHzYcg5c7WMy8ce+rMw78pH?=
 =?us-ascii?Q?vs/uJgYUZlNJl/za80HS+XV7Ze+DxPb+oqRx5BkZu3gzfLiHZ4arqQRQxxxP?=
 =?us-ascii?Q?YA6AWHhHTfMnxrYaLK+8oXbofpufuVLFd1ukfY7OjLfscy+5EySEcGJeBzzj?=
 =?us-ascii?Q?Y5nzcD+y/D24QaU6eUBBoq1Aainss47Cx3foO0rPcRcTWLywxq/cFSo7EC93?=
 =?us-ascii?Q?xC8yCNNSMdPZt2ly2KH+l6w1PFmVSWxGcW4722Hft1/TBzAiIprRGpZgBaf8?=
 =?us-ascii?Q?k1/bv0x3mrdsd0JEtmEtg324lRsW5aMx0/3E/GexiUGr+WJdBLjBIDbTVVkT?=
 =?us-ascii?Q?xCJqIJf9A9Qz9s6QPVI8x/4h5JBQL6mKtPcTabxom9KY0wMQSqkH8YYSQvA0?=
 =?us-ascii?Q?Qpx4jqJjXwjZM6gM7WFBHfwCgDLe/w9epT6sB3opsWiG6yXWQUpT6HQ/b3XI?=
 =?us-ascii?Q?9b1sZQkXNf+HIv2R1gJ9Owc2VsmeWAdlMRKO5FhsRQQOo14Q51QS9UYFwr9c?=
 =?us-ascii?Q?Z2hS+2+oePYQvkxESJZzae0xjvHqu9BOD+L2tqihCtUh1k18BgwTJ6wD7T6z?=
 =?us-ascii?Q?spj4u3iH+/XBMzV2U/SljjboHkNR7DQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c8542c17-1716-476a-04b8-08de68ea7ddf
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 21:22:27.7863 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7BuzumQwZwqm09ejYfHUUd9oD4KayQy2etlafvpNJjXbzuvMbsmfC8o5gLPRiW1z4aN/0U6Rbe0tX1Bi2nkgrJrhIdEwU2086wS6swbV8ik=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7570
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

On Tue, Feb 10, 2026 at 06:21:24PM +0530, Tejas Upadhyay wrote:
> Xe3p has HW ability to do transient display flush so the xe driver can
> enable this HW feature by default and skip the software TD flush.
> 
> Bspec: 60002
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index da2abed94bc0..483813d45474 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -1166,6 +1166,14 @@ void xe_device_td_flush(struct xe_device *xe)
>  {
>  	struct xe_gt *root_gt;
>  
> +	/*
> +	 * From Xe3p onward the HW takes care of flush of TD entries also along
> +	 * with flushing XA entries, which will be at the usual sync points,
> +	 * like at the end of submission, so no manual flush is needed here.
> +	 */
> +	if (GRAPHICS_VER(xe) >= 35)
> +		return;

I guess this is just future-proofing?  The Xe3p platforms we have today
are either igpus (NVL-P) and thus get handled by the next condition, or
dgpus that don't have display or XD pat indices at all (CRI).


Matt

> +
>  	if (!IS_DGFX(xe) || GRAPHICS_VER(xe) < 20)
>  		return;
>  
> -- 
> 2.52.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
