Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 087D8E743D3
	for <intel-xe@archiver.kernel.org>; Fri, 29 Sep 2023 00:36:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A150F10E041;
	Fri, 29 Sep 2023 00:36:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEEF310E041
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Sep 2023 00:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695947816; x=1727483816;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=uWYuZxGbLDv4Gy8UTy+5sWSIWzwFiPmvmDj2vmUEpak=;
 b=QQBy0mxS3rsfbpYUS5BcU8kuzz/LUlLdjrMzbcUxZNiCT6hSjGIWha4a
 aIhfmfRNgQVJyvZG7ajV7/mWJmC0nVhlAOgJB8xbVlL7zWl1SouSVnguM
 bBGXf6epFRHSvTFSTg1CXNwW5rydtVeVBv7weqGAlUiOj75rE5s/GUJHy
 Vzt2eN5ru+7+hgnEjD2FU533ZEUhW6TUMuNdqUAwDQVLm1izaSPKUPCJ8
 qg3VUakoJzPiz4ZGvFjLfkQOYUDdinzH+1B3AXDi1C35mncaMMvGlb3RK
 Sz6p1IeznxyZaGlS3wsKrWHeoEvWslPY2GDBx+N4DG5L+Ayx/3gOdsw5o Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="372566240"
X-IronPort-AV: E=Sophos;i="6.03,185,1694761200"; d="scan'208";a="372566240"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2023 17:36:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="865501333"
X-IronPort-AV: E=Sophos;i="6.03,185,1694761200"; d="scan'208";a="865501333"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Sep 2023 17:36:55 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 28 Sep 2023 17:36:55 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 28 Sep 2023 17:36:54 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 28 Sep 2023 17:36:54 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 28 Sep 2023 17:36:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V0nN6hpq9zTFqUOf6srrK4sP5+ENYqhQZjrAA22ll/eK3o1H0p5MuFBydedbtMwpvlXavgeOCACGi5zZWJOSjSIjRti2XD+G9fCY357LIN+uwazEjftC+p0srcTMShM0kpMv5aIs3zO4stAyY9ux+7rFYuMGmphvKxVosNxZ88Wrrv/U1VU3pCLO80re3DFpvyRf8hGrGW9SaNn3uIKqcKG2fApwRRAmN3cov3pz179V2oHvokGe9J5y6R/DD6xOOccHeAMlNsKk3gdSNGkaKc0Yww5N2M157i0nCkZO62cD6/56qk5HNXm+MXcINCrZymlfAv/95eQCz/w259Cb5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o5zux4yApvp7AHPnz7hGQH5C+jgxIc0aTZ9N7wn98ag=;
 b=XRBmu7Y6rqbZmwqxyZl8c64TX7fwuanyGaw7HR5D494V4QFfDNx8moHG0lkjlyVxozuVt/NyqLXqBY1kLjKo+jZ0ENpx3gYZQH1yAxtE0f8iChpBg7ev3zFNB28m/0XPUjD3r6PHLXYR20YZPCb4cJ3cNg4GCjNnCHqAsS50QZxUWbQdysWYgTeNkM3unKBqC/sPpW0baqEa4/CZvbCuIrN/A9yJ42oHdIV4/98nH82tU5XHb07/HhGdvayNaH6y0Wv5xj0G5EUxzxDNUTZH0ARDYJKjz4GhM+qhTVIIkrnueb0qhwrQAfIVBCuYXIGEfLYadIh/77J8YmT6ZcSdpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB2987.namprd11.prod.outlook.com (2603:10b6:5:65::14) by
 SJ2PR11MB7475.namprd11.prod.outlook.com (2603:10b6:a03:4c9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Fri, 29 Sep
 2023 00:36:50 +0000
Received: from DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::a51e:7713:dd10:97da]) by DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::a51e:7713:dd10:97da%3]) with mapi id 15.20.6813.027; Fri, 29 Sep 2023
 00:36:50 +0000
Date: Thu, 28 Sep 2023 17:36:39 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Message-ID: <ZRYcFy97svJ8Z4NS@unerlige-ril>
References: <20230926125540.7-1-francois.dugast@intel.com>
 <20230926125540.7-27-francois.dugast@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230926125540.7-27-francois.dugast@intel.com>
