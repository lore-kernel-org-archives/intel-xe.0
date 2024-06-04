Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1C2FC27C52
	for <intel-xe@archiver.kernel.org>; Tue,  4 Jun 2024 21:13:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F40210E0F0;
	Tue,  4 Jun 2024 21:13:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DdEPtvBs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B1B710E0F0
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Jun 2024 21:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717535634; x=1749071634;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=uPu9LSO5AALvwPUEsp1/1PiEtSnP5AKQJ5gWKwb88UU=;
 b=DdEPtvBsOnFVNQXEPqUKE/zA2bPhoK8AcwIr1QC1D4G8kRyE1xQbWFFM
 w1iu3stUNe5QxSOE7eFWqPkGQaugVMHzJNF3LlAsuhnJLjggY52f1qyuD
 XTbL1ZqY9v4dgsnHCkwCCGqrZptJLu9LclagFX5buNURhT26aMx0Wn8Dn
 Ydvl/4XJaPrPO2IpcRGzS/YXLoct4M6MlNHP6CjvsQHMm8LJVMjLjSF62
 gNiMEmQTAq3bd5ScjWmFQom5cDhne46N6L9mHSW4semQtrTeKDEkx/XJF
 rdjrCC3P/9E07FmRkV/KH/xk5Nv25Ry8D8AEFA6xTq0sb4PNop2eu493j w==;
