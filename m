Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7C36D1A627
	for <intel-xe@archiver.kernel.org>; Fri,  9 Jan 2026 13:49:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 942A410E8D8;
	Fri,  9 Jan 2026 13:49:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.b="boJwyzbF";
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="PhzStNtH";
	dkim-atps=neutral
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C18CD10E378
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Jan 2026 19:08:47 +0000 (UTC)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 608FnHeN424970; Thu, 8 Jan 2026 19:08:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=corp-2025-04-25; bh=INv55PKv9w1xAyzWNY
 QnFdNV72zrsOeZkE/mE9F9PWE=; b=boJwyzbFKAhNZ8ilszKFHyhe71b2u2j99V
 DZh2PbutsxaZYru5a5mtXbFcjWCHJ3CgqJWEUIta7NRGZgYK+E02EjQYqjYmvu2J
 2bp4gPjwdQemcoXfnooYDNCFTFkUe2xxFp3uA/GMZvhQW3tH/ECn3t2kBknOmDeD
 uQ0cPa7KUlvadh9ryXealJ4EuK8UGUVzztMOkfomuO+fC32tc1CqDk6TD/aK9AKF
 Nk4tHOA4A7S6mp0PNlECgjn7Nh9HKAXz9x8tHPF26DcEI2qDoVZDdjioQsccQ+gS
 x5zwKXq2NGyxVj4qmyytYMpuWPFgelxLrZmnkazzHwqC/5YKX+tg==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bjfjd8a1n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 08 Jan 2026 19:08:45 +0000 (GMT)
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 608ILhuk003797; Thu, 8 Jan 2026 19:08:44 GMT
Received: from sn4pr0501cu005.outbound.protection.outlook.com
 (mail-southcentralusazon11011034.outbound.protection.outlook.com
 [40.93.194.34])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 4besjbepj3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 08 Jan 2026 19:08:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ej6dmGxpjfy+Mk2ImbZfdAkmPBh3cKBoXDVqMNuW34It16BXhyVTHMTJMdRjXnImOAZWCbfNqcII4Tco63N2Y+mCJqMdIsDPdozPzqVLAT6nkMwxmcuwk4HYKJHaVbYj1B9JuiK88UH46QXlW9L0wZLA06dPlPEf5RatRXu4SDlj+0oQgF0xm2Hxhi9HPxkHZlFqBR4L9GqphMAbBFLEF021ITHoy0Dr7fJ7RhptM4lDGnealuY2PLw00UsTGHK23sXVpsPk7Zzt0qCHjfO7IGL8nhQbedZ6t6p5Ucuj1BkFY9Xo/K9xxDBwPg2ttrOGa0o7Q/32bVGb+nmRfYKLyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=INv55PKv9w1xAyzWNYQnFdNV72zrsOeZkE/mE9F9PWE=;
 b=THlEoQVm4UN+lZKnoOIUX+Tt+E9zBVue6g2s6S2y5+8lTuQs/A5Eob22n8kc5IZ0B36Ymj2WDvyJHEdDExiEbV45skHOx2l4AYiVt/JCBgpmUI/XOKgtkuTiW6Kgw6rAf4LAi8PDM/sm6PELvgNdLuwQDPEccE5e1wyvlevqCfLfNmA/CFbGDs7l61IsO5e8rUhO6FAnI0lWNUhvklRxUg07GbPxztOoloKD9Jl91Ghz1QK1EIWV7dKs2/U2wD0Bl/MBAtfIWr3D5kH1CdTalHeko9/rN0yYNVG+uU8l+Q9cuf/7OUxJaG9imuqLXU9cAfxpWfAtOEyWXIZUXo2GTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=INv55PKv9w1xAyzWNYQnFdNV72zrsOeZkE/mE9F9PWE=;
 b=PhzStNtH5IjqYpwB2vXEBs1pAeCmyfFJNTrtgsgNd0/VVAN1eKXsKL+r7qPVUofOFvm2V95CoLIYD9qzDNtEJ2wqzL/+KjuS2DcRAXIkjCr3VZ2Tulfe0WtUwtQ788f7qM9l4r8fddIIH+UHy/1X0WLhewloHA5Y8GesaaNzFuk=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by BL3PR10MB6235.namprd10.prod.outlook.com (2603:10b6:208:38e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Thu, 8 Jan
 2026 19:08:40 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::f3ea:674e:7f2e:b711]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::f3ea:674e:7f2e:b711%6]) with mapi id 15.20.9499.002; Thu, 8 Jan 2026
 19:08:40 +0000