X-ClientProxiedBy: BY3PR03CA0026.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::31) To DM6PR11MB2987.namprd11.prod.outlook.com
 (2603:10b6:5:65::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2987:EE_|SJ2PR11MB7475:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b4d36e7-313e-4291-b4c7-08dbc0842b47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UyBBB7DVLNj6UyNdO3ZE7ZEcYwh8eZn5/cSGC61op5k349jfCiT08lloJWuzjljlnWHkyxMrzaXDX0JUTfojYTPnpYQ0KKJP1wRTBOmc4lc1lLhwWQa+OM7PP5YcUkuFrN21JT9igFBcddJCkog8v/9taISAtnfOHhf1lEheuJ0vyj3kQeCRP5jB6HNNECyFvenFeAYce/MA+YgT/UM8mn3f7y6SRW2ph1uiKr/nEZTwmGHOCE3YZ3TnuJlTa0SsXDSnPSOttnOte3TRNQmTnV5Vll/rJHm6mzaQ3LniIo6EG6Db9ai70FMeToiCmXipYmKWP5FdNrSeO/1URAWiyYqge1PTocHy6fN2pFLeombco0XzY84VNhsMaH5nSXuqeqOqjZ+SczC+GCNtjDhh0gH3iXYsbil3UtY9wUqNN5wszTqrSPYVGq2MYIPIqj72ktLz9Tqv7BVEtk8ZFEkOC5Q2f0XD4f+PJF8Pc+0VtdSTxBf8Foo5cG8GnP/1F5dYf+33ziCP1laE/tu1mN4yhdjwLs1o/2bT8bWT+5uZITarQiGM6ztWxAxW243M56MP
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2987.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(396003)(366004)(39860400002)(346002)(136003)(376002)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(6666004)(26005)(6486002)(478600001)(33716001)(82960400001)(86362001)(5660300002)(38100700002)(6506007)(6512007)(9686003)(6862004)(8676002)(41300700001)(2906002)(6636002)(316002)(66556008)(66476007)(66946007)(4326008)(4744005)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WmZxU0JVdnhWck8zMDNpdWlqYm5XeWVJRkZBdWtUNStIa0FSM3RkSmhtcGJI?=
 =?utf-8?B?RGlPOUJyU3dNWjhGMlRlcVRGL1A5eWZyQVB0RERXUVhwMXl5dXZOVHNrSWV1?=
 =?utf-8?B?dmpRdEw1YW1kRDBMU2RyNUpLckljdllJU0VidWZ3VWRWRXdwOWNwMjVYN1gr?=
 =?utf-8?B?Z2JublQvZWttaXpOaUhPcHRvSE1OaFB0Kzk4L3FnT1ZRTGhpRElSM1pRK2NW?=
 =?utf-8?B?blhoNEFRL2g4RXJDWnI4NmhCUEMwVGk4YURZTnNKN2hjZTNyWXZCRWNHREg3?=
 =?utf-8?B?QUlZaUJRT0hQajMyeFZnTTdScjVraWxscG5KNnk4aC96dy9vYTkyMTFsOXZm?=
 =?utf-8?B?Zi9HQkcyYUlRTWFnZ0xMSUJrdFdwY0o2MmR3RFVNeSthaHF5ck9DZTF3TXFo?=
 =?utf-8?B?TExlRlUwZURtQVhTN3BmYWs3YVpZQlpTWGRkNC9GU3YwVmFuV2hBekNIdHJD?=
 =?utf-8?B?UDFteXIzYmNlRnJseGhub1lDeHNqV3ZUZFNiRlp5SjRSRTYzUVJJNzRoVTlr?=
 =?utf-8?B?U3p0akhQdmY4YWh4Z3FTV0ZsaHdsQzgySUkzWXhnSWhEbTAzdWVHUEc0cmU1?=
 =?utf-8?B?bVNoWS9HT3ZWWGcrRnJwY1hyTUxrRXNPWFZnallxL3k1RXRhODBkQWY1aHNq?=
 =?utf-8?B?cHJ6Yk8yWFpRbVAxU2J0UjB2VVNWdFZOYjFXTXRBTVAwWUsybUVtSDgwUUN0?=
 =?utf-8?B?U0todCtRQjh4RVJRSXo3WVpoTGpCRGJuWDhWYW9lajREVDRjWDQ0NFVmaGhr?=
 =?utf-8?B?TjJhSzZsWGIxbVUxSEF1dlNHMVEwVEswUW9EQzhrb2VrUHA0Nzg4Ynh2bzhn?=
 =?utf-8?B?bG9qeTk5enBZdWRZSzM2WkF4SmhFSU9VdlZ4VFRZQzJYVjNiMy8zVDlod0Zq?=
 =?utf-8?B?RmMxTXFjQ0NlZlNYeXFwNXJmcUc2L2c0YjUrZEFiOHNzN3UwUDk2L0pwZ2Qy?=
 =?utf-8?B?ZFZUZzNZQ0g3MGNGVmpGY0VvbGFKQjRSRE5LY01uVCtuYVRMVW84NTVybjho?=
 =?utf-8?B?eWgxY1Irai9jOXRyakgxUkZ3bjZHd0xpeXhWeGgxQlBSU1c2eXg4bTVBQjcw?=
 =?utf-8?B?cW5KdVpEejVIMnFSRkZZNU4ySnRRNW1MdlpOWloxdjFBSzJqbDR4d1NHRkJS?=
 =?utf-8?B?TmtYaU5xTlAvUjFDNzViM3Q1czM5WUQxVWwwbkI3VGdqYTBqeVkvYWVDQTFR?=
 =?utf-8?B?K0lKekk1NmVJVGMzOGZoc1o3TnhHb2trTkpSR2hXekVJMEFDUkhoTnA1ZGpO?=
 =?utf-8?B?ZTVNSDZsemhPVzJBLzhnVDVTWmwxYmZLT2Z1aHJkeFZxT2xBMlZYWC9vYm0y?=
 =?utf-8?B?R0dVSW5Tc2xNeGM1MFdiQW9wNmpCbVhDNlUrVGY4WVZQWEp6aGhMRFRWTW5r?=
 =?utf-8?B?YnpjU1I1V2xOcm0xQS96dFlHWStydC81WnF0V2NrT2t0M3UweU9QRVZ6WHlm?=
 =?utf-8?B?U2dQTFZneWFaUUVmcVE1Zmt5bkF6YnFWdVI0RFFNZ2NoOWx2NHZCd256UDJQ?=
 =?utf-8?B?TUZaSFpCQUY4Tk9Say9TQzFjanlRMXFsREJaOGMraEFmRFNQS1MxV2VuTHBt?=
 =?utf-8?B?dFRiQk1lRlJrdG5wb284NURkbjIzYU01WXRqK2FvUjlPbWxZSnR1NlBlNVdz?=
 =?utf-8?B?WnAxVlJqbXVBV2FmZld1VzZQNm9TeFRYSTMyL1lqTGhrYVdNY0tTeFdSKzJJ?=
 =?utf-8?B?dHc4RlNEWEpKaHNyYXhhM0oycDdzbDNzNU1uR1NCL29TRzNyMlNEOHRINCt4?=
 =?utf-8?B?Ym9FS2htY0RCRVEwT2pZSSt0TVB0RlhWR2ZEcDZTdWxoQkxVT2E5a3hXN2lu?=
 =?utf-8?B?bzQ2N2x1MEFOa0FEcndIbk9SbTAwbi84a0pUUW9GVzZsMnFKSEY3b1AxeG10?=
 =?utf-8?B?Y3FKdmNLNjBuQ2c3NEZlUkFxY0JKUUFKWFBDN2F4YUtydDVkYW92NFUzT0Vs?=
 =?utf-8?B?cDVqeExvT2doOGoxMjZVVy9jTmwrYTRiZS91YVVkdEhlM01yK2Q4OHpMVE1Y?=
 =?utf-8?B?aVlBOUhxNGowMjYxWGhHOEVtSFRCKzJhL2EzVlBydTFhQ1dMb1lGb2U4VEdH?=
 =?utf-8?B?Z3V4NHE5QTVvRC9XL1BUKzZXS3huOEtSS3pWQnlXMy81aEJFVmd2a1FERmda?=
 =?utf-8?B?L1lsdTFjK21KdjJqeVh4V1lOUUREckV4WURWUjdSSEg0WVBBV1FNOXhGZkVa?=
 =?utf-8?Q?mf5cbmvOiEk+pVTblv/B/7o=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b4d36e7-313e-4291-b4c7-08dbc0842b47
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2987.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2023 00:36:50.0212 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m+yI5PTFyHUGjd8WUxFPpcyCIqKteS4d2gJvs1XgJnOALDrFIsvHHQexSeUN4Re0/hJQCOUPyouZSRY9NxGwVYMrgNDcvnJk5pxr5lfkKkI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7475
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 26/30] drm/xe/uapi: Add pad to
 drm_xe_engine_class_instance
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Sep 26, 2023 at 12:55:36PM +0000, Francois Dugast wrote:
>Add pad to reserve space for future uses such as special configurations
>for media.
>
>Signed-off-by: Francois Dugast <francois.dugast@intel.com>

I saw a comment in v4 that you dropped the patches that are not 
reviewed, so this is: 

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Hoping this will be part of the final series that you merge since the 
ENGINE_CYCLES query is using this structure and relies on this padding.

Thanks,
Umesh
>---
> include/uapi/drm/xe_drm.h | 2 ++
> 1 file changed, 2 insertions(+)
>
>diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>index 79e47708d526..84091860c7d2 100644
>--- a/include/uapi/drm/xe_drm.h
>+++ b/include/uapi/drm/xe_drm.h
>@@ -143,6 +143,8 @@ struct drm_xe_engine_class_instance {
>
> 	__u16 engine_instance;
> 	__u16 gt_id;
>+	/** @pad: MBZ */
>+	__u32 pad;
> };
>
> /**
>-- 
>2.34.1
>