X-CSE-ConnectionGUID: H1aejio+T5GYteWBDruoeQ==
X-CSE-MsgGUID: aY0Du1hQR7O9lENvXCrntw==
X-IronPort-AV: E=McAfee;i="6600,9927,11093"; a="11906311"
X-IronPort-AV: E=Sophos;i="6.08,214,1712646000"; d="scan'208";a="11906311"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2024 14:13:53 -0700
X-CSE-ConnectionGUID: 3LJMzD8aQ5quLCEJyxJFcQ==
X-CSE-MsgGUID: f8+2/h4qR7KH7nFv3gu9kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,214,1712646000"; d="scan'208";a="41789337"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Jun 2024 14:13:54 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 4 Jun 2024 14:13:53 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 4 Jun 2024 14:13:53 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 4 Jun 2024 14:13:53 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 4 Jun 2024 14:13:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MELoYFQ726oNL0IGJ/NA+p3NoSD50HmR8dWo/ly3Ep2jDCnI9RtKijmzuV/HOwjwTHxrNvWnUbdaikQS9jc/+MBH6c0CLir/yJktqx9MCtPI+KLvXyproB7M6kpGvMoOYMV+6IcCtJzrvSDOdIPAHq0tFLIk09p1zC6kBWVVTgRsvrfvdyJouwpXQNXn0PQk3Td4CtORrkOoS8z36mwr2Tl4ut5fp8l+hqKVgZtc3GWydNnGgTsM8U/WIagK13zww9XX7JTZvC3s+ps62az/KDYrQO8SIoSQr+4ZHZKnbeRmpL1kLnhLd/BdLYbWCFBwUyram5JWlls35w+6INZL5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tbk3IKmNIRGoltbTOkdU1ZzORF30tLxZ2OeU0j/ebQg=;
 b=hIRXr75H1qDMzjZ4RWFlSpYpl+dcET2Au8m6nMrmQGowlLl8tIqhQroH/IcnwclPmv89h6oTg/GQcs6ekR4aqm6+bH74n7lpeQthsAVWRzwfaWXwDUx5L1pvKzXWgTL+9dzn26Zy0f65yinwmxWyHHsuZvwopFCeJg1WlLjEPcywr4LhX82Tc2kGgdpgjzdpgPeT3wA4eXiDKnr4Adsn5OTyewqrjbhhVcbJ9KgiKTG/mP46FZsiRg6lm/UuuQ/vEmLlDwCcmRIBNN9JOlcc0DrAq1hofE2rME14dwvpCFi0hQEheSueab1mmzJTwKMiFlQt3cs5VlADm4R2PCgkVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CH3PR11MB8153.namprd11.prod.outlook.com (2603:10b6:610:163::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.22; Tue, 4 Jun
 2024 21:13:50 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.7633.021; Tue, 4 Jun 2024
 21:13:50 +0000
Date: Tue, 4 Jun 2024 16:13:47 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Nirmoy Das <nirmoy.das@linux.intel.com>
CC: Michal Wajdeczko <michal.wajdeczko@intel.com>, Nirmoy Das
 <nirmoy.das@intel.com>, <intel-xe@lists.freedesktop.org>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
Subject: Re: [PATCH 3/9] drm/xe/xe_reg_sr: Always call xe_force_wake_put/get
 in pairs
Message-ID: <ew5v4bxh7ocvaquhp7ghcuwexmkfdkzyp2giuanr3lhaetxntl@xlfupwcaraxd>
References: <20240604110225.29495-1-nirmoy.das@intel.com>
 <20240604110225.29495-4-nirmoy.das@intel.com>
 <e4a9c72c-ea14-4aad-9020-d7e503baa59e@intel.com>
 <63c1b974-491a-4349-bd13-d649d8dc2717@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <63c1b974-491a-4349-bd13-d649d8dc2717@linux.intel.com>
X-ClientProxiedBy: MW4P222CA0025.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::30) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CH3PR11MB8153:EE_
X-MS-Office365-Filtering-Correlation-Id: 2cf411a2-eed6-4290-95fb-08dc84db3b21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015|27256008;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?sEz9XI8OcCGetu+Hh3Y8Wn57do7ZCAVzeWV3hXalvrpmqPjIZC8Sn87X5w?=
 =?iso-8859-1?Q?hXMibHH0PUCgd9NGzgCIlTmdQw3IEGVOudwJFrjvdgbJgmCXmVqDBBo8Zd?=
 =?iso-8859-1?Q?nsVSgP97hhrG0hkbTkrGzLXHWuaLlABOC/s0j9Pdao9dR/4Atn6cteeOxt?=
 =?iso-8859-1?Q?Xh1YViOIiuPUiqyoq1IkBbFo5vLUfthlrr0jJy+AR2XnsdobOqN07KLnuo?=
 =?iso-8859-1?Q?lC3jtlyaJ+ZmdxyqmtZxuhqKa9IJTop27JcGYIPW256H62viLscq7ENSCO?=
 =?iso-8859-1?Q?QWKXjNf8dJZc9L+tD7m1PiddcamNFUoiw+EH/2J2ZMuCadzdl6uzUIdINy?=
 =?iso-8859-1?Q?PHmNDRhuDG/q3kwdrX8T6vitZbgwNOo49wLknsQReXwJ1nB7UPMAbbxMUV?=
 =?iso-8859-1?Q?boCG3VvOgv/YhozKWcZm3t1mn3m0NF9ODrcMgi3QaVUJYTVN8usyKVy/N1?=
 =?iso-8859-1?Q?ehilyLReFx1NLRvrD5yLFpLO3oiIbz3zPlzy00QVIxV9p4/5s6iMskXv9L?=
 =?iso-8859-1?Q?WyA3AF5jxhFx6Ircm89JcwJyAyKHfLcnZ8CqiGkCjHu3EKGsuCHmwR2qPl?=
 =?iso-8859-1?Q?DZsqLZxdEp2LssvB9vR+aBDAxTZzb4K9w30uqMuN1lLbb0p06clIo18Vxd?=
 =?iso-8859-1?Q?MAoGhk87Jroye8xTDbZiqt7fBfZMIUT2kP4nHSWB+Oefa9+kosyupxsv8R?=
 =?iso-8859-1?Q?Xp23PCaZkYPSA1VgTsSZ6UTbJA9xnMdHFrbv1HCoZXiPbyASZLd2/c2nPP?=
 =?iso-8859-1?Q?WwiMpOHmyPe8ddCZidUyR/2iCdVvPZotALGqyMis2Iy2oz6nIB3EnPfnux?=
 =?iso-8859-1?Q?J7nG8ULuso+thb8tE7e2XpkQqavqvhyePhBpfAyFq/YDGh/59LBACg2tKW?=
 =?iso-8859-1?Q?7BLZMmuD8D2kJmurQu810e6AHss1esxya9Oc/Rkb8J/d44zFqi9nWfsAQp?=
 =?iso-8859-1?Q?Wv0xgMeTbcGjmFQhA4wK3d9zve16A8vh7QE/mpTxtEJzEqEljxM7tO4An+?=
 =?iso-8859-1?Q?QtLm1II7xRic99oUTIsPJUb8OM8KApHrD3W4u1Jowh4kwuqT4c/BK7qaXa?=
 =?iso-8859-1?Q?e0RcMRyueO7SoTcct04EI1d+dVRNdpYgDExlAdNx2DJzoxeiel/Gd0SW3v?=
 =?iso-8859-1?Q?Yjbv5EuTQpRXMBIfJ+Kvabxlwe06ehLF2atZzOfBuC56QB5pLdJejUui3e?=
 =?iso-8859-1?Q?HH3lq4Ck5sGSd79LU7XN4B4OWFvieSsqRR9/PM4AgU4wkkxy9+Zk49Oitr?=
 =?iso-8859-1?Q?VabeuBpKhtlhtd488XGasMY1eEYSnhMyosH684O1Sp1P85xueTHZJtStrx?=
 =?iso-8859-1?Q?uLHTdfbYRmKxJWiZDrWP7shsSi5lASMwEX0zVD6agTvs+Cb0ADwYl0y5nA?=
 =?iso-8859-1?Q?nDCIi4uLD7w4S+9nUaSXlohakSZVfXXA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015)(27256008); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Z79NFa5JbR6mJ5rcw/Sy5jp6fQaFhpuMggCMxZ1khQtow2GkSjvPY3P6dx?=
 =?iso-8859-1?Q?GOviVRBCE+jZ71ZTc4iivS2v/2dkhrSDwE+MINyA6FQbRylKF/JkqV41i2?=
 =?iso-8859-1?Q?fJDMJPPgPLDehnId2L25Q5WRCCYNkNv8lMZtk2P2Fn1ZPlyQXH924EGkL6?=
 =?iso-8859-1?Q?nXKOePmx8mCLq0HzWDiHh9GS4FcQxLQALgxcK7uWTrf/P3iFOXe+bww8dp?=
 =?iso-8859-1?Q?ZvUbdS0Gnjud8FRm4hMG9EQoWniz5iqGV2vUSyKapBMoZIfq81xEm1qQ0E?=
 =?iso-8859-1?Q?sc92YzOElAZEcpCjQ43D60p5h75MM440pdM3LgX5pLTfFyKYLZdarY+s1g?=
 =?iso-8859-1?Q?JvRenxsDG3HyOomJZSsEjFEB/kq6mVvgWzyqtvnamagq0zgISvv+Lv+LbS?=
 =?iso-8859-1?Q?bWSntA5m/66YmjIEyIVJY8jNN0VXdFfFr0iuvVPhR8DMWb7tixu8AW67TX?=
 =?iso-8859-1?Q?Pm4g7fFHyZl8+5L7zkFoWZ0Qqsde2b/gpnaft7ktC14vM4OWPAT/z/yEy3?=
 =?iso-8859-1?Q?mAZdiLSIJ7AOoc+r6Rvj2sFiUutnXeLtPX7JGEWwx+veilOd8l5Str78gG?=
 =?iso-8859-1?Q?JAuyyplT2oCoyrPg2pNaSvMHtiBjYqeRWd04eXln668GPu38pm1hHn2NJN?=
 =?iso-8859-1?Q?iDntfQ5z1WNKzzZ/EGJIY5glPp5uQ0IFnixVkrcLQSi7zY/H9XIBqpJiB4?=
 =?iso-8859-1?Q?LnSMFG7ihrpd9v3RnVlQQKN+T4saJpbqMbavzY43eiiTFvk/MOQBI9kGcQ?=
 =?iso-8859-1?Q?9iZLIm5BjMwX+At1f6IXdWKaHV9vtBVthUccxpoRDogG9+NTHi/IKoujVc?=
 =?iso-8859-1?Q?oH8FtfXLKkciuUT9m717Deubhu7ZwggMK3ZsvN0AQ7/IYJ3VBkjPgmKOfF?=
 =?iso-8859-1?Q?wZum0Foa/jZOWIOjZUpKPdMU4eyKratS6N1yV8JUx3AKaTMkeQ2RHPpm4k?=
 =?iso-8859-1?Q?+Upl9nB22RDnrcNkYOL2BNRCFU91qFl1PJhti5I32IOEKoOWl5Wz7AZ6JQ?=
 =?iso-8859-1?Q?f6gjHh8jzOuk6muxAPtpCSYb8/YzxiWzGjAUjdQ4u9H4F+P4RegqalZUHL?=
 =?iso-8859-1?Q?9Smd3XMOOF6dVHJkhBTXT7Ww1KjEn7sSS9KFXiAUEB2vDuKluouiQsPwgK?=
 =?iso-8859-1?Q?FeKEQGSazEmSYp/j/qJNxbo8gIFtC6msQVsFaaFfxUjJf4e/xYC0Q3HV8K?=
 =?iso-8859-1?Q?LN2744SuCene8j9MRjJiM1QzX8O2Cf8zhgW6Knzvg3izeWjSJ5bfBUZEBz?=
 =?iso-8859-1?Q?P69U4DMfUXUH/Px7Z1G2NwimVtWnziurCsAFIb6ezljZtA9Y4MJjHEoGGp?=
 =?iso-8859-1?Q?PdEMEiGWP0qRC13C8gNybLLAY3nYbPveAnbVbJw0jWEk5I9NVaz0hW3tvl?=
 =?iso-8859-1?Q?X5Fw9lfsEbemxHtN+7mUJpPmdBoWsbHPJZaynMDqc6LR2Ng4s+JopANw0x?=
 =?iso-8859-1?Q?PnhFbW6Lo1JiDRHxegrHt5Pk8kJy779VCRKMqvPLJKlCaHhAXKBzFLkcKv?=
 =?iso-8859-1?Q?TiYjZO5m7oBljkULak0ATLSFt000+6heEFO9ZeX2mic8M6Oz/NwEKkyAyC?=
 =?iso-8859-1?Q?Q4G1lhYfvfOJTPbkFINy1/TWSMgViw1EpzhRftNLyHB88Snkg3qJu09gm4?=
 =?iso-8859-1?Q?OaG0BtaHRIfITjDQiyfDWSBqsehi1uth+UHEM7ixRy676Iy0X8RooQ3w?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cf411a2-eed6-4290-95fb-08dc84db3b21
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2024 21:13:50.7237 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ny4morZw6HaQ7PgOwOPqBhWKZYuMq+qG2AEUTYLZ9H+2BENp4mau0ipZSfe5Dd6cQjNuoMnzY7lAij6Z0flc0rj5ssgX/5WLhJ7U0y6u4pk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8153
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

