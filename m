Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC5CEC61DF4
	for <intel-xe@archiver.kernel.org>; Fri, 24 Nov 2023 11:06:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 994B510E1BC;
	Fri, 24 Nov 2023 11:06:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26ECD10E1BC
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Nov 2023 11:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700823961; x=1732359961;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=O9Qd4bSFRd+tiKJ6M85tQG0nArkLwmNOC5UmD5v08og=;
 b=QK+iYAbpX+2v3buDad9TmO95+xDGVV0nV4YA5nzvi4LwlxmMNa+0YYid
 z+fvs6F0PzfefWcCPXlvFUfNRWnBXdXrIKfNtVI6bJGxQjbQCPMc6h/qS
 ZMCY1/9YNTcACYndEb4iBvAyk0wDhoLySYoIPeyloZ+77QW8P7CJmVcyH
 2iT31EZUcaB7dpgzdeHBcyb3WFTQ4wHoDudHLZLSfgL68CFcx5Fo5yFv1
 0t96z0KTlSmDlwq5FvSIcpOUO0AOa5UwsB0V720TwSlbV+jera34nJ0J3
 oeGL0r0w4/icpWttckKzoEpvnvu3KqpOdvny7ELhnE2b9whiY0QUo3NyD w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="458893746"
X-IronPort-AV: E=Sophos;i="6.04,223,1695711600"; d="scan'208";a="458893746"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2023 03:05:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="833666804"
X-IronPort-AV: E=Sophos;i="6.04,223,1695711600"; d="scan'208";a="833666804"
Received: from cschimpe-mobl1.ger.corp.intel.com (HELO [10.249.254.175])
 ([10.249.254.175])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2023 03:05:46 -0800
Message-ID: <0876b09852ce6391b04be329692a29b161ec5154.camel@linux.intel.com>
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>, 
 intel-xe@lists.freedesktop.org
Date: Fri, 24 Nov 2023 12:05:43 +0100
In-Reply-To: <20231121100906.3587649-3-himal.prasad.ghimiray@intel.com>
References: <20231121100906.3587649-1-himal.prasad.ghimiray@intel.com>
 <20231121100906.3587649-3-himal.prasad.ghimiray@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
Subject: Re: [Intel-xe] [RFC v2 2/6] drm/xe/xe2: Determine bios enablement
 for flat ccs on igfx.
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