Date: Thu, 8 Jan 2026 19:08:41 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Jordan Niethe <jniethe@nvidia.com>
Cc: intel-xe@lists.freedesktop.org, matthew.brost@intel.com
Subject: Re: [RESENDv2 v2 07/11] mm: Add a new swap type for migration
 entries of device private pages
Message-ID: <ed99b6b6-f722-470d-a40e-dddfcc9ae585@lucifer.local>
References: <20260108060102.41357-1-jniethe@nvidia.com>
 <20260108060102.41357-8-jniethe@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108060102.41357-8-jniethe@nvidia.com>
X-ClientProxiedBy: LO4P123CA0083.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:190::16) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|BL3PR10MB6235:EE_
X-MS-Office365-Filtering-Correlation-Id: 81d9c06a-0aad-41ec-1634-08de4ee9549e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?uLg3sKg8/7ldpsbKFUlFGIG/lh/A0yoLTwx/v4hgnTPr2JV7zRv/91yI9xja?=
 =?us-ascii?Q?ty1B90iQpbcrNp0cxNZBYQ8Wbe3oE7oXAa/YXVM5jeMP6AW1dbfZC2jqB2dN?=
 =?us-ascii?Q?JwtqZaCtfApWvyzt//I3VNud4nqC+htysvG7PREsNa4poxhuXv6T5MqGH2S9?=
 =?us-ascii?Q?BbkQr4xLwu4QnDp4fOYeXOYnsjq3B7rQ9HHqCO7QYQHxpfhUOqcHJWLvEfgo?=
 =?us-ascii?Q?fhISPjeYa/2j1YHIBLQwW/vukTOoZua5u+0VzX0Ou2Ze9wKkM4ItaNRmi0NS?=
 =?us-ascii?Q?EKdzrdrYg2e2YN64saKoYDcgTXQeMHi/6aUNOjSntqIPrPut73+0cjYz0ncf?=
 =?us-ascii?Q?UKPZLNMVYRbm0M/BnZiO6aR5qTRAI3SUWlo3WsA/rUWVjKt4l1koh+gN3/JV?=
 =?us-ascii?Q?zWBrPBas/z/n04gAUVpp4p9pTJvxyc5+r0MbLdjbkrDEliRaFlR6c4icpxo5?=
 =?us-ascii?Q?OuCKeTlyPe3q8rY8RT5tm2yY42nSsNDwWSdv526a2n/QRqd7+AjfyHhgqhgB?=
 =?us-ascii?Q?Pumt+jQnOeZMaUJsb3YtEvPNxYCgFxTbsIJLbZF+DGUunjHoYMs3//vbstT9?=
 =?us-ascii?Q?wC+BMMH65E8Uvb9huHv17eNuNzRlDQCgodis1EEHXjEWN67aegti64HXTgif?=
 =?us-ascii?Q?euTGDFNH6hMyIa3IRaMnzSOHxG8JILXOxzPaF9lM/hwqFgvLGscaqwOMCegb?=
 =?us-ascii?Q?DjuHdNun5YiC0trXITlwjELuFzd+kqzdLK/iLEDPfp8ce5bVu1eaMM3LQKGH?=
 =?us-ascii?Q?FCyDSj3QK9GemlYeRYRJItKmtHBkTBsdZRLHpbsrKlhEY9UOVTrSwjbrkwkj?=
 =?us-ascii?Q?WfGn0XkXW/acopyqdqvTn0WnnY8bhiQAla+MCABZtgiH9boJ9SGoEk/Ykx/Z?=
 =?us-ascii?Q?HlijDz9MRzdFp1r916tDkCrKxWuq82bnxNQtNoZc0hRvn21CvfyRl/SAgmOF?=
 =?us-ascii?Q?8cexUYgOVhkMiihrkWnvyL6RcnSOgDYtoWToRYkw2yvjpeXEAsbMFLnSJdoh?=
 =?us-ascii?Q?X1QdngKcVBBA2SwPgj1dvUo12Zyesn2l/oIcJbrxiSxarMO1NNV/0AJNByYz?=
 =?us-ascii?Q?4fLq4GH4f1BRUEW4usrLhU8b3GRUJaD8n2ffHv5rnc3XB5PYKtiWy34VxpQa?=
 =?us-ascii?Q?TOqBeDDQLV8H+VYHfLnn7PJ+L0+kMT5+SyoujtMwZ5SucnyQRpJT1eoLd58C?=
 =?us-ascii?Q?bXM0gvfR624pAtTGX6aNBkl2LrifdpNUKiZ3tw+bTAF8reBsKtahTZPCd472?=
 =?us-ascii?Q?ZYKAiUhBWjBBEecQYsGlLiD+MBhIVQ9g7JwYDxsyPBfMAc/iS80kg8LzCfo2?=
 =?us-ascii?Q?+YIOR+6w+7a993wGU6ZPpO2xya+jrflzsMM10zwttw0a5IJRDMd3yoomJick?=
 =?us-ascii?Q?BPtTObfJj3hQPfhHFfhGqGov6AHeK5trXcGK97H0h75YuTF0gqVSLAHAL3iX?=
 =?us-ascii?Q?Gq24ABfa5cyhh0QR4QJdjtVhbzZYXnqM?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR10MB8218.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?E0kzlW1gq1eCFu8AD8h0SSh3KmiNN/hhsWYTsmwhBOeCLmk3iO7l8fC0Cinz?=
 =?us-ascii?Q?gSeCse/kq0wUsV85jVYd+UBHwDFc3te+COESgbG32hFCIf0K7YUPZXlIJART?=
 =?us-ascii?Q?grs34s7pjQDTqOCAIlW3ytL+YxFIfKYPyZEFJ7CdUXXbZ7+aO5wm08+RLDEs?=
 =?us-ascii?Q?/xZ6UFVYqA/GzJakYAr/+PoGJkroaIQSXwpm+GbqVl5JZOzmpBf/bsxOyZ2j?=
 =?us-ascii?Q?pgorpGhQsnew64+a8Fgep4niyi6JLFK4v0qfS/5HPxYlZgE0MvSfHMyekMeY?=
 =?us-ascii?Q?IFx5XxkZhMt9P1fGQ8VBV0zhygrtaSCisnM/ne34d2xxBxKQ7LdlPSon02Qt?=
 =?us-ascii?Q?ycsdyINXkxaEUxayE/wG3FhgHPBtQJI6N0V3UdSifEbQXVULtrlXhAvLEOYt?=
 =?us-ascii?Q?N9LDHlHlElOl85YQTGC22iWkYGf/fGQq+LlW+m9LFIDj8PXdPNdzuLsSiOTM?=
 =?us-ascii?Q?Vl/RgrSnxQsAcZZeVfA6t1YEycgXw8y3pdpxvIXBfg0fPS6C3zks/QTiTuFI?=
 =?us-ascii?Q?vM3+fSp6pMSOfsdD9DIxi/agyO/sPx71gOUHKWP2R7OqRddvYO6WRycNTtm+?=
 =?us-ascii?Q?FVJ+th9xmitexi3ykohWZTrHYdI9YNO72k8PmTBhdtSIOhyf4VH2VslhV/go?=
 =?us-ascii?Q?cxQsJusVnIJ7yMMbUu8R2ACJlzPwINB39yQzXnARF76DOBP9ceqWsDukF5Ad?=
 =?us-ascii?Q?uTy5X85iq5x2CZD56k8D5TsKpT8SjEyLzm6OTXK7TuCiP3ob0ZoEb9JkwFf0?=
 =?us-ascii?Q?z6vvBvl1aX3vYF3qZhApzwr/x2VrfjxCwRzyxajf7T3CesWuiLatRTwymtog?=
 =?us-ascii?Q?rvCVpC8XTikHO21E46YOiY7jdVtM/k2ObMfB72Qk9zt0J0ALfnmgSqcZDA1H?=
 =?us-ascii?Q?u7Ra77e2nDttfdCQRbsLm4b46vuaShpMX5xAV6xYk7NaS8/gun/UI9kxWEnu?=
 =?us-ascii?Q?8YNdtv+2F1bQKEBzQ0EAh0bgiROnRI9Hq6xPQrXdO48zmzBZs0OAH4v5veq3?=
 =?us-ascii?Q?8Oty4GArSqK4JF6cdgjrAmRqeStAnVOz4iNeaLG59V5S/spnn0F2cwJED+6W?=
 =?us-ascii?Q?f6mk0UTNPEXoP7LBfYylUSZfPLkrls/vYQ3Y9poaiGlo3cqlTDDhgHXeMX9d?=
 =?us-ascii?Q?4gyyoCSpAOuFacdyMb26///RXNuAfpF/kUHr+go+AUhvlMQINd+I24n07gxS?=
 =?us-ascii?Q?4fFI4nBaADgnb4lSbITNC66cqZuhDpWy2sIUKEyqfjmWO2IlcNESpEkgVG+M?=
 =?us-ascii?Q?5I5/Ou4MHqzJW/Iog2er64Ltr/xDR4kpoHJLfF8EyARnBz7hWU1TwSRvVYFW?=
 =?us-ascii?Q?wEpR7VnQFxqVwxXkI8AqkwqQWf+cNqzMTk5bT+szj1S4PC9MDMnxBt9kamtY?=
 =?us-ascii?Q?mGeDKgYZwVs/tjGV8PrrMfRn94aU80d9WX3TlUDf8/vz3KDWeKeL4GzjKJW8?=
 =?us-ascii?Q?KYxrQFRavmqgtV9xq81EkYIwDRbl1k7imG/PynNq1v9N1ip9MXO80JmRmw+a?=
 =?us-ascii?Q?1/osM+qiBX//qWDmymyPkFymnckHwZyNF/BidW6APE+myZwAyQYtKx1iHK0b?=
 =?us-ascii?Q?Is0v4KVqXnI58l07sUUn0wOsI1BIsEj43ZzZPk9W1Bm/dEjeMdgp9j3XM83W?=
 =?us-ascii?Q?qEWtpedPwoBERwG++RKhrINUZihjDsn0sZ3NS7loy3ZC+ni8q3Tc5phm83aK?=
 =?us-ascii?Q?A/RrtnzEx4w1TAwkqvFjUG0o03iDEgSTtR2yOPAqmPYPkfJwah8qUU0ox+q3?=
 =?us-ascii?Q?W8dR8xHar2L9WfHnNSSps6EyFAQkDUA=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: QoU4vHOxU0IZ8GByaKyDDz9wLnKW83nFrdlnpK3dcUwy6r+QjGtQO1tnd8nORwuCvr23H76n+3cUb+ohE9GOFJUO/lVP7DVOcc0Cmwx+XXuL5OVY7vJKEtkLIttlKwk321/Ka1Lk6disobIP9z7RnvwumWYIN1OGppcsz+ENxrGxAjeCnTpnguAuXlkzgxa8//VspxUbSiONKXHW69LHhRv/uBMGP7yji5LfaHoVODdZypVw7t/1mFOrtDf9p5EKPsw6LA6RFQfuPvgWampkLQYq0HtVaaQPDfb1F7sgW91EabqI+0hARNy6GHyYJ1+NnNcluGPUYkfJdWrmfGWwIa/A0KniA9wySL58uhYq6FMmK0LKS55CeR30DjE+WfEPQkIOo1fSmApWTrFOFdVuDegy82C8joyNdec0Vp+Bws8JogMto/NfYOTyjdVBWMtAcd2mM9x2sx6EuvVKYEX5Dwh2oQTfTxf75ElH9uQkb8mZRqiux5EkEbWN7iyvO9c00ZNCnC5F0/PYHxVEzYasrNotYn7nDnDZAQtUsBEwK1SxxBYkA9wkdzysDvHMrOKNC53fu8UfnmJyydj8d4O3kdQ4ckeuGOcMuSVJhsTKfB8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81d9c06a-0aad-41ec-1634-08de4ee9549e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 19:08:40.5584 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rbyb+nIy+uqTdnBOABwtf1b3Mug1CDS8tHEWiDsPJYcFRPl1mEmuAegjhcIiGGfRwImiC8SCkNAt831oYo6ImYrNDQk4f91tOwXzUh0oPME=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR10MB6235
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_03,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 suspectscore=0
 mlxlogscore=999 phishscore=0 malwarescore=0 spamscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2512120000 definitions=main-2601080143