On Tue, Jun 04, 2024 at 04:21:25PM GMT, Nirmoy Das wrote:
>Hi Michal,
>
>On 6/4/2024 3:12 PM, Michal Wajdeczko wrote:
>>
>>On 04.06.2024 13:02, Nirmoy Das wrote:
>>>xe_force_wake_get() increments the domain ref regardless of success
>>>or failure so call xe_force_wake_put() even on failure to keep ref
>>>count accurate.
>>>
>>>Signed-off-by: Nirmoy Das<nirmoy.das@intel.com>
>>>---
>>>  drivers/gpu/drm/xe/xe_reg_sr.c | 20 ++++++++------------
>>>  1 file changed, 8 insertions(+), 12 deletions(-)
>>>
>>>diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
>>>index 440ac572f6e5..8fcc08658d89 100644
>>>--- a/drivers/gpu/drm/xe/xe_reg_sr.c
>>>+++ b/drivers/gpu/drm/xe/xe_reg_sr.c
>>>@@ -201,13 +201,11 @@ void xe_reg_sr_apply_mmio(struct xe_reg_sr *sr, struct xe_gt *gt)
>>>  	xa_for_each(&sr->xa, reg, entry)
>>>  		apply_one_mmio(gt, entry);
>>>-	err = xe_force_wake_put(&gt->mmio.fw, XE_FORCEWAKE_ALL);
>>>-	XE_WARN_ON(err);
>>>-
>>>-	return;
>>>-
>>>  err_force_wake:
>>>-	xe_gt_err(gt, "Failed to apply, err=%d\n", err);
>>>+	if (err)
>>>+		xe_gt_err(gt, "Failed to whitelist %s registers, err=%d\n",
>>>+			  sr->name, err);
>>>+	XE_WARN_ON(xe_force_wake_put(&gt->mmio.fw, XE_FORCEWAKE_ALL));
>>what's the rule whether to WARN about the failed xe_force_wake_put() or
>>not ? should we also WARN when xe_force_wake_get() failed ? does it make
>>sense to WARN about put() if get() already failed ?
>We don't have one yet.
>>
>>maybe simpler solution would be make function xe_force_wake_put() void
>>as it almost nothing that caller can do and move WARN there if needed ?
>
>We have code that  does "return xe_force_wake_put()" So question is 
>what shall we do
>
>if xe_force_wake_get() worked but subsequent xe_force_wake_put() fails ?

