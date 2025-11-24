Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E82CCFD318
	for <intel-xe@archiver.kernel.org>; Mon, 24 Nov 2025 17:33:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1368B10E2E3;
	Mon, 24 Nov 2025 17:33:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GlEWwwuK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BA1210E2E3
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Nov 2025 17:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764005592; x=1795541592;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=mdlPBZ9AsFh3iMgSzh/GZcwabLmCV5Gh2wmWR9gPb70=;
 b=GlEWwwuKoX//PrTFeMdb16lbCNJvgpNOe4HOV1t/oc6zu40GQEppgg/1
 ulgVz1WqlboqsBfSjzS0cTX8QzThAysSD6bHahM0rQkoCufX5kzqXfDOR
 y9gsAwORQQV3hgIZhgu/NPpSTDjMO1nYDVzcyQfpEAcadZ7SmIs0qMYXP
 OsOEvOxfBKKRdf0W6UaUpNoXDo5pYrrFr4ldtuyA8HopujColOvPUVXwU
 8oTpIU1wx5dDUce3CLNhUBi5Uh4DrRTwmxfGA1SHv1aIOSCGmSoSMRhFu
 HVokEdbqeOnXayXNjwxqiu798dm+hbciwu1GlAdX3Z70/soJd9LJbXCgO g==;
X-CSE-ConnectionGUID: Bni8bNrcQtSuKdBo/5L8/Q==
X-CSE-MsgGUID: hyiysNW5Qjursmck7R8jtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="77123451"
X-IronPort-AV: E=Sophos;i="6.20,223,1758610800"; d="scan'208";a="77123451"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2025 09:33:12 -0800
X-CSE-ConnectionGUID: SGdVpwIMRVSxBvYcgSjrgg==
X-CSE-MsgGUID: INfhJeZESzqPjSppSW9hNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,223,1758610800"; d="scan'208";a="192052446"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2025 09:33:12 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 24 Nov 2025 09:33:11 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 24 Nov 2025 09:33:11 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.64) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 24 Nov 2025 09:33:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F9SgQlqhPhsbBh2f1Pty8Hlzq7a7JdlP54pYYYIiB4dc6mVLVeZRrk78OusykBr5dUjUl0U5MPs50mHobcfC3+/leaKgYjUZOD83veg9AwLdvPi0VMls7f3kw7tZ/56RbLc2byuwqT1C75fsnBdBUdJklWUtEbq4bC9it4ObbjZNO/2heE0Az1yFMvczC2zcKQWN8MUTBS39Gr4RxewnXR+Dat32mbzlJEKIEHKFQmfvmUtuOM1yji8q0PI5ETZJ/GJA/YW1yVi6lkoEcTqcTtjLbDpAk8MikyYS0vB4J7VwoHjl/29yjhkuHjce0u4U8IR6sCAYLkM9b1xdT+s2Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gwzjohwP0KzngBqOD2XcE0NEbSzCz1sZI3yJtCMBloc=;
 b=AuyzCfv0ogfogE/YaZUfUIvquTSfFhN78xAuXkoTm3Z69MnSqk3XtTJisxz2R/BMhZUkbg0xIs+WqgNYrgjxrvfWFbBMi6ao6PNDmXciQaP8oL68LtmZJadfdcXbr3n0TrXqpzSCOLThVEDoKTP/hu/7GfJDE2MioWejrwt8ay0l6caG5vfE7czWkGwA5F48VR64JzB0W1vFy2vgB+/mUpkyIm8K1GUQVP0JAxal/K4ouRZw4m9kTThx7aMSXjNJyXlMn6kNHNTct3uqiPrT2iheuhhGBH+G7j7gUJ4KtRkkvJE05qLy5lM3x/mnNJBFiLUPqfcsAwIqiM+HVtp4bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM3PPFCBDC4B878.namprd11.prod.outlook.com (2603:10b6:f:fc00::f4f)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Mon, 24 Nov
 2025 17:33:03 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9343.016; Mon, 24 Nov 2025
 17:32:55 +0000
