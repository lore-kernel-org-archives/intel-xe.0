Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC4B8EB64D8
	for <intel-xe@archiver.kernel.org>; Fri, 16 Jun 2023 14:07:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A36110E628;
	Fri, 16 Jun 2023 14:07:37 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD18810E628
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Jun 2023 14:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686924455; x=1718460455;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:to:cc:date:message-id:mime-version;
 bh=0C7H2mujqhWB5YPx9ZapOD9gr4RQDI1/QzNAB8Z6d7w=;
 b=duG3JAoXNO1z6Ps6TaPtn74goVU3p+ziYiSlf+2H+FLWI7L0bmiri6QL
 9s7Q+/74FWdmAeH2ANdOR3+BS3jOEte7ywLXsI9OVSnTPj86fbxN9RwXz
 Cp/wL68tLLJTKWnwKUa8pdFSviYDZVeHGssVSuGlIpwjOQBg/TPBc89Kg
 GxvZt5Drc/Yf0NH6XElYSSltZoRRlR8tgL0+5whDNgAJWTFDRe+KE7TTm
 j3Op3THq2WqZ7Yklp3UVsNz7yC8GsKZJS2pMt8Ql/XLXOUpM/Am6n3AJD
 IGqYbvHXe1jhGi41HNGGrLdl7C50V7BZGX+DXQ3S9LmWrIlQG81hANMaR g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="339549997"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400"; d="scan'208";a="339549997"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2023 07:07:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="778161423"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400"; d="scan'208";a="778161423"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga008.fm.intel.com with ESMTP; 16 Jun 2023 07:07:15 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 16 Jun 2023 07:07:15 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 16 Jun 2023 07:07:15 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 16 Jun 2023 07:07:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lvkkpkk8NIc3weUFhHL0CNIQ1+vcwqdCKV+1RStKRs1uvbpW3TK07Mh8zayHtj/PAknbydxRCh8s3CqMMZRF377Wx0zffa3pSoXmVKphnQeJXVbM/bRtg+Yl5MnrAqcopoW6+ZGWDDWi3R5JbpvRHRAH8iY7qBhZ8a8fyyP4ysolz+mxlFK64J9hYKW9Znt7wLeU6QqXwhLC9qDk9su5GwDJ+WvhN/1ltV1MXdaLTf9ubP8EGbYwQ+d/ocCZmlqYvYamJK06jsGCiHBKgeHjoyVLpOqBTYkmd78FJKz8zGFaEYxSd9ez129ZezUQrJwTu19r2fk7kRfdNR9XK9kKmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iXJwrxgb/r3sL9kzIOG5ZKQLwYZk94fXwjjHFJEKgyQ=;
 b=jVgmZTEi2OU2SPVCX9PXqg3goW097YhcWet/1lyqPrk+SUniiTNxv+zm0LsiZTxXvklNSXWWJU7woZVTdcD4UoNkMapYRnmvCgvUfWvTqR5SgT8rZUKZOE0zLBi9GfSeJFc5e7hK0BJ/X1Feg4g5MaqqWI6sLfqrc/6n5uKJ4qQLGNYfDhl30ddKJdGzGDOmPd8lWbq16x0xF+1YxKnVkCTvnBtr0UGbJYG9YVDGcyRQsMHFWmGlgc49A+2scXVgQicn+yzP9wYbccz+vr97GQA1wYBUo//XLX/Cqrapoumr8NAFt5sg83cMWydGxu05+E7OL9IXIh+wf4oHZdu29w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN8PR11MB3556.namprd11.prod.outlook.com (2603:10b6:408:8d::31)
 by CH0PR11MB5315.namprd11.prod.outlook.com (2603:10b6:610:be::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.29; Fri, 16 Jun
 2023 14:07:13 +0000
Received: from BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::e819:33fa:c583:f09d]) by BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::e819:33fa:c583:f09d%4]) with mapi id 15.20.6455.043; Fri, 16 Jun 2023
 14:07:13 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <168692434367.4441.4523253323430999428@gjsousa-mobl2>