X-Proofpoint-ORIG-GUID: Q8O5JTmG9pVMr2ZHlXE-UbsJQ_qQRwSb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDE0MiBTYWx0ZWRfX+4M/D7TIs3to
 mx/TjThoLSoevq/KR19Rd7efelsWLLM1RFNG85Lrluqmn5UpL+sSCGUB6xpg+VH8ihQGJc2/Cty
 onw0QB2jWo6fApGOgXeriUVnvZQ6oPXNq4a5zgjirp8DE+v5a7/36kFxZWQoSAKCJn8iRHFoymm
 cotijCiPcaYitFepc1kCquXhvSiHZv+I/zYxyzGECmz5AkMiuyG9mm7E1E4A40oz5lMpF3/M6by
 fGB72WoCTxzUkqGHvsbRN84zTJmAfvZCf92TqSgsXnFmSXriKGMxKQH/2eFu+3DphmhrOocfkvC
 jN2vYfhoahiNxx4ykE8ge2GobZ/b0Ph5WFacijfnvLNlLKjkeeRU3UUY2HtVBUItX41U/xCAyf0
 bt/ueVcx/RIfL4vDf2Xpxhb9LodCSMwXlrl8t3efa1NWZ7ou90NY2gIvwKQ30RVODl087N927y0
 FSUAcdYaByn5tKttk0g==