Date: Mon, 24 Nov 2025 09:32:49 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: Shuicheng Lin <shuicheng.lin@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 0/2] Silence allocation warnings for sync arrays
Message-ID: <aSSWwcAtSjlNNWtq@lstrano-desk.jf.intel.com>
References: <20251120234254.427452-4-shuicheng.lin@intel.com>
 <f3a9603475e70d85368e5083046365eb507da502.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f3a9603475e70d85368e5083046365eb507da502.camel@linux.intel.com>
X-ClientProxiedBy: SCYP215CA0064.LAMP215.PROD.OUTLOOK.COM
 (2603:10d6:300:149::32) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM3PPFCBDC4B878:EE_
X-MS-Office365-Filtering-Correlation-Id: 033f6e4b-18a9-43be-da30-08de2b7f80f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?NavWyIa2nRjPH+Hsp0c4SugDOmXkqwa3A1bI03IiGQCpfZReNG+HSHzub4?=
 =?iso-8859-1?Q?mIziP+AxTtQKQcscdK/KTdZ5jaoMRKCNw3HBWELmBZMn6ZKR4ptl6QSYqm?=
 =?iso-8859-1?Q?lC08Opgl6TMP+XCqZglSaZZFWmbc84zWmqVihai0W8JeSPUtNRs5JVUHoa?=
 =?iso-8859-1?Q?pd3toWqzlFmwVZzpCx9ppiEKzigjAf3PlwVVPJdfAgkud4Jiri20yppPJX?=
 =?iso-8859-1?Q?xaHQb/R4fdQvCHYsHtW2wySd1qTkXk7UkkLCXPPPRIUWQUAa8eguJ+luCA?=
 =?iso-8859-1?Q?DPdHhGtsCs+44Uz80oVxUDcYUQbH4ujAeJqU9gtivG3PZvpkCTbBj8i+JT?=
 =?iso-8859-1?Q?MMjsiIiaRzjGKqhOLBGWPVlJF5Mx20S4uzDIWbKxZCDhzJA78cNwa62YIE?=
 =?iso-8859-1?Q?ak5aapDejSTdALfzoc5QknQXQvvsZ5UIxCqKy1CH0UBR4GfFEwA5t/NhPk?=
 =?iso-8859-1?Q?l494B7SZub34SclqpMZQmeYi5ag+FshWWsjFSFJbw51k2PYXfteRKEQ/jh?=
 =?iso-8859-1?Q?t5mD7ueYJerBJy0HmUx8RXwj6vDHkDKTvKOB60s/SoLxyM6rX5Uko+yYlX?=
 =?iso-8859-1?Q?kajwhU9PaldWPny55NUUYm+/lVte2lpC3ExPRB1wmhtmHi72BUyHc9yxUj?=
 =?iso-8859-1?Q?t+UkoA2z6wtpWCr4UG/y0PfLCkIT7fatnOwN5e6De3TS96xvkXHT/E/f7+?=
 =?iso-8859-1?Q?5s8IcgrQAxLKBmZLTPLlzXOC7FcwtNt2BiFycizW7hFkHh2+fYTSrozeH8?=
 =?iso-8859-1?Q?vdHfT5b3iHHg+f5enzj6UMQLbaU0DOxJnjriqbHsPV5iBFG8P99K/1npDR?=
 =?iso-8859-1?Q?Ql42W74PoIv4H5eduy3jEN7ocEfDpXRVwaVvEWVTXkYFl0z4L8oBrYFw19?=
 =?iso-8859-1?Q?EV+16rRT6Ck9efmk+QlJrZaFmfWNzm2/93WdsJElb25M7iwD1e4/bu8/y6?=
 =?iso-8859-1?Q?TM2AxeUlx0Qhv8cvPSOQjC7YWoX6BTuUfXtbXZYUWRUPche6OkoLHqyUib?=
 =?iso-8859-1?Q?IvPS259c0ajNgEwCOkI3z09yqlLfj+8yWL0SX1QUGEJ8KcrH4exLtifNBz?=
 =?iso-8859-1?Q?87MSzII0YqhlWLRUzjaSwsdpHO6xcvxJGR9B1P9z4nk5IMzh1QQKimtWnD?=
 =?iso-8859-1?Q?FLrMmQtBVaIRYVKusO27ZsvF3nQYhvDGDXD9Jq7BbQa2OYkQV77rIIslmC?=
 =?iso-8859-1?Q?zhB5WQ4xQtK10cMIoeCZ6KOXT6bDXj0cRb1g1n2Qpl+yJAPoEM1rYl+lKS?=
 =?iso-8859-1?Q?SXzB/5v03ErmdCFWYAqotgL8qesWby4894Nr3wGGJwHmmJVUM3AeJiZmv0?=
 =?iso-8859-1?Q?2xBfK88nsSNlet7CwuMN1e43lJ6sKLfUmXeas6BFstSFRPrSL3kuOzlnyT?=
 =?iso-8859-1?Q?Qsv7lAULihhkJWMIOMCc+P2Xdv9mQG9Xaknqz82EQNa6cs7rhPyRjsHL+R?=
 =?iso-8859-1?Q?jYs2WsQVHJmCphkKmD5/VmKhZ1YYqt8Hf1OiSck3Q8l9Lx8NvPnTZjcofM?=
 =?iso-8859-1?Q?xG99zTsqYI7cJIv7dvqmU5?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?3HZQXr3woeoTelyb9KMwJhkbUCBNsy/312lrO32UNovhkrzAXUkIRuOMpI?=
 =?iso-8859-1?Q?VTJ53rnM5Ufgt1rsbAV8ucYrzy+F3Mx/1CrO2prPIdtjd47XNnD4TpuApb?=
 =?iso-8859-1?Q?7OkriRPRjj5T4MNH93GSRvtvOAHs6QPOUeJaX8GAk8+j8pwgKBhPWV/zg+?=
 =?iso-8859-1?Q?KkKO7iAVqUhT8m32D1VwJ8gXtgBHmsO9pdaVjWGnDEl6Vvava/b0wqLT9i?=
 =?iso-8859-1?Q?27EO+s1G1mBwJDqLVY9wpap0tONl3VATR02duKADyQzkXZ7FaNKLMNqfQ5?=
 =?iso-8859-1?Q?RGDLq6jN7ngMNhha982fA9Oe8VqsdqbI2BUzS39H2KdNDM5vXLRlOrmGNZ?=
 =?iso-8859-1?Q?R5WArpS7wrA2j9IFe+1wot9wKJ5Q6zUtjc9LKPSsqjxU/phOOS7dsP7cNV?=
 =?iso-8859-1?Q?5d6hooa9/Pk1hfgJPuv9MkgjqbqqsbwRtnti3nJ+LtRW7ty8yBiIarhXBy?=
 =?iso-8859-1?Q?My26IYpYYEYcxmXcdGM1EduPZhryLg4zyos6CQlYdGy8AP2QVzypFM1kLi?=
 =?iso-8859-1?Q?aNH11pgKvA5ykH15Ic2dn2ZfsDGoY8lQZKHvgHh07TPRdBNXCFwE2xEN8D?=
 =?iso-8859-1?Q?sJtXsx9ScZNRl1ksLw1udS6DRcU/dSuXPCzQTOu8wKx591mXPSidllTd5S?=
 =?iso-8859-1?Q?QymVXAS72Pon1pudweFLTXcbDcraGKFyGstPkK3Bfo/KET8RhdLGOO+ezz?=
 =?iso-8859-1?Q?z+aMI3L9RRTN2fBW84ekVag646bPNT1KvWz2B1eswTZHSzttCDZG7T+MfW?=
 =?iso-8859-1?Q?m4GApjjBQtqh+PSOCrwPuG/eTURDBOGsjVIzqczUv0xNmM6quQ7/iyV6l8?=
 =?iso-8859-1?Q?2xMXzC0WQQUq0bK4jHuR0bLf8mvVlAplhpJCC8GbXGM15JCEa3Mpt/t32P?=
 =?iso-8859-1?Q?d09HS+mFA6J822Fcc+aU0IMIAFH+x9ewqn9J6sxmH922Y0BynwmcrilGjA?=
 =?iso-8859-1?Q?1FGGh8bNW2gbK7lNtF4KtqiT0xqTRws3ZwsrXjpmDUOUvpfGbBOCv38Sgv?=
 =?iso-8859-1?Q?VBOgQsT2JaAVwX1piTxSxOieie8h/F11d6zcjjy7z2rLToryqkVUNVkjxZ?=
 =?iso-8859-1?Q?UZfQhdWWiYVXgPzBgb+uzQpKpw66Wp16OxqkFivFqZxLQVg50EJDsEVSFK?=
 =?iso-8859-1?Q?AhH1WK8+t8NRqiF5g/VFOJuaii+fO88zjiHi7/CffCzQBAKUGC1N4GTQsL?=
 =?iso-8859-1?Q?TdsCk9Bq5kk9hljcSA2kMth9r18S1cac6Hc3gz71z/A5JOJZx54mY79/gO?=
 =?iso-8859-1?Q?lZ0Ol/dTZaTqiMRsO/EdMUZ7GK2k7chF1UPjOrlS4iBsgxVGGMrFJWy4hl?=
 =?iso-8859-1?Q?3ezeYNnBrcCAPHCGecSZnissqyjDqA6eeG2Q1DKlgjGDhFMQdum/FH5Ein?=
 =?iso-8859-1?Q?k/L4wNO6Fjk5Y243rZWOZa8RO+m2YkdvoeYKyzTrxWNwgjxF1uLUhijtFL?=
 =?iso-8859-1?Q?ZTbknJysp4DZ9wRrlN45ztsFfoJ7ST+QEGySyzNi1y9UjXLj9Q/WeOHUuB?=
 =?iso-8859-1?Q?IMUG9BZItnavQP+78yn1M3KN1Tre/WSzgmlWK483n0RV67Be/Cv688myP1?=
 =?iso-8859-1?Q?5IZV5AoMrA8u83qmS3K1LIzjzakVS/1kWlvd0+SvTxF46FiEPZ9llzmQjc?=
 =?iso-8859-1?Q?IcsUmG4BfZKXS43ckUfoI5Fm5abMV/5Opqs00uwZ8g6+pTivAXR2Qyig?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 033f6e4b-18a9-43be-da30-08de2b7f80f6
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2025 17:32:55.8554 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +yAIJtHDYPgjK43dNxN7zMSstPbgQEqrf/wvXh6kFNLOI2pXikTw++Dd3Iz/iW8doZDqy4FhwzKkVxlXWia11Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFCBDC4B878
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

On Mon, Nov 24, 2025 at 12:19:14PM +0100, Thomas Hellström wrote:
> On Thu, 2025-11-20 at 23:42 +0000, Shuicheng Lin wrote:
> > Suppress allocation warning as driver already return -ENOMEM safely.
> 
> Even if the driver returns -ENOMEM, in practice a malicious user could
> allocate most or all of system memory. 
> 
> So IMO we need to restrict num_syncs to some reasonable number, and if
> the allocation is persistent we should add __GFP_ACCOUNT.

Neither allocation is persistent - the kmallocs here only live for
execution time of the IOCTL.

Matt

> 
> /Thomas
> 
> 
> > 
> > Shuicheng Lin (2):
> >   drm/xe: Silence allocation warnings for sync arrays
> >   drm/xe/oa: Silence allocation warnings for sync arrays
> > 
> >  drivers/gpu/drm/xe/xe_exec.c | 3 ++-
> >  drivers/gpu/drm/xe/xe_oa.c   | 3 ++-
> >  drivers/gpu/drm/xe/xe_vm.c   | 3 ++-
> >  3 files changed, 6 insertions(+), 3 deletions(-)
> > 
> 