References: <20230614205202.3376752-1-matthew.d.roper@intel.com>
 <20230614205202.3376752-2-matthew.d.roper@intel.com>
 <168692434367.4441.4523253323430999428@gjsousa-mobl2>
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
Date: Fri, 16 Jun 2023 11:07:08 -0300
Message-ID: <168692442808.4441.6274529148903489434@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: YQBPR0101CA0093.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:4::26) To BN8PR11MB3556.namprd11.prod.outlook.com
 (2603:10b6:408:8d::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR11MB3556:EE_|CH0PR11MB5315:EE_
X-MS-Office365-Filtering-Correlation-Id: d9cca4d6-a573-42be-9b7b-08db6e72fbb2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ljgRavXBzVOgFvg9t+eUrZhkcMlLeH0rnnGo3DCCWSGbHoGYb3nrH6Pp1txnZUp14cjZc7O13udTj+q5Dkbouj5s/ra62BH67LdStiBITCQ4Q7apdM3tI09xeJQED9Xz/UBDCmmiNWKsuLIOc70eds8NwQuEYNoxpUoqo5O3AIoD6cLfAYpO0zTXk2H5SHYWGlA7Illg+Eo0i8GXPcG4rcz5Dquv8ah4vw3M7ZO6uLANVmOZ1mnO8hXKmwxRMiX83FDXJ0vPTmSDAlmIo8IaCbUEki22jXjuwVPLFysAwQsihiFZHJwQD+rpCkWhgJD6fi6+eGn/OSip3hHi+WkcdvOmqkDGofQR9bYBoo5lQ9la+sG9cZ3pEVV4aWMph5W3WgWvic7WxErGNQ1weP0lENqpWyEz+rICrz4xs9AUTfcVDBUaMGOBmuXzsWRMihJDgvVqgoMNHW0c6Y3MGbwTvzNxNjXWtqhO66oDbdSO/IRp5K1MQWbCPamPyfL2FZpQSMMyx1jc3cYfSHnuT8mToQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR11MB3556.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(136003)(396003)(376002)(39860400002)(366004)(346002)(451199021)(86362001)(66556008)(66476007)(316002)(4326008)(966005)(66946007)(478600001)(6486002)(6666004)(33716001)(44832011)(41300700001)(8676002)(2906002)(8936002)(5660300002)(38100700002)(82960400001)(83380400001)(9686003)(26005)(6512007)(6506007)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YjBOVGw4aGh3TXJnQlEzd28rUmFDdnZ4QlViNnhoZHY2aVlITkV5REU4N2NX?=
 =?utf-8?B?NHBENWRTcWlCUEZlMjZIYm1aQStPTS9sYTZzRHlMOTR5ZjhnWjNDVytFQUEr?=
 =?utf-8?B?bTY4aUJRMmJUTDJ4SWVNK29hU0NxTWdNY1ZEN2R4Zk90OTVxZWVpY0ZDSE9u?=
 =?utf-8?B?cXRzUWRJcHRNVktYNmFsOVMxREI3NnVZSHVUK0JuT3F6YUVyNm9ZUHpnZ28x?=
 =?utf-8?B?WkpxY3p1RDdkK3BhY1ZhU1VRYnBRWmpIb3dnSDNPbElyNGtuVDdlVEZXZHQr?=
 =?utf-8?B?VFFkZUp6aXRzZHBWMEs1NCtYOUdIN293VnpDb3o0eVg1VGFuMGxXOU85Rlhn?=
 =?utf-8?B?TGVpK1FVRHRmdUNsbk9XZjVZblpuS1ZTZkc5cXFIaFhyaGphc1FFT1JPMk9x?=
 =?utf-8?B?dzNjcDVFalozcTF2L2VFWjY0K3duRHRKNUJFWWNWbkYvTVNUcG5UbElmdW1z?=
 =?utf-8?B?SFJMWnNxKzFFNGRpR0NKejZzbHFQNncvL0M2VDJjMkVyR1RSczNyOElxU2d0?=
 =?utf-8?B?aXRBL0xVRTFpREh4dDZiZ3B5aU90RE1GTGVSdnBvZWFtWStCYXdKa3dQYmtZ?=
 =?utf-8?B?QU9lYlpGMER5SDNQTGR6MmpYWFQwaW16OWdYaWVWN2lFaDdpa0l1eTNIaFlq?=
 =?utf-8?B?VGJuYnpLK29ZK2ZvbEk4clBidDh1MnR5SHR1SjUyZ3NxZmFxZUJyT3NMMllN?=
 =?utf-8?B?THV3U1JJYXFkY3ZrcG1xU2xld2JGdmVtbW15R2Z5M0F3OWo3ZkZ5MFVyOFBl?=
 =?utf-8?B?L2ZKN3VuY3lJakRaQ2sxYzV5Mk9RL1VBTzVXQVNUalFMaE5namJJZzhvS0Zn?=
 =?utf-8?B?enNvMzJtN3VGcm9MN3pWcEx6K0JaYmI0dkFscGY1T3ltR2VqejgrMDcySW81?=
 =?utf-8?B?KzY3N25BTUUwL0RxQUt6OU53R1NYbTVYbm1KUjE1L3hvR3Q5Y3ZNT2Z0TEk1?=
 =?utf-8?B?V0JMZWNCWEpFbnJjVTk5c3RJZGRIUkJnc1dQMlZpai9TQUxEZnNNUTZISXZC?=
 =?utf-8?B?UjJTZnczYVNkUm02OHhFbTJ6MHgyY2NxNW5HR25EMUJydVF2SlZyVzJUQmNm?=
 =?utf-8?B?SmpKRmdqREI2Ly9LVk9UM2t4WHIxS1VKbEdYamV5eDZYZ1NhWVlEazllVk5v?=
 =?utf-8?B?MFJaWVZzVlFEK1hwNG44Q284WnN2SzI1cGNyOUJpRWVxKzV2ait0a0tDOC9l?=
 =?utf-8?B?S2h5MGtDRXdGUVVZc0xmc3M3MWpNSzVqWFBXQnkySlpHelBDZkswNmVLa1Rw?=
 =?utf-8?B?MVg5OVpnMHZ3Y3RqZFNoVVZRZU1NMnNvRHRnUnM5Q0NpaGNLajRFOWh5cHJx?=
 =?utf-8?B?WWtKS2MwRzltWlRjbmN1dGxST01abHA1WmwzOG5FOUFmNHkyL2lpUFdzY1VC?=
 =?utf-8?B?UU91U0d1MnlnZUVWckEwWjFVMk1sWjMra3RxTXVkUjFvN0RrMzNnZ0Q5Qnpw?=
 =?utf-8?B?RmpYUWxjMVkzdHBRclNzNDRXRExKbS96YnVQZjFRZkdac1MyYmtMcXZpVkNX?=
 =?utf-8?B?eVpESnRRYlh1UU9Hdjk2R01seE1vOFIzSTQ3dnBYeWQ2ZTlVQXA0dFZnVkJZ?=
 =?utf-8?B?N2Fid0VrQjN0R2F0cTRyd0Zqc29aWFBYbGpzQXp2RGtTZkcyYWxFRzJIZUZt?=
 =?utf-8?B?dkRmb2ZFS3BmVVlpYWRPZy90eDFPNlU0a2tpVnhZNXZwNldhQ3oycnpmUDdu?=
 =?utf-8?B?aERLQmhJeFQya1pyWmdONmpDUTdhK2pBS1Fad1NQajdFT0k0ZmpGYk1abnBN?=
 =?utf-8?B?VTRsdXlHbjhLZUF6NjU0dGtKcmFrSFkxUkNWVzdseXRkd3NLVFc5c1ZGb01i?=
 =?utf-8?B?U2pQYUpLbjBaY3FtNExQWGkzWHI5NDIxY013YlNBcktOTWdJS1FGWGZ3bVVI?=
 =?utf-8?B?Q0k4L2YzZ3pBdW1TSjNKNi9MWHRLY0Y1Y2hLV1NZSW9kMGt3akdIdkdHNWJz?=
 =?utf-8?B?VVVEbUJZWUVyU00zazZzNFlSSmZzTFhVQkZZaDR6MzFlNVQ0UEZwWFJBeHY2?=
 =?utf-8?B?OThvUXZKb1dyUEkyRnR6Mmt1OWw4SmcvbUNxVDR2NGIwWDVrdnpuMnUzT3d2?=
 =?utf-8?B?NHFhbmVhVEs5ZU9QMmJBMkZuQnJSc1NoTVJTSnBWRURTOE10aUEwK0NkajNN?=
 =?utf-8?B?U2ROZDRJOXk3T1A0dmVxRkl6UlY3RUxVZlZmaTArQjNyMDJNVndybTZBTXNz?=
 =?utf-8?B?VUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d9cca4d6-a573-42be-9b7b-08db6e72fbb2
X-MS-Exchange-CrossTenant-AuthSource: BN8PR11MB3556.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2023 14:07:13.4400 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UBukO3dPvkJyPfkRW2jkYP2Z/c252kccjFDQRnscF+56D9VbNYmflVbqyvsBqZvXa3K+6a6qaC+0Yxb0ZEeP/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5315
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/4] drm/xe: Return GMD_ID revid properly
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
Cc: matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Quoting Gustavo Sousa (2023-06-16 11:05:43-03:00)
>Quoting Matt Roper (2023-06-14 17:51:59-03:00)
>>peek_gmdid() returns the IP version, not the raw value of the GMD_ID
>>register.  Make sure we extract and return the rev_id field as well so
>>that it can be used to determine the IP steppings properly.
>
>Hm... This has been fixed in a different way by Lucas in [1]. Adding him
>here so we can choose one of the fixes. Both look good to me.