X-Authority-Analysis: v=2.4 cv=MOJtWcZl c=1 sm=1 tr=0 ts=696000bd b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117
 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Ikd4Dj_1AAAA:8 a=oPUTWzCmzlpcM8EYE1UA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: Q8O5JTmG9pVMr2ZHlXE-UbsJQ_qQRwSb
X-Mailman-Approved-At: Fri, 09 Jan 2026 13:49:21 +0000
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

On Thu, Jan 08, 2026 at 05:00:58PM +1100, Jordan Niethe wrote:
> A future change will remove device private pages from the physical
> address space. This will mean that device private pages no longer have
> pfns and must be handled separately.
>
> When migrating a device private page a migration entry is created for
> that page - this includes the pfn for that page. Once device private
> pages begin using device memory offsets instead of pfns we will need to
> be able to determine which kind of value is in the entry so we can
> associate it with the correct page.
>
> Introduce new swap types:
>
>   - SWP_MIGRATION_DEVICE_READ
>   - SWP_MIGRATION_DEVICE_WRITE
>   - SWP_MIGRATION_DEVICE_READ_EXCLUSIVE
>
> These correspond to
>
>   - SWP_MIGRATION_READ
>   - SWP_MIGRATION_WRITE
>   - SWP_MIGRATION_READ_EXCLUSIVE
>
> except the swap entry contains a device private offset.
>
> The SWP_MIGRATION_DEVICE swap types are treated as specializations of
> the SWP_MIGRATION types. That is, the existing helpers such as
> is_writable_migration_entry() will still return true for a
> SWP_MIGRATION_DEVICE_WRITE entry. Likewise, the
> make_*__migration_entry_from_page() helpers will determine create either
> a SWP_MIGRATION_DEVICE or a SWP_MIGRATION type as the page requires.
>
> Introduce new helpers such as
> is_writable_device_migration_private_entry() to disambiguate between a
> SWP_MIGRATION_WRITE and a SWP_MIGRATION_DEVICE_WRITE entry.
>
> Introduce corresponding softleaf types and helpers.
>
> Signed-off-by: Jordan Niethe <jniethe@nvidia.com>
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> ---
>  include/linux/leafops.h | 86 +++++++++++++++++++++++++++++++++++++----
>  include/linux/swap.h    |  8 +++-
>  include/linux/swapops.h | 79 +++++++++++++++++++++++++++++++++++++
>  3 files changed, 164 insertions(+), 9 deletions(-)
>
> diff --git a/include/linux/leafops.h b/include/linux/leafops.h
> index 52a1af3eb954..aa1b465e6556 100644
> --- a/include/linux/leafops.h
> +++ b/include/linux/leafops.h
> @@ -28,6 +28,9 @@ enum softleaf_type {
>  	SOFTLEAF_DEVICE_PRIVATE_READ,
>  	SOFTLEAF_DEVICE_PRIVATE_WRITE,
>  	SOFTLEAF_DEVICE_EXCLUSIVE,
> +	SOFTLEAF_MIGRATION_DEVICE_READ,
> +	SOFTLEAF_MIGRATION_DEVICE_READ_EXCLUSIVE,
> +	SOFTLEAF_MIGRATION_DEVICE_WRITE,

I think these should be SOFTLEAF_MIGRATION_DEVICE_PRIVATE_xxx

And I realise that's a mouthful :)

But to be consistent with other naming, including SOFTLEAF_DEVICE_PRIVATE_*.

>  	/* H/W posion types. */
>  	SOFTLEAF_HWPOISON,
>  	/* Marker types. */
> @@ -165,6 +168,12 @@ static inline enum softleaf_type softleaf_type(softleaf_t entry)
>  		return SOFTLEAF_DEVICE_PRIVATE_READ;
>  	case SWP_DEVICE_EXCLUSIVE:
>  		return SOFTLEAF_DEVICE_EXCLUSIVE;
> +	case SWP_MIGRATION_DEVICE_READ:
> +		return SOFTLEAF_MIGRATION_DEVICE_READ;
> +	case SWP_MIGRATION_DEVICE_WRITE:
> +		return SOFTLEAF_MIGRATION_DEVICE_WRITE;
> +	case SWP_MIGRATION_DEVICE_READ_EXCLUSIVE:
> +		return SOFTLEAF_MIGRATION_DEVICE_READ_EXCLUSIVE;
>  #endif
>  #ifdef CONFIG_MEMORY_FAILURE
>  	case SWP_HWPOISON:
> @@ -190,16 +199,75 @@ static inline bool softleaf_is_swap(softleaf_t entry)
>  	return softleaf_type(entry) == SOFTLEAF_SWAP;
>  }
>
> +/**
> + * softleaf_is_migration_device_private() - Is this leaf entry a migration
> + * device private entry?
> + * @entry: Leaf entry.
> + *
> + * Returns: true if the leaf entry is a device private entry, otherwise false.
> + */
> +static inline bool softleaf_is_migration_device_private(softleaf_t entry)
> +{
> +	switch (softleaf_type(entry)) {
> +	case SOFTLEAF_MIGRATION_DEVICE_READ:
> +	case SOFTLEAF_MIGRATION_DEVICE_WRITE:
> +	case SOFTLEAF_MIGRATION_DEVICE_READ_EXCLUSIVE:
> +		return true;
> +	default:
> +		return false;
> +	}
> +}
> +

