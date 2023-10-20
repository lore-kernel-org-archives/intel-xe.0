Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1768C001DF
	for <intel-xe@archiver.kernel.org>; Fri, 20 Oct 2023 20:12:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88B2810E5E7;
	Fri, 20 Oct 2023 20:12:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA2BE10E5E7
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Oct 2023 20:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697832729; x=1729368729;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=SteT5gu5lT3dtbT8xYtf7h+HWTunMEzcFjfDk2BnJOE=;
 b=Ad3IjZ9s2Q/G9a++xXWivqACLCsoehZD9J8M19vBQc1Rz8z145czGaLe
 NKaUO22vnJibNYWGnooDR8NNhVUAHnCXIS9MA1PBQIju4lBP9b3p10yFi
 UATFxDMi47MWUe4ksGoj1/cntg7Mhs+57dSnaPPfdyuZTnMJBktovaS+Z
 6wnNYwvMwb6xKo4B1j5m5sd4c9ZMTHMX9JcFLC3yVE/+7UQyMcw7HPlM/
 mP6Ct+sgTINGQyYsMu8X+anB2Sc3O3d960nsdZIOc/gfEppfApFWQQa/v
 RYpkjl7UagzKQI3ZROwVDAPAXnP5SSkK25FnAifnbF1FtCNecrEHKBQih A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="450796318"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; d="scan'208";a="450796318"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2023 13:12:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="751037486"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; d="scan'208";a="751037486"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Oct 2023 13:12:09 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 20 Oct 2023 13:12:08 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 20 Oct 2023 13:12:08 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 20 Oct 2023 13:12:08 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 20 Oct 2023 13:12:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iIKAio6orrGVNlAqEmZJgHC36cg5TfWlNuuWjje/TEeBW8H3UY6wy+4hlxykFiemQiiYu4a+t67giwBcXLvOWNQyZdpwT4FtRYOpKgMswFTx7jfZZUIlesR6WBP2yfwGFL7vllC0p9FmqvjexV6e3XkPcQonmWv8nIcOX6/bD/gaZ8zW2zRLNDCoThFk6zrBQOrumCrnSsFfqjS0Lv5x36Fdww2MNP8ClgW/J+uwNcItZIC2/SvZ7TS9DLzhzykA13Aaki2wS2dQA9zAUhTd2sCWZUDDL6P0qwMRoKvxxJNgu2X8pMliIac7OWTpsCH5R2Fut/EPPF16/ZHIn+djHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tqvoKK+dWcQwTxCpASE3c313IMcp6auEWrIytRhit4E=;
 b=R/usI/GMNivIy9dDVK7XQegAfcyh8ixsbn2d1iDW+sBU4LwgOHwAutqJU8Y/urFbZYgTw7VMDDFSFPPUn5Uvp2oyHhwbQcDggPNf0YF/S5u7Jvb4I35/onQ9WboXiLCphmZtJh4UD+006mZSOiVUlhBq5Wds0UIEyDqni2LfmQbP2XpTzgMy8TqdUC+zE69dySTI8GtWjfUHJ9EaqhIsbKsCqWvnoZV+Uhid9unzBVzHgyoxebeJMZ7Tz+El8X1a2fP7/4fvbCpq0NnhN9FDHZKzg6z+201eB+05Ny4O63ZQBhHM9gXTE0uBEVifRyZSD6h0pK/AESIcDFsbOMPd9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB7705.namprd11.prod.outlook.com (2603:10b6:806:32f::16)
 by SA3PR11MB8022.namprd11.prod.outlook.com (2603:10b6:806:2fe::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.26; Fri, 20 Oct
 2023 20:12:05 +0000
Received: from SN7PR11MB7705.namprd11.prod.outlook.com
 ([fe80::51b2:a46b:a57e:9fd6]) by SN7PR11MB7705.namprd11.prod.outlook.com
 ([fe80::51b2:a46b:a57e:9fd6%6]) with mapi id 15.20.6886.034; Fri, 20 Oct 2023
 20:12:05 +0000
Message-ID: <5918c62a-7b86-4327-8c06-fc58f3ae6263@intel.com>
Date: Fri, 20 Oct 2023 13:12:03 -0700
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20231020045533.1425375-1-himal.prasad.ghimiray@intel.com>
 <20231020045533.1425375-2-himal.prasad.ghimiray@intel.com>
From: "Welty, Brian" <brian.welty@intel.com>
In-Reply-To: <20231020045533.1425375-2-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0014.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::19) To SN7PR11MB7705.namprd11.prod.outlook.com
 (2603:10b6:806:32f::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB7705:EE_|SA3PR11MB8022:EE_
X-MS-Office365-Filtering-Correlation-Id: 16e3a66c-1520-4bd1-e03a-08dbd1a8d468
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: we7q+VGznoqbz32ZM/rKF1QS+mnOPYcBN4PSoLUIJvyv+EyjH1VusUwOL3JSxHuVX8lXA1Dre3IJG/qHBULWs/Qxad9Gqt5ksHMrbSEPLtUAwndK4ycnyxE55hl+fwQvL0wM4wHSvusndJdJOVVUraxA6FDhmJ/J3mWKEHz3xTbNO9onQz/5lH5iHz52ypHmAbCfvzEfciH+Q5rO7mmEGtgewvWekrmkBDeu5gq/K4qfhk1ERP2+UqEhaCp4vS7g9MjsHHZL0xQ8Zh4m8IrtfCVsZweL3C6qQVf7/jDFwb8plAwGWbW5kn02Ec4qU4FtpNUUJYqRNS9lbY1XbeO2739bJF2dwvhxKqHYY3+PQPLjp52Pd+jPJdfPfiUTzb9EVVxkpcpq2UW8cGQc3DHY5h5DWsjcBb6usMIBdUvszLTfFPFjcNm/X+Sb9jYmz0/W9a1a76cVPXi5Jbr4b6cJUctpGPFzw0/lakWs8Vxh5zAGIQpJg7pMYX+j64OUl6xEu8AHhNZXnAhBoKiDrCnYmGpbY+oa5rQmSKfa3FPHqRhOahlGz0OhTERHiR99SlE6KQV1RB9N77cFKd/17m5wu4+m3q4nxmwORaT7alPq5Uxp37Nbjp7OZmoIhxn/NT3GGqn6PhIHO+1NoZ4sFMfssA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB7705.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(396003)(366004)(346002)(136003)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(86362001)(2906002)(5660300002)(8676002)(66946007)(66476007)(54906003)(316002)(66556008)(478600001)(6486002)(8936002)(36756003)(4326008)(31696002)(30864003)(38100700002)(41300700001)(6506007)(107886003)(53546011)(2616005)(82960400001)(26005)(83380400001)(6512007)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dk9ycE12VkhMOGozekl3MHRjZVJRbU5wMjkwbDJkVDRJK3U0VnBJZVRLY0hW?=
 =?utf-8?B?TVluc2pCSXQ4MUZnSTN5bW1BMURpK2c4R2pSVVlsbnZlRTY1YlFpODc5U0lH?=
 =?utf-8?B?N2tHRWFpYjdtYW9ER0RNUVNSNGxXMVRWYTRXbVphUnMwM043YmtqQ1lzeUJp?=
 =?utf-8?B?VjdNcmloY055REFISjNtVC9MUnl4VE5XVWtlMjBBNGtBc3AxaFNiUWV4eG9n?=
 =?utf-8?B?ZHRqcU5qd2ppS09nY1dGYnJwVEN3K2NOMVBXRExUN3I0SjJXdnY0NEh6RVBG?=
 =?utf-8?B?eDk1VlF4TkJSQXJKb1VlY2ZMenJtNTI2TEpkRzdDbUs2Rk5QODFiNW43RC93?=
 =?utf-8?B?anNtbWFQd0lHdHhORGxmY0NIbzN3U0ljeEJpUVNWUEREcCtRSzlZaFJvWGp5?=
 =?utf-8?B?dDZhYjl0VzN2Z3R5a3VoV0NPZ0pwTzJza1daV1BYdEEzVUxrTzNORTd4YzJy?=
 =?utf-8?B?WXNpUU1GbHVTaXRpRWc1UW9WN2xvcnk2Y0RvR3dOb0ZoUm45SSt3eUwzV1Iz?=
 =?utf-8?B?NkNJNUNPbWxhZlc4cnkwN3RRK3U0NExOSktRalVLOTlpMWlSRVcyd0hKdTl3?=
 =?utf-8?B?YThsQ0txNUw5KzU2Nk5qNHJKNnJ2dHR4SlpWZTFXSU1pWFhWOE0xSCt1VVNm?=
 =?utf-8?B?S2FpQ2wxaGNPR05nVG5YTDFJdm5XcHpHTDFrclF2amNTVmd0SS8zWTJoR1Jh?=
 =?utf-8?B?cFR1dU9ZaG9KMEp3QTUzZnhPdklCemFCdnRSMXBMSnpvNWpYTmo3cjNTc2tD?=
 =?utf-8?B?OFgwYlI3V2tKQ2ZOR2M1RmZvQTZkWStQSXY5WFczc0JGZkZHVzB2T2Q2YzNI?=
 =?utf-8?B?WjEyS2ZURURCSEdBcmx3NTZuYVhvZzNnYzUzVUpLZ25oc0d1eFc1R2pMdVlZ?=
 =?utf-8?B?WVVoMVdaTXZjeUhmL0NrSmJjdHJzVGZKSTRYYjFsWUtXeWM5Vy9QM3BObFB0?=
 =?utf-8?B?TDZ0QmlGQ2RlQ0VDS1dGOHpwcUJzNDlLV2NwbmJ5TFZnSXVYMHhObG1OQkQ4?=
 =?utf-8?B?SjUyZmlySFRXRlBNcE55U0srN2dSVldLWUNMZWlCVmZmYXBwZDcyZG12NEV2?=
 =?utf-8?B?dmxTOW1uSEtJaGVFODc2QlZWUzNNV0NLS3VXUkNqSml5T3pLemRGaVlOcWhH?=
 =?utf-8?B?aXRyS1pJVHo3ZFJLWkE4dDdpSlhWWm5TUlZERXNSSzNtSWlGOUZ4elZKOHU0?=
 =?utf-8?B?VHNsMlQxeHdXSHkzS3dYK3NZaGYzY2NsWXVGM0wwb3ZvRDZ6MFhFV21qS3VL?=
 =?utf-8?B?M0RlTTBPdlEyVVhPa2kyTEhvMWVySDJDWE9KZzdyNGVlTnA5elMreElBei8v?=
 =?utf-8?B?RWFwYU16UXRMYnpwLzN0U1dxSmtBUmtJUU1CTG9WVmJoLzRCTFE2cUljUGZr?=
 =?utf-8?B?RWpBeCsxWmp0d3JIU1FHTDlkejhucDJqQzZRcklENGxXb0NGN2pRV2N6cHZL?=
 =?utf-8?B?SzY1Mko5NkFDZUNVSmIyV2lVMXJnUHpKanZrZk9kSHpFT1YzTXpnV09telR4?=
 =?utf-8?B?eUJXWGVya2g4dkNQaHFJKzhHYXB6OUdGUWZhMVR2enRXTlN0R20zcE5PcVI2?=
 =?utf-8?B?ckV2L0dsM1ArZ2x0OTJqM0ZRaVFscDFPWnh6WjFBNWM0UUpTUGxWN2pXeW5o?=
 =?utf-8?B?eFFvYzk3NXVUc1JWOEcwVVpiZzFGaEl6WkwrTlBoaXpucWtmZ2VnV1k1Y1Rp?=
 =?utf-8?B?aHk5dG9EYWNBMG9aMTI4WjkrVVczK1ZSWlRVYU42U1lKUWJOYVJ4R1F6ci9N?=
 =?utf-8?B?MDJDekw1L0VjYzVwNk9TUFlWV1ZHOFhWYlQ2TjhwQmF5WWZqd1FmR2xqQXRu?=
 =?utf-8?B?N0Z1UGU5WSs4QXBEaHBYU1lNMDlVU3VPNjRFUnlYNFkrRmJVanByaWVOZkdn?=
 =?utf-8?B?M2liTDVpdlRGNmpDcWdUMktra2pUWWJxWVp2Z3UvbG9IS0pNTlNvay9kTzJw?=
 =?utf-8?B?MlEvYVJReWxwbFliUTZZYUE4dVBuOGJDL3MxcmZ6TUtTMVFnNVhJYlFDVXVI?=
 =?utf-8?B?T3B6a3NJVFR2UFBUSk52WDJRazlpR1F0aXJVa2VueFE5UGROZVZxVVBuK0R4?=
 =?utf-8?B?QTNlWklkSnM0MUpYUnlkMEpFYmh3R0IrS00zcjJqVy9vOVU2RzFmN2x2aFQ4?=
 =?utf-8?Q?/3+BbmJwxNT5I7eAGJv+kCa5D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 16e3a66c-1520-4bd1-e03a-08dbd1a8d468
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7705.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2023 20:12:05.2845 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mUttuJsNd3iGuTO05HiV2MLVARSPDGrz9W82kvd5i4Zw/5NG3VdCRf9CYOUA8IpYnuy62IqllULUsmieLeACHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8022
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v9 01/12] drm/xe: Handle errors from various
 components.
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
Cc: Jani Nikula <jani.nikula@intel.com>, Matt Roper <matthew.d.roper@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