Ugh... Forgot to add Lucas to the Cc list. Adding now.

>
>[1] https://patchwork.freedesktop.org/patch/542422/?series=3D119292&rev=3D=
1
>
>As suggested in Lucas', I would also take this opportunity to rename
>GMD_ID_REVID to GMD_ID_REVID_MASK for consistency.
>
>Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
>
>--
>Gustavo Sousa
>
>>
>>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>>---
>> drivers/gpu/drm/xe/xe_pci.c | 23 +++++++++++++----------
>> 1 file changed, 13 insertions(+), 10 deletions(-)
>>
>>diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>>index 2991cf5365d5..7926c2fa1433 100644
>>--- a/drivers/gpu/drm/xe/xe_pci.c
>>+++ b/drivers/gpu/drm/xe/xe_pci.c
>>@@ -392,23 +392,27 @@ find_subplatform(const struct xe_device *xe, const =
struct xe_device_desc *desc)
>>         return NULL;
>> }
>>=20
>>-static u32 peek_gmdid(struct xe_device *xe, u32 gmdid_offset)
>>+static void peek_gmdid(struct xe_device *xe, u32 gmdid_offset, u32 *ver,=
 u32 *revid)
>> {
>>         struct pci_dev *pdev =3D to_pci_dev(xe->drm.dev);
>>         void __iomem *map =3D pci_iomap_range(pdev, 0, gmdid_offset, siz=
eof(u32));
>>-        u32 ver;
>>+        u32 val;
>>=20
>>         if (!map) {
>>                 drm_err(&xe->drm, "Failed to read GMD_ID (%#x) from PCI =
BAR.\n",
>>                         gmdid_offset);
>>-                return 0;
>>+                *ver =3D 0;
>>+                *revid =3D 0;
>>+
>>+                return;
>>         }
>>=20
>>-        ver =3D ioread32(map);
>>+        val =3D ioread32(map);
>>         pci_iounmap(pdev, map);
>>=20
>>-        return REG_FIELD_GET(GMD_ID_ARCH_MASK, ver) * 100 +
>>-                REG_FIELD_GET(GMD_ID_RELEASE_MASK, ver);
>>+        *ver =3D REG_FIELD_GET(GMD_ID_ARCH_MASK, val) * 100 +
>>+                REG_FIELD_GET(GMD_ID_RELEASE_MASK, val);
>>+        *revid =3D REG_FIELD_GET(GMD_ID_REVID, val);
>> }
>>=20
>> /*
>>@@ -444,8 +448,7 @@ static void handle_gmdid(struct xe_device *xe,
>> {
>>         u32 ver;
>>=20
>>-        ver =3D peek_gmdid(xe, GMD_ID.addr);
>>-        *graphics_revid =3D REG_FIELD_GET(GMD_ID_REVID, ver);
>>+        peek_gmdid(xe, GMD_ID.addr, &ver, graphics_revid);
>>         for (int i =3D 0; i < ARRAY_SIZE(graphics_ip_map); i++) {
>>                 if (ver =3D=3D graphics_ip_map[i].ver) {
>>                         xe->info.graphics_verx100 =3D ver;
>>@@ -460,8 +463,8 @@ static void handle_gmdid(struct xe_device *xe,
>>                         ver / 100, ver % 100);
>>         }
>>=20
>>-        ver =3D peek_gmdid(xe, GMD_ID.addr + 0x380000);
>>-        *media_revid =3D REG_FIELD_GET(GMD_ID_REVID, ver);
>>+        peek_gmdid(xe, GMD_ID.addr + 0x380000, &ver, media_revid);
>>+
>>         for (int i =3D 0; i < ARRAY_SIZE(media_ip_map); i++) {
>>                 if (ver =3D=3D media_ip_map[i].ver) {
>>                         xe->info.media_verx100 =3D ver;
>>--=20
>>2.40.1
>>