I don't see any users of this, do you definitely use it? I mean presumably you
might in a subsequent patch, not checked.

Otherwise I'd wrap it into softleaf_is_migration().

> +/**
> + * softleaf_is_migration_device_private_write() - Is this leaf entry a writable
> + * device private migration entry?
> + * @entry: Leaf entry.
> + *
> + * Returns: true if the leaf entry is a writable device private migration entry,
> + * otherwise false.
> + */
> +static inline bool softleaf_is_migration_device_private_write(softleaf_t entry)
> +{
> +	return softleaf_type(entry) == SOFTLEAF_MIGRATION_DEVICE_WRITE;
> +}
> +
> +/**
> + * softleaf_is_migration_device_private_read() - Is this leaf entry a readable
> + * device private migration entry?
> + * @entry: Leaf entry.
> + *
> + * Returns: true if the leaf entry is an readable device private migration
> + * entry, otherwise false.
> + */
> +static inline bool softleaf_is_migration_device_private_read(softleaf_t entry)
> +{
> +	return softleaf_type(entry) == SOFTLEAF_MIGRATION_DEVICE_READ;
> +}
> +
> +/**
> + * softleaf_is_migration_read_exclusive() - Is this leaf entry an exclusive
> + * readable device private migration entry?
> + * @entry: Leaf entry.
> + *
> + * Returns: true if the leaf entry is an exclusive readable device private
> + * migration entry, otherwise false.
> + */
> +static inline bool softleaf_is_migration_device_private_read_exclusive(softleaf_t entry)
> +{
> +	return softleaf_type(entry) == SOFTLEAF_MIGRATION_DEVICE_READ_EXCLUSIVE;
> +}
> +
>  /**
>   * softleaf_is_migration_write() - Is this leaf entry a writable migration entry?
>   * @entry: Leaf entry.
>   *
> - * Returns: true if the leaf entry is a writable migration entry, otherwise
> - * false.
> + * Returns: true if the leaf entry is a writable migration entry or a writable
> + * device private migration entry, otherwise false.
>   */
>  static inline bool softleaf_is_migration_write(softleaf_t entry)
>  {
> -	return softleaf_type(entry) == SOFTLEAF_MIGRATION_WRITE;
> +	return softleaf_type(entry) == SOFTLEAF_MIGRATION_WRITE ||
> +	       softleaf_is_migration_device_private_write(entry);
>  }
>
>  /**
> @@ -211,7 +279,8 @@ static inline bool softleaf_is_migration_write(softleaf_t entry)
>   */
>  static inline bool softleaf_is_migration_read(softleaf_t entry)
>  {

For these ones that you are making sort of compound now, can you please update
the kdoc to reflect it? You've done it for others but not this one.

> -	return softleaf_type(entry) == SOFTLEAF_MIGRATION_READ;
> +	return softleaf_type(entry) == SOFTLEAF_MIGRATION_READ ||
> +	       softleaf_is_migration_device_private_read(entry);
>  }
>
>  /**
> @@ -219,12 +288,13 @@ static inline bool softleaf_is_migration_read(softleaf_t entry)
>   * readable migration entry?
>   * @entry: Leaf entry.
>   *
> - * Returns: true if the leaf entry is an exclusive readable migration entry,
> - * otherwise false.
> + * Returns: true if the leaf entry is an exclusive readable migration entry or
> + * exclusive readable device private migration entry, otherwise false.
>   */
>  static inline bool softleaf_is_migration_read_exclusive(softleaf_t entry)
>  {
> -	return softleaf_type(entry) == SOFTLEAF_MIGRATION_READ_EXCLUSIVE;
> +	return softleaf_type(entry) == SOFTLEAF_MIGRATION_READ_EXCLUSIVE ||
> +	       softleaf_is_migration_device_private_read_exclusive(entry);
>  }
>
>  /**
> @@ -241,7 +311,7 @@ static inline bool softleaf_is_migration(softleaf_t entry)
>  	case SOFTLEAF_MIGRATION_WRITE:
>  		return true;
>  	default:
> -		return false;
> +		return softleaf_is_migration_device_private(entry);
>  	}
>  }

So all of these above ^^^ are making it so you can't determine if an entry is
'migration xxx' vs. 'migration xxx device private'. Is this ok?

Does anything need to exclusively determine if something is a 'migration
xxx'?

If not then fine, but just wanted to check.

>
> diff --git a/include/linux/swap.h b/include/linux/swap.h
> index 38ca3df68716..c15e3b3067cd 100644
> --- a/include/linux/swap.h
> +++ b/include/linux/swap.h
> @@ -74,12 +74,18 @@ static inline int current_is_kswapd(void)
>   *
>   * When a page is mapped by the device for exclusive access we set the CPU page
>   * table entries to a special SWP_DEVICE_EXCLUSIVE entry.
> + *
> + * Because device private pages do not use regular PFNs, special migration
> + * entries are also needed.
>   */
>  #ifdef CONFIG_DEVICE_PRIVATE
> -#define SWP_DEVICE_NUM 3
> +#define SWP_DEVICE_NUM 6
>  #define SWP_DEVICE_WRITE (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM)
>  #define SWP_DEVICE_READ (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM+1)
>  #define SWP_DEVICE_EXCLUSIVE (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM+2)
> +#define SWP_MIGRATION_DEVICE_READ (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM+3)
> +#define SWP_MIGRATION_DEVICE_READ_EXCLUSIVE (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM+4)
> +#define SWP_MIGRATION_DEVICE_WRITE (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM+5)