Question below about use of per-platform sparse arrays.


On 10/19/2023 9:55 PM, Himal Prasad Ghimiray wrote:
> The GFX device reports two classes of errors: uncorrectable and
> correctable. Depending on the severity uncorrectable errors are
> further classified as non fatal and fatal. Driver will only handle
> logging of errors and updating counters from various components within
> the graphics device. Anything more will be handled at system level.
> 
> Correctable and NonFatal errors are reported as interrupts, bits in
> the Master Interrupt Register will be used to convey the class of error.
> Determine source of error (IP block) by reading the Device Error Source
> Register (RW1C) that corresponds to the class of error being serviced
> 
> Fatal errors are reported as PCIe errors. When a PCIe error is asserted,
> the OS will perform a device warm reset which causes the driver to
> reload. The error registers are sticky and the values are maintained
> through a warm reset. We read these registers during the boot flow of the
> driver and increment the respective error counters.
> 
> Bspec: 50875, 53073, 53074, 53075, 53076
> 
> v6
> - Limit the implementation to DG2 and PVC.
> - Limit the tile level logging to only PVC.
> - Use xarray instead of array for error counters.
> - Squash the fatal error reporting patch with this patch.
> - use drm_dbg instead of drm_info to dump register values.
> - use XE_HW_ERR_UNSPEC for error which are reported by leaf registers.
> - use source_typeoferror_errorname convention for enum and error loging.
> - Clean unused enums and there are no display supported ras error,
> categorize them as unknown.
> - Dont make xe_assign_hw_err_regs static.
> - Use err_name_index_pair instead of err_msg_cntr_pair.(Aravind)
> 
> v7
> - Ci fix
> 
> v8
> - Avoid unnecessary write if reg is empty incase of DG2.
> 
> v9
> - For reg being blank print error for DG2 too.
> - Maintain order of headers.
> - Make XE_HW_ERR_UNSPEC 0. (Aravind)
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Reviewed-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>   drivers/gpu/drm/xe/Makefile                  |   1 +
>   drivers/gpu/drm/xe/regs/xe_regs.h            |   4 +
>   drivers/gpu/drm/xe/regs/xe_tile_error_regs.h |  13 +
>   drivers/gpu/drm/xe/xe_device.c               |  10 +
>   drivers/gpu/drm/xe/xe_device_types.h         |  13 +-
>   drivers/gpu/drm/xe/xe_hw_error.c             | 256 +++++++++++++++++++
>   drivers/gpu/drm/xe/xe_hw_error.h             |  52 ++++
>   drivers/gpu/drm/xe/xe_irq.c                  |   4 +
>   drivers/gpu/drm/xe/xe_tile.c                 |   2 +
>   9 files changed, 354 insertions(+), 1 deletion(-)
>   create mode 100644 drivers/gpu/drm/xe/regs/xe_tile_error_regs.h
>   create mode 100644 drivers/gpu/drm/xe/xe_hw_error.c
>   create mode 100644 drivers/gpu/drm/xe/xe_hw_error.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index cee57681732d..ed772f440689 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -77,6 +77,7 @@ xe-y += xe_bb.o \
>   	xe_heci_gsc.o \
>   	xe_hw_engine.o \
>   	xe_hw_engine_class_sysfs.o \
> +	xe_hw_error.o \
>   	xe_hw_fence.o \
>   	xe_huc.o \
>   	xe_huc_debugfs.o \
> diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/xe_regs.h
> index 2240cd157603..a9611ec9cf96 100644
> --- a/drivers/gpu/drm/xe/regs/xe_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_regs.h
> @@ -57,6 +57,9 @@
>   
>   #define SOFTWARE_FLAGS_SPR33			XE_REG(0x4f084)
>   
> +#define DEV_PCIEERR_STATUS			XE_REG(0x100180)
> +#define   DEV_PCIEERR_IS_FATAL(x)		REG_BIT(x * 4 + 2)
> +
>   #define GU_CNTL					XE_REG(0x101010)
>   #define   LMEM_INIT				REG_BIT(7)
>   
> @@ -95,6 +98,7 @@
>   #define   GU_MISC_IRQ				REG_BIT(29)
>   #define   DISPLAY_IRQ				REG_BIT(16)
>   #define   GT_DW_IRQ(x)				REG_BIT(x)
> +#define   XE_ERROR_IRQ(x)			REG_BIT(26 + (x))
>   
>   #define PVC_RP_STATE_CAP			XE_REG(0x281014)
>   
> diff --git a/drivers/gpu/drm/xe/regs/xe_tile_error_regs.h b/drivers/gpu/drm/xe/regs/xe_tile_error_regs.h
> new file mode 100644
> index 000000000000..ba5480fb2789
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/regs/xe_tile_error_regs.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +#ifndef XE_TILE_ERROR_REGS_H_
> +#define XE_TILE_ERROR_REGS_H_
> +
> +#define _DEV_ERR_STAT_NONFATAL                         0x100178
> +#define _DEV_ERR_STAT_CORRECTABLE                      0x10017c
> +#define DEV_ERR_STAT_REG(x)                            XE_REG(_PICK_EVEN((x), \
> +								_DEV_ERR_STAT_CORRECTABLE, \
> +								_DEV_ERR_STAT_NONFATAL))
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 8341acf66e5f..7b6487cfaf61 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -387,8 +387,18 @@ static void xe_device_remove_display(struct xe_device *xe)
>   	xe_display_driver_remove(xe);
>   }
>   
> +static void xe_hw_error_fini(struct xe_device *xe)
> +{
> +	struct xe_tile *tile;
> +	int i;
> +
> +	for_each_tile(tile, xe, i)
> +		xa_destroy(&tile->errors.hw_error);
> +}
> +
>   void xe_device_remove(struct xe_device *xe)
>   {
> +	xe_hw_error_fini(xe);
>   	xe_device_remove_display(xe);
>   
>   	xe_display_fini(xe);
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 44d622d4cc3a..d817016b4e38 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -13,8 +13,9 @@
>   #include <drm/ttm/ttm_device.h>
>   
>   #include "xe_devcoredump_types.h"
> -#include "xe_heci_gsc.h"
>   #include "xe_gt_types.h"
> +#include "xe_heci_gsc.h"
> +#include "xe_hw_error.h"
>   #include "xe_platform_types.h"
>   #include "xe_pt_types.h"
>   #include "xe_pmu.h"
> @@ -190,6 +191,11 @@ struct xe_tile {
>   
>   	/** @sysfs: sysfs' kobj used by xe_tile_sysfs */
>   	struct kobject *sysfs;
> +
> +	/** @errors: count of hardware errors reported for the tile */
> +	struct tile_hw_errors {
> +		struct xarray hw_error;
> +	} errors;
>   };
>   
>   /**
> @@ -405,6 +411,11 @@ struct xe_device {
>   	/** @heci_gsc: graphics security controller */
>   	struct xe_heci_gsc heci_gsc;
>   
> +	/** @hw_err_regs: list of hw error regs*/
> +	struct hardware_errors_regs {
> +		const struct err_name_index_pair *dev_err_stat[HARDWARE_ERROR_MAX];
> +	} hw_err_regs;
> +
>   	/* private: */
>   
>   #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
> diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
> new file mode 100644
> index 000000000000..a4f2f00823ef
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_hw_error.c
> @@ -0,0 +1,256 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#include "xe_hw_error.h"
> +
> +#include "regs/xe_regs.h"
> +#include "regs/xe_tile_error_regs.h"
> +#include "xe_device.h"
> +#include "xe_mmio.h"
> +
> +static const char *
> +hardware_error_type_to_str(const enum hardware_error hw_err)
> +{
> +	switch (hw_err) {
> +	case HARDWARE_ERROR_CORRECTABLE:
> +		return "CORRECTABLE";
> +	case HARDWARE_ERROR_NONFATAL:
> +		return "NONFATAL";
> +	case HARDWARE_ERROR_FATAL:
> +		return "FATAL";
> +	default:
> +		return "UNKNOWN";
> +	}
> +}
> +
> +static const struct err_name_index_pair dg2_err_stat_fatal_reg[] = {
> +	[0]         = {"GT",			XE_HW_ERR_TILE_UNSPEC},
> +	[1 ... 3]   = {"Undefined",		XE_HW_ERR_TILE_FATAL_UNKNOWN},
> +	[4 ... 7]   = {"Undefined",		XE_HW_ERR_TILE_FATAL_UNKNOWN},
> +	[8]         = {"GSC",			XE_HW_ERR_TILE_UNSPEC},
> +	[9 ... 11]  = {"Undefined",		XE_HW_ERR_TILE_FATAL_UNKNOWN},
> +	[12]        = {"SGUNIT",		XE_HW_ERR_TILE_FATAL_SGUNIT},
> +	[13 ... 15] = {"Undefined",             XE_HW_ERR_TILE_FATAL_UNKNOWN},
> +	[16]        = {"SOC",			XE_HW_ERR_TILE_UNSPEC},
> +	[17 ... 31] = {"Undefined",             XE_HW_ERR_TILE_FATAL_UNKNOWN},
> +};
> +
> +static const struct err_name_index_pair dg2_err_stat_nonfatal_reg[] = {
> +	[0]         = {"GT",			XE_HW_ERR_TILE_UNSPEC},
> +	[1 ... 3]   = {"Undefined",		XE_HW_ERR_TILE_NONFATAL_UNKNOWN},
> +	[4 ... 7]   = {"Undefined",		XE_HW_ERR_TILE_NONFATAL_UNKNOWN},
> +	[8]         = {"GSC",			XE_HW_ERR_TILE_UNSPEC},
> +	[9 ... 11]  = {"Undefined",		XE_HW_ERR_TILE_NONFATAL_UNKNOWN},
> +	[12]        = {"SGUNIT",		XE_HW_ERR_TILE_NONFATAL_SGUNIT},
> +	[13 ... 15] = {"Undefined",             XE_HW_ERR_TILE_NONFATAL_UNKNOWN},
> +	[16]        = {"SOC",			XE_HW_ERR_TILE_UNSPEC},
> +	[17 ... 19] = {"Undefined",             XE_HW_ERR_TILE_NONFATAL_UNKNOWN},
> +	[20]        = {"MERT",			XE_HW_ERR_TILE_NONFATAL_MERT},
> +	[21 ... 31] = {"Undefined",             XE_HW_ERR_TILE_NONFATAL_UNKNOWN},
> +};
> +
> +static const struct err_name_index_pair dg2_err_stat_correctable_reg[] = {
> +	[0]         = {"GT",			XE_HW_ERR_TILE_UNSPEC},
> +	[1 ... 3]   = {"Undefined",		XE_HW_ERR_TILE_CORR_UNKNOWN},
> +	[4 ... 7]   = {"Undefined",		XE_HW_ERR_TILE_CORR_UNKNOWN},
> +	[8]         = {"GSC",			XE_HW_ERR_TILE_UNSPEC},
> +	[9 ... 11]  = {"Undefined",		XE_HW_ERR_TILE_CORR_UNKNOWN},
> +	[12]        = {"SGUNIT",		XE_HW_ERR_TILE_CORR_SGUNIT},
> +	[13 ... 15] = {"Undefined",             XE_HW_ERR_TILE_CORR_UNKNOWN},
> +	[16]        = {"SOC",			XE_HW_ERR_TILE_UNSPEC},
> +	[17 ... 31] = {"Undefined",             XE_HW_ERR_TILE_CORR_UNKNOWN},
> +};
> +
> +static const struct err_name_index_pair pvc_err_stat_fatal_reg[] = {
> +	[0]         =  {"GT",			XE_HW_ERR_TILE_UNSPEC},
> +	[1]         =  {"SGGI Cmd Parity",	XE_HW_ERR_TILE_FATAL_SGGI},
> +	[2 ... 7]   =  {"Undefined",		XE_HW_ERR_TILE_FATAL_UNKNOWN},
> +	[8]         =  {"GSC",			XE_HW_ERR_TILE_UNSPEC},
> +	[9]         =  {"SGLI Cmd Parity",	XE_HW_ERR_TILE_FATAL_SGLI},
> +	[10 ... 12] =  {"Undefined",		XE_HW_ERR_TILE_FATAL_UNKNOWN},
> +	[13]        =  {"SGCI Cmd Parity",	XE_HW_ERR_TILE_FATAL_SGCI},
> +	[14 ... 15] =  {"Undefined",		XE_HW_ERR_TILE_FATAL_UNKNOWN},
> +	[16]        =  {"SOC ERROR",		XE_HW_ERR_TILE_UNSPEC},
> +	[17 ... 19] =  {"Undefined",		XE_HW_ERR_TILE_FATAL_UNKNOWN},
> +	[20]        =  {"MERT Cmd Parity",	XE_HW_ERR_TILE_FATAL_MERT},
> +	[21 ... 31] =  {"Undefined",		XE_HW_ERR_TILE_FATAL_UNKNOWN},
> +};
> +
> +static const struct err_name_index_pair pvc_err_stat_nonfatal_reg[] = {
> +	[0]         =  {"GT",			XE_HW_ERR_TILE_UNSPEC},
> +	[1]         =  {"SGGI Data Parity",	XE_HW_ERR_TILE_NONFATAL_SGGI},
> +	[2 ... 7]   =  {"Undefined",		XE_HW_ERR_TILE_NONFATAL_UNKNOWN},
> +	[8]         =  {"GSC",			XE_HW_ERR_TILE_UNSPEC},
> +	[9]         =  {"SGLI Data Parity",	XE_HW_ERR_TILE_NONFATAL_SGLI},
> +	[10 ... 12] =  {"Undefined",		XE_HW_ERR_TILE_NONFATAL_UNKNOWN},
> +	[13]        =  {"SGCI Data Parity",	XE_HW_ERR_TILE_NONFATAL_SGCI},
> +	[14 ... 15] =  {"Undefined",		XE_HW_ERR_TILE_NONFATAL_UNKNOWN},
> +	[16]        =  {"SOC",			XE_HW_ERR_TILE_UNSPEC},
> +	[17 ... 19] =  {"Undefined",		XE_HW_ERR_TILE_NONFATAL_UNKNOWN},
> +	[20]        =  {"MERT Data Parity",	XE_HW_ERR_TILE_NONFATAL_MERT},
> +	[21 ... 31] =  {"Undefined",            XE_HW_ERR_TILE_NONFATAL_UNKNOWN},
> +};
> +
> +static const struct err_name_index_pair pvc_err_stat_correctable_reg[] = {
> +	[0]         =  {"GT",			XE_HW_ERR_TILE_UNSPEC},
> +	[1 ... 7]   =  {"Undefined",		XE_HW_ERR_TILE_CORR_UNKNOWN},
> +	[8]         =  {"GSC",			XE_HW_ERR_TILE_UNSPEC},
> +	[9 ... 31]  =  {"Undefined",		XE_HW_ERR_TILE_CORR_UNKNOWN},
> +};
> +

Looking at all the above arrays makes me wonder if it will get unwieldy 
over time.  And a given platform doesn't need all these taking up 
memory.  These are effectively sparse arrays too, as having the entry 
unset could default to "Undefined" in the error handlers.

Alternative to above would be to build these at run-time into an Xarray
for each. Then only need to build these for the running platform.
You can still have have a (single) 'struct err_name_index_pair' array 
that holds the valid entries that would exist across all platforms.  And 
xa_store those into the appropriate index when building xarray for the 
platform at runtime, if that makes sense.

On the other hand, maybe this is not worthwhile to optimize.
Just wanted to ask if this was discussed or considered before or not.

-Brian


> +void xe_assign_hw_err_regs(struct xe_device *xe)
> +{
> +	const struct err_name_index_pair **dev_err_stat = xe->hw_err_regs.dev_err_stat;
> +
> +	/* Error reporting is supported only for DG2 and PVC currently. */
> +	if (xe->info.platform == XE_DG2) {
> +		dev_err_stat[HARDWARE_ERROR_CORRECTABLE] = dg2_err_stat_correctable_reg;
> +		dev_err_stat[HARDWARE_ERROR_NONFATAL] = dg2_err_stat_nonfatal_reg;
> +		dev_err_stat[HARDWARE_ERROR_FATAL] = dg2_err_stat_fatal_reg;
> +	}
> +
> +	if (xe->info.platform == XE_PVC) {
> +		dev_err_stat[HARDWARE_ERROR_CORRECTABLE] = pvc_err_stat_correctable_reg;
> +		dev_err_stat[HARDWARE_ERROR_NONFATAL] = pvc_err_stat_nonfatal_reg;
> +		dev_err_stat[HARDWARE_ERROR_FATAL] = pvc_err_stat_fatal_reg;
> +	}
> +}
> +
> +static bool xe_platform_has_ras(struct xe_device *xe)
> +{
> +	if (xe->info.platform == XE_PVC || xe->info.platform == XE_DG2)
> +		return true;
> +
> +	return false;
> +}
> +
> +static void
> +xe_update_hw_error_cnt(struct drm_device *drm, struct xarray *hw_error, unsigned long index)
> +{
> +	unsigned long flags;
> +	void *entry;
> +
> +	entry = xa_load(hw_error, index);
> +	entry = xa_mk_value(xa_to_value(entry) + 1);
> +
> +	xa_lock_irqsave(hw_error, flags);
> +	if (xa_is_err(__xa_store(hw_error, index, entry, GFP_ATOMIC)))
> +		drm_err_ratelimited(drm,
> +				    HW_ERR "Error reported by index %ld is lost\n", index);
> +	xa_unlock_irqrestore(hw_error, flags);
> +}
> +
> +static void
> +xe_hw_error_source_handler(struct xe_tile *tile, const enum hardware_error hw_err)
> +{
> +	const char *hw_err_str = hardware_error_type_to_str(hw_err);
> +	const struct hardware_errors_regs *err_regs;
> +	const struct err_name_index_pair *errstat;
> +	unsigned long errsrc;
> +	unsigned long flags;
> +	const char *name;
> +	struct xe_gt *gt;
> +	u32 indx;
> +	u32 errbit;
> +
> +	if (!xe_platform_has_ras(tile_to_xe(tile)))
> +		return;
> +
> +	spin_lock_irqsave(&tile_to_xe(tile)->irq.lock, flags);
> +	err_regs = &tile_to_xe(tile)->hw_err_regs;
> +	errstat = err_regs->dev_err_stat[hw_err];
> +	gt = tile->primary_gt;
> +	errsrc = xe_mmio_read32(gt, DEV_ERR_STAT_REG(hw_err));
> +	if (!errsrc) {
> +		drm_err_ratelimited(&tile_to_xe(tile)->drm, HW_ERR
> +				    "TILE%d reported DEV_ERR_STAT_REG_%s blank!\n",
> +				    tile->id, hw_err_str);
> +		goto unlock;
> +	}
> +
> +	if (tile_to_xe(tile)->info.platform != XE_DG2)
> +		drm_dbg(&tile_to_xe(tile)->drm, HW_ERR
> +			"TILE%d reported DEV_ERR_STAT_REG_%s=0x%08lx\n",
> +			tile->id, hw_err_str, errsrc);
> +
> +	for_each_set_bit(errbit, &errsrc, XE_RAS_REG_SIZE) {
> +		name = errstat[errbit].name;
> +		indx = errstat[errbit].index;
> +
> +		if (hw_err == HARDWARE_ERROR_CORRECTABLE &&
> +		    tile_to_xe(tile)->info.platform != XE_DG2)
> +			drm_warn(&tile_to_xe(tile)->drm,
> +				 HW_ERR "TILE%d reported %s %s error, bit[%d] is set\n",
> +				 tile->id, name, hw_err_str, errbit);
> +
> +		else if (tile_to_xe(tile)->info.platform != XE_DG2)
> +			drm_err_ratelimited(&tile_to_xe(tile)->drm,
> +					    HW_ERR "TILE%d reported %s %s error, bit[%d] is set\n",
> +					    tile->id, name, hw_err_str, errbit);
> +
> +		if (indx != XE_HW_ERR_TILE_UNSPEC)
> +			xe_update_hw_error_cnt(&tile_to_xe(tile)->drm,
> +					       &tile->errors.hw_error, indx);
> +	}
> +
> +	xe_mmio_write32(gt, DEV_ERR_STAT_REG(hw_err), errsrc);
> +unlock:
> +	spin_unlock_irqrestore(&tile_to_xe(tile)->irq.lock, flags);
> +}
> +
> +/*
> + * XE Platforms adds three Error bits to the Master Interrupt
> + * Register to support error handling. These three bits are
> + * used to convey the class of error:
> + * FATAL, NONFATAL, or CORRECTABLE.
> + *
> + * To process an interrupt:
> + *       Determine source of error (IP block) by reading
> + *	 the Device Error Source Register (RW1C) that
> + *	 corresponds to the class of error being serviced
> + *	 and log the error.
> + */
> +void
> +xe_hw_error_irq_handler(struct xe_tile *tile, const u32 master_ctl)
> +{
> +	enum hardware_error hw_err;
> +
> +	for (hw_err = 0; hw_err < HARDWARE_ERROR_MAX; hw_err++) {
> +		if (master_ctl & XE_ERROR_IRQ(hw_err))
> +			xe_hw_error_source_handler(tile, hw_err);
> +	}
> +}
> +
> +/*
> + * xe_process_hw_errors - checks for the occurrence of HW errors
> + *
> + * Fatal will result in a card warm reset and driver will be reloaded.
> + * This checks for the HW Errors that might have occurred in the
> + * previous boot of the driver.
> + */
> +void xe_process_hw_errors(struct xe_device *xe)
> +{
> +	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
> +	struct xe_gt *root_gt = root_tile->primary_gt;
> +
> +	u32 dev_pcieerr_status, master_ctl;
> +	struct xe_tile *tile;
> +	int i;
> +
> +	dev_pcieerr_status = xe_mmio_read32(root_gt, DEV_PCIEERR_STATUS);
> +
> +	for_each_tile(tile, xe, i) {
> +		struct xe_gt *gt = tile->primary_gt;
> +
> +		if (dev_pcieerr_status & DEV_PCIEERR_IS_FATAL(i))
> +			xe_hw_error_source_handler(tile, HARDWARE_ERROR_FATAL);
> +
> +		master_ctl = xe_mmio_read32(gt, GFX_MSTR_IRQ);
> +		xe_hw_error_irq_handler(tile, master_ctl);
> +		xe_mmio_write32(gt, GFX_MSTR_IRQ, master_ctl);
> +	}
> +	if (dev_pcieerr_status)
> +		xe_mmio_write32(root_gt, DEV_PCIEERR_STATUS, dev_pcieerr_status);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_hw_error.h b/drivers/gpu/drm/xe/xe_hw_error.h
> new file mode 100644
> index 000000000000..1932f64e26da
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_hw_error.h
> @@ -0,0 +1,52 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +#ifndef XE_HW_ERRORS_H_
> +#define XE_HW_ERRORS_H_
> +
> +#include <linux/stddef.h>
> +#include <linux/types.h>
> +
> +#define XE_RAS_REG_SIZE 32
> +
> +/* Error categories reported by hardware */
> +enum hardware_error {
> +	HARDWARE_ERROR_CORRECTABLE = 0,
> +	HARDWARE_ERROR_NONFATAL = 1,
> +	HARDWARE_ERROR_FATAL = 2,
> +	HARDWARE_ERROR_MAX,
> +};
> +
> +/* Count of Correctable and Uncorrectable errors reported on tile */
> +enum xe_tile_hw_errors {
> +	XE_HW_ERR_TILE_UNSPEC = 0,
> +	XE_HW_ERR_TILE_FATAL_SGGI,
> +	XE_HW_ERR_TILE_FATAL_SGLI,
> +	XE_HW_ERR_TILE_FATAL_SGUNIT,
> +	XE_HW_ERR_TILE_FATAL_SGCI,
> +	XE_HW_ERR_TILE_FATAL_MERT,
> +	XE_HW_ERR_TILE_FATAL_UNKNOWN,
> +	XE_HW_ERR_TILE_NONFATAL_SGGI,
> +	XE_HW_ERR_TILE_NONFATAL_SGLI,
> +	XE_HW_ERR_TILE_NONFATAL_SGUNIT,
> +	XE_HW_ERR_TILE_NONFATAL_SGCI,
> +	XE_HW_ERR_TILE_NONFATAL_MERT,
> +	XE_HW_ERR_TILE_NONFATAL_UNKNOWN,
> +	XE_HW_ERR_TILE_CORR_SGUNIT,
> +	XE_HW_ERR_TILE_CORR_UNKNOWN,
> +};
> +
> +struct err_name_index_pair {
> +	const char *name;
> +	const u32 index;
> +};
> +
> +struct xe_device;
> +struct xe_tile;
> +
> +void xe_hw_error_irq_handler(struct xe_tile *tile, const u32 master_ctl);
> +void xe_assign_hw_err_regs(struct xe_device *xe);
> +void xe_process_hw_errors(struct xe_device *xe);
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
> index 61350ed32c61..8365a4cb0c45 100644
> --- a/drivers/gpu/drm/xe/xe_irq.c
> +++ b/drivers/gpu/drm/xe/xe_irq.c
> @@ -444,6 +444,7 @@ static irqreturn_t dg1_irq_handler(int irq, void *arg)
>   		xe_mmio_write32(mmio, GFX_MSTR_IRQ, master_ctl);
>   
>   		gt_irq_handler(tile, master_ctl, intr_dw, identity);
> +		xe_hw_error_irq_handler(tile, master_ctl);
>   
>   		/*
>   		 * Display interrupts (including display backlight operations
> @@ -619,6 +620,9 @@ int xe_irq_install(struct xe_device *xe)
>   		return -EINVAL;
>   	}
>   
> +	xe_assign_hw_err_regs(xe);
> +	xe_process_hw_errors(xe);
> +
>   	xe_irq_reset(xe);
>   
>   	err = pci_alloc_irq_vectors(pdev, 1, 1, PCI_IRQ_MSI | PCI_IRQ_MSIX);
> diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
> index 131752a57f65..bc79145eadc0 100644
> --- a/drivers/gpu/drm/xe/xe_tile.c
> +++ b/drivers/gpu/drm/xe/xe_tile.c
> @@ -84,6 +84,8 @@ int xe_tile_alloc(struct xe_tile *tile)
>   {
>   	struct drm_device *drm = &tile_to_xe(tile)->drm;
>   
> +	xa_init(&tile->errors.hw_error);
> +
>   	tile->mem.ggtt = drmm_kzalloc(drm, sizeof(*tile->mem.ggtt),
>   				      GFP_KERNEL);
>   	if (!tile->mem.ggtt)