T24gVHVlLCAyMDIzLTExLTIxIGF0IDE1OjM5ICswNTMwLCBIaW1hbCBQcmFzYWQgR2hpbWlyYXkg
d3JvdGU6Cj4gSWYgYmlvcyBkaXNhYmxlcyBmbGF0IGNjcyBvbiBpZ2Z4wqAgbWFrZSBoYXNfZmxh
dF9jY3MgYXMgMCBhbmQgbm90aWZ5CmRvdWJsZSBzcGFjZSBhYm92ZSAgICAgICAgICAgICAgICAg
Xl4KPiAKPiB2aWEgZHJtX2luZm8uCj4gCj4gQnNwZWM6NTkyNTUKPiAKPiBDYzogVGhvbWFzIEhl
bGxzdHLDtm0gPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPgo+IFNpZ25lZC1vZmYt
Ynk6IEhpbWFsIFByYXNhZCBHaGltaXJheQo+IDxoaW1hbC5wcmFzYWQuZ2hpbWlyYXlAaW50ZWwu
Y29tPgo+IC0tLQo+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3JlZ3MveGVfZ3RfcmVncy5oIHzCoCAz
ICsrKwo+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZS5jwqDCoMKgwqDCoMKgIHwgMzAK
PiArKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gwqAyIGZpbGVzIGNoYW5nZWQsIDMzIGlu
c2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3JlZ3MveGVf
Z3RfcmVncy5oCj4gYi9kcml2ZXJzL2dwdS9kcm0veGUvcmVncy94ZV9ndF9yZWdzLmgKPiBpbmRl
eCBjYzI3ZmU4ZmMzNjMuLmI2NDIzMDE5NDdmNSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0veGUvcmVncy94ZV9ndF9yZWdzLmgKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUvcmVncy94
ZV9ndF9yZWdzLmgKPiBAQCAtMTQyLDYgKzE0Miw5IEBACj4gwqAjZGVmaW5lIFhFSFBfU0xJQ0Vf
Q09NTU9OX0VDT19DSElDS0VOMcKgwqDCoMKgwqDCoMKgwqDCoFhFX1JFR19NQ1IoMHg3MzFjLAo+
IFhFX1JFR19PUFRJT05fTUFTS0VEKQo+IMKgI2RlZmluZcKgwqAgTVNDX01TQUFfUkVPREVSX0JV
Rl9CWVBBU1NfRElTQUJMRcKgwqDCoFJFR19CSVQoMTQpCj4gwqAKPiArI2RlZmluZSBYRTJfRkxB
VF9DQ1NfQkFTRV9SQU5HRV9MT1dFUsKgwqDCoMKgwqDCoMKgwqDCoMKgWEVfUkVHX01DUigweDg4
MDApCj4gKyNkZWZpbmXCoMKgIFhFMl9GTEFUX0NDU19FTkFCTEXCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqBSRUdfQklUKDApCj4gKwo+IMKgI2RlZmluZSBWRl9QUkVFTVBUSU9O
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoFhFX1JF
RygweDgzYTQsCj4gWEVfUkVHX09QVElPTl9NQVNLRUQpCj4gwqAjZGVmaW5lwqDCoCBQUkVFTVBU
SU9OX1ZFUlRFWF9DT1VOVMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBSRUdfR0VOTUFTSygx
NSwgMCkKPiDCoAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlLmMK
PiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2UuYwo+IGluZGV4IDhiZTc2NWFkZjcwMi4u
MDdhM2U0Y2Y0OGQxIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2Uu
Ywo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2UuYwo+IEBAIC0xNiw2ICsxNiw3
IEBACj4gwqAjaW5jbHVkZSA8ZHJtL3hlX2RybS5oPgo+IMKgCj4gwqAjaW5jbHVkZSAicmVncy94
ZV9yZWdzLmgiCj4gKyNpbmNsdWRlICJyZWdzL3hlX2d0X3JlZ3MuaCIKPiDCoCNpbmNsdWRlICJ4
ZV9iby5oIgo+IMKgI2luY2x1ZGUgInhlX2RlYnVnZnMuaCIKPiDCoCNpbmNsdWRlICJ4ZV9kaXNw
bGF5LmgiCj4gQEAgLTI1LDYgKzI2LDcgQEAKPiDCoCNpbmNsdWRlICJ4ZV9leGVjX3F1ZXVlLmgi
Cj4gwqAjaW5jbHVkZSAieGVfZXhlYy5oIgo+IMKgI2luY2x1ZGUgInhlX2d0LmgiCj4gKyNpbmNs
dWRlICJ4ZV9ndF9tY3IuaCIKPiDCoCNpbmNsdWRlICJ4ZV9pcnEuaCIKPiDCoCNpbmNsdWRlICJ4
ZV9tbWlvLmgiCj4gwqAjaW5jbHVkZSAieGVfbW9kdWxlLmgiCj4gQEAgLTM0Miw2ICszNDQsMjkg
QEAgc3RhdGljIHZvaWQgeGVfZGV2aWNlX3Nhbml0aXplKHN0cnVjdCBkcm1fZGV2aWNlCj4gKmRy
bSwgdm9pZCAqYXJnKQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgeGVfZ3Rfc2Fu
aXRpemUoZ3QpOwo+IMKgfQo+IMKgCj4gK3N0YXRpYyBpbnQgeGVfZGV2aWNlX3NldF9oYXNfZmxh
dF9jY3Moc3RydWN0wqAgeGVfZGV2aWNlICp4ZSkKPiArewo+ICvCoMKgwqDCoMKgwqDCoHUzMiBy
ZWc7Cj4gK8KgwqDCoMKgwqDCoMKgaW50IGVycjsKPiArCj4gK8KgwqDCoMKgwqDCoMKgaWYgKElT
X0RHRlgoeGUpIHx8IEdSQVBISUNTX1ZFUih4ZSkgPCAyMCB8fCAheGUtCj4gPmluZm8uaGFzX2Zs
YXRfY2NzKQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gMDsKCkRlcGVu
ZGluZyBvbiB0aGUgb3V0Y29tZSBvZiB0aGUgaW9tbXUgZGlzY3Vzc2lvbiB3ZSBtaWdodCBuZWVk
IHRvIGNoZWNrCmZvciBpb21tdSBwcmVzZW50IGhlcmUgYXMgd2VsbD8KCj4gKwo+ICvCoMKgwqDC
oMKgwqDCoHN0cnVjdCB4ZV9ndCAqZ3QgPSB4ZV9yb290X21taW9fZ3QoeGUpOwo+ICsKPiArwqDC
oMKgwqDCoMKgwqBlcnIgPSB4ZV9mb3JjZV93YWtlX2dldChndF90b19mdyhndCksIFhFX0ZXX0dU
KTsKPiArwqDCoMKgwqDCoMKgwqBpZiAoZXJyKQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqByZXR1cm4gZXJyOwo+ICsKPiArwqDCoMKgwqDCoMKgwqByZWcgPSB4ZV9ndF9tY3JfdW5p
Y2FzdF9yZWFkX2FueShndCwKPiBYRTJfRkxBVF9DQ1NfQkFTRV9SQU5HRV9MT1dFUik7Cj4gK8Kg
wqDCoMKgwqDCoMKgeGUtPmluZm8uaGFzX2ZsYXRfY2NzID0gKHJlZyAmIFhFMl9GTEFUX0NDU19F
TkFCTEUpOwo+ICsKPiArwqDCoMKgwqDCoMKgwqBpZiAoIXhlLT5pbmZvLmhhc19mbGF0X2NjcykK
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZHJtX2luZm8oJnhlLT5kcm0sCj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgIkZsYXQgQ0NTIGhh
cyBiZWVuIGRpc2FibGVkIGluIGJpb3MsIE1heQo+IGxlYWQgdG8gcGVyZm9ybWFuY2UgaW1wYWN0
Iik7Cj4gK8KgwqDCoMKgwqDCoMKgcmV0dXJuIDA7Cj4gK30KPiArCj4gwqBpbnQgeGVfZGV2aWNl
X3Byb2JlKHN0cnVjdCB4ZV9kZXZpY2UgKnhlKQo+IMKgewo+IMKgwqDCoMKgwqDCoMKgwqBzdHJ1
Y3QgeGVfdGlsZSAqdGlsZTsKPiBAQCAtMzUyLDYgKzM3Nyw3IEBAIGludCB4ZV9kZXZpY2VfcHJv
YmUoc3RydWN0IHhlX2RldmljZSAqeGUpCj4gwqDCoMKgwqDCoMKgwqDCoHhlX3BhdF9pbml0X2Vh
cmx5KHhlKTsKPiDCoAo+IMKgwqDCoMKgwqDCoMKgwqB4ZS0+aW5mby5tZW1fcmVnaW9uX21hc2sg
PSAxOwo+ICsKClVucmVsYXRlZCBjaGFuZ2UuCgo+IMKgwqDCoMKgwqDCoMKgwqBlcnIgPSB4ZV9k
aXNwbGF5X2luaXRfbm9tbWlvKHhlKTsKPiDCoMKgwqDCoMKgwqDCoMKgaWYgKGVycikKPiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybiBlcnI7Cj4gQEAgLTM5MCw2ICs0MTYs
MTAgQEAgaW50IHhlX2RldmljZV9wcm9iZShzdHJ1Y3QgeGVfZGV2aWNlICp4ZSkKPiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBnb3RvIGVycl9pcnFfc2h1
dGRvd247Cj4gwqDCoMKgwqDCoMKgwqDCoH0KPiDCoAo+ICvCoMKgwqDCoMKgwqDCoGVyciA9IHhl
X2RldmljZV9zZXRfaGFzX2ZsYXRfY2NzKHhlKTsKPiArwqDCoMKgwqDCoMKgwqBpZiAoZXJyKQo+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gZXJyOwo+ICsKPiDCoMKgwqDC
oMKgwqDCoMKgZXJyID0geGVfbW1pb19wcm9iZV92cmFtKHhlKTsKPiDCoMKgwqDCoMKgwqDCoMKg
aWYgKGVycikKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGdvdG8gZXJyX2lycV9z
aHV0ZG93bjsKCg==