there's not much can be done here. I even don't think there's a reason
to wait on ack for force_wake put... in most of the cases.
+Rodrigo, what exactly are we protecting against there?

If that xe_mmio_wait32() fails, driver is toast. The reason we check (or
should check) the return on _get() is because we want to bail out
whatever we are starting to do rather than attempting it and handling
bogus values of an IP that is not awaken.

So, maybe what could be done is

a) XE_WARN_ON(xe_force_wake_put()) -> xe_force_wake_put()

	We cann probably move the WARN_ON() inside xe_force_wake_put()
	if we want to maintain the behavior in most places

	Then make xe_force_wake_put() void as suggested here.

b) I'm not sure about the benefit of the weirdness of
xe_force_wake_get() incrementing the ref even if we failed to wait for
ack.  The only thing the caller is going to do is to call
xe_force_wake_put() and bail out. Why are we not unwinding then?


Lucas De Marchi

>
>Regards,
>
>Nirmoy
>
>>
>>what about making the flow more intuitive like this:
>>
>>bool xe_force_wake_get(fw, d);
>>void xe_force_wake_put(fw, d);
>>
>>	if (xe_force_wake_get(fw, d)) {
>>		...
>>		xe_force_wake_put(fw, d);
>>	}
>>
>>>  }
>>>  void xe_reg_sr_apply_whitelist(struct xe_hw_engine *hwe)
>>>@@ -253,13 +251,11 @@ void xe_reg_sr_apply_whitelist(struct xe_hw_engine *hwe)
>>>  		xe_mmio_write32(gt, RING_FORCE_TO_NONPRIV(mmio_base, slot), addr);
>>>  	}
>>>-	err = xe_force_wake_put(&gt->mmio.fw, XE_FORCEWAKE_ALL);
>>>-	XE_WARN_ON(err);
>>>-
>>>-	return;
>>>-
>>>  err_force_wake:
>>>-	drm_err(&xe->drm, "Failed to apply, err=%d\n", err);
>>>+	if (err)
>>>+		xe_gt_err(gt, "Failed to whitelist %s registers, err=%d\n",
>>>+			  sr->name, err);
>>>+	XE_WARN_ON(xe_force_wake_put(&gt->mmio.fw, XE_FORCEWAKE_ALL));
>>>  }
>>>  /**