I've lost track on how many entries we have left, have you tested this with a
config that maximises the number?

I really hate how we do this by the way, that's another thing to fix... :)

>  #else
>  #define SWP_DEVICE_NUM 0
>  #endif
> diff --git a/include/linux/swapops.h b/include/linux/swapops.h
> index a9ad997bd5ec..bae76d3831fb 100644
> --- a/include/linux/swapops.h
> +++ b/include/linux/swapops.h

Since this is pure softleaf stuff can we please put it all in leafops.h if
possible? I know we already have some stuff here rather than there, but this
really doesn't seem to belong here.

> @@ -148,6 +148,43 @@ static inline swp_entry_t make_device_exclusive_entry(pgoff_t offset)
>  	return swp_entry(SWP_DEVICE_EXCLUSIVE, offset);
>  }
>
> +static inline swp_entry_t make_readable_migration_device_private_entry(pgoff_t offset)
> +{
> +	return swp_entry(SWP_MIGRATION_DEVICE_READ, offset);
> +}
> +
> +static inline swp_entry_t make_writable_migration_device_private_entry(pgoff_t offset)
> +{
> +	return swp_entry(SWP_MIGRATION_DEVICE_WRITE, offset);
> +}
> +
> +static inline bool is_device_private_migration_entry(swp_entry_t entry)
> +{
> +	return unlikely(swp_type(entry) == SWP_MIGRATION_DEVICE_READ ||
> +			swp_type(entry) == SWP_MIGRATION_DEVICE_READ_EXCLUSIVE ||
> +			swp_type(entry) == SWP_MIGRATION_DEVICE_WRITE);
> +}
> +
> +static inline bool is_readable_device_migration_private_entry(swp_entry_t entry)
> +{
> +	return unlikely(swp_type(entry) == SWP_MIGRATION_DEVICE_READ);
> +}
> +
> +static inline bool is_writable_device_migration_private_entry(swp_entry_t entry)
> +{
> +	return unlikely(swp_type(entry) == SWP_MIGRATION_DEVICE_WRITE);
> +}
> +
> +static inline swp_entry_t make_readable_exclusive_migration_device_private_entry(pgoff_t offset)
> +{
> +	return swp_entry(SWP_MIGRATION_DEVICE_READ_EXCLUSIVE, offset);
> +}
> +
> +static inline bool is_readable_exclusive_device_private_migration_entry(swp_entry_t entry)
> +{
> +	return swp_type(entry) == SWP_MIGRATION_DEVICE_READ_EXCLUSIVE;
> +}
> +
>  #else /* CONFIG_DEVICE_PRIVATE */
>  static inline swp_entry_t make_readable_device_private_entry(pgoff_t offset)
>  {
> @@ -164,6 +201,36 @@ static inline swp_entry_t make_device_exclusive_entry(pgoff_t offset)
>  	return swp_entry(0, 0);
>  }
>
> +static inline swp_entry_t make_readable_migration_device_private_entry(pgoff_t offset)
> +{
> +	return swp_entry(0, 0);
> +}
> +
> +static inline swp_entry_t make_writable_migration_device_private_entry(pgoff_t offset)
> +{
> +	return swp_entry(0, 0);
> +}
> +
> +static inline bool is_device_private_migration_entry(swp_entry_t entry)
> +{
> +	return false;
> +}
> +
> +static inline bool is_writable_device_migration_private_entry(swp_entry_t entry)
> +{
> +	return false;
> +}
> +
> +static inline swp_entry_t make_readable_exclusive_migration_device_private_entry(pgoff_t offset)
> +{
> +	return swp_entry(0, 0);
> +}
> +
> +static inline bool is_readable_exclusive_device_private_migration_entry(swp_entry_t entry)
> +{
> +	return false;
> +}
> +
>  #endif /* CONFIG_DEVICE_PRIVATE */
>
>  #ifdef CONFIG_MIGRATION
> @@ -175,6 +242,10 @@ static inline swp_entry_t make_readable_migration_entry(pgoff_t offset)
>
>  static inline swp_entry_t make_readable_migration_entry_from_page(struct page *page, pgoff_t flags)
>  {
> +	if (is_device_private_page(page))
> +		return make_readable_migration_device_private_entry(
> +				page_to_pfn(page) | flags);
> +
>  	return swp_entry(SWP_MIGRATION_READ, page_to_pfn(page) | flags);
>  }
>
> @@ -186,6 +257,10 @@ static inline swp_entry_t make_readable_exclusive_migration_entry(pgoff_t offset
>  static inline swp_entry_t make_readable_exclusive_migration_entry_from_page(struct page *page,
>  									    pgoff_t flags)
>  {
> +	if (is_device_private_page(page))
> +		return make_readable_exclusive_migration_device_private_entry(
> +				page_to_pfn(page) | flags);
> +
>  	return swp_entry(SWP_MIGRATION_READ_EXCLUSIVE, page_to_pfn(page) | flags);
>  }
>
> @@ -197,6 +272,10 @@ static inline swp_entry_t make_writable_migration_entry(pgoff_t offset)
>  static inline swp_entry_t make_writable_migration_entry_from_page(struct page *page,
>  								  pgoff_t flags)
>  {
> +	if (is_device_private_page(page))
> +		return make_writable_migration_device_private_entry(
> +				page_to_pfn(page) | flags);
> +
>  	return swp_entry(SWP_MIGRATION_WRITE, page_to_pfn(page) | flags);
>  }
>
> --
> 2.34.1
>

Cheers, Lorenzo
